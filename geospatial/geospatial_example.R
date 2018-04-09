source("~/repos/bioatlas.github.io/geospatial/.Rprofile")
library(ALA4R)
library(ape)
library(phytools)

# uses BIE from Australia to resolve vernacular name

sx <- search_fulltext("moose")

first_hit <- sx$data[,c("name","rank")]$name[1]
binomen <- stringr::word(first_hit, start = 1, end = 2)
genus <- stringr::word(binomen, 1)
species <- stringr::word(binomen, 2)

n_records <- 
  occurrences(
    fq = c(paste0("genus:", genus), c(paste0("species:", species))), 
    record_count_only = TRUE, 
    use_layer_names = FALSE)

message("Total record cound for ", binomen, " is ", n_records)

library(tidyverse)
library(DT)

# use cached df if exists
if (!exists("alces.Rda")) {
  df <- occurrences(
    fq = c(paste0("genus:", genus), c(paste0("species:", species))), 
    download_reason_id = 10, 
    use_layer_names = FALSE
  )
  saveRDS("alces.Rda")
} else {
  df <- readRDS("alces.Rda")
}

# inspect the occurrence data as text table
occ <- 
  df$data #%>% 
#  head(100)

as_tibble(occ)

#  occ %>% distinct(collectionCode, institutionCode)

occ_df <- occ %>% 
  select(catalogNumber, institutionCode, collectionCode, locality) %>%
  head(100)

datatable(occ_df)

meta <- as_tibble(df$meta)
meta

# show citation info
citation <- as_tibble(meta$Name, meta$Citation)
datatable(citation)

family <- 
  taxinfo_download("Moose") %>%
  filter(genus == "Alces") %>%
  .$family

tx <- 
  taxinfo_download(paste0("rk_family:", family), 
  fields = c("guid", "rk_genus", "scientificName", "rank")) %>%
  # restrict to species and subspecies
  filter(rank %in% c("species", "subspecies"))

temp <- data.frame(genus = tx$genus, scientificName = tx$scientificName)
## create phylo object of Scientific.Name nested within Genus
ax <- as.phylo(~genus/scientificName, data = temp)
plotTree(ax, type = "fan", fsize = 0.7)

download.file(destfile = "/tmp/counties.zip", url = paste0(
  "http://slwgeo.artdata.slu.se:8080/geoserver/SLW/ows", 
  "?service=WFS&version=1.0.0&request=GetFeature",
  "&typeName=SLW:artdatabankenslanskarta",
  "&maxFeatures=50&outputFormat=SHAPE-ZIP"
))

unzip("/tmp/counties.zip", exdir = "/tmp")
dsn <- "/tmp/artdatabankenslanskarta.shp"
p4s_orig <- sp::CRS(rgdal::ogrInfo(dsn)$p4s)
p4s_dest <- sp::CRS("+init=epsg:4326")
shape <- rgdal::readOGR(dsn, 
  encoding = "ISO-8859-1", use_iconv = TRUE)
shape <- shape[shape$namn == "JÄMTLANDS LÄN",]

sp::spplot(shape)


shape_new <- sp::spTransform(shape, p4s_dest)
sp::spplot(shape_new)
shape <- shape_new

simplify_polygon <- function(shape) {
  
  lonlat <- shape@polygons[[1]]@Polygons[[1]]@coords
  temp <- chull(lonlat)
  lonlat <- lonlat[c(temp,temp[1]),] 
  ## create WKT string
  wkt <- paste(sep = "",
    "POLYGON((",
      paste(apply(lonlat, 1 , function(z) 
        paste(z, collapse = " ")), collapse = ","),"))"
    )  
}

wkt <- simplify_polygon(shape)
wkt
wicket::validate_wkt(wkt)

library(tidyverse)

fq = c(paste0("genus:", genus), c(paste0("species:", species)))

res <- as_tibble(specieslist(taxon = "*", wkt = wkt))

# download occurrences from within a specific area (Jämtland)
if (!exists("alces-jämtland.Rda")) {
  occ_alces_alces <- as_tibble(occurrences("Alces alces", wkt, download_reason_id = 10)$data)
  saveRDS(occ_alces_alces, "alces-jämtland.Rda")
} else {
  occ_alces_alces <- readRDS("alces-jämtland.Rda")  
}

# occ_alces_alces %>% count(year(parse_date_time(occ_alces_alces$eventDate, orders = "ymd")))

library(leaflet)
library(wellknown)

my_geojson <- wkt2geojson(wkt)
my_geojson$properties <- ""

readr::write_lines(as_json(wkt2geojson(wkt)), "file.geojson")
res <- rgdal::readOGR(dsn = "file.geojson", layer = "OGRGeoJSON")

leaflet(occ_alces_alces) %>%
  addTiles(urlTemplate = "//tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png") %>%
  addCircleMarkers(lng = ~longitude, lat = ~latitude, radius = 2, color = "darkred") %>%
  addGeoJSON(geojson = my_geojson, color = "pink") %>%
  addPolygons(data = shape)

# see http://r-spatial.org/r/2017/01/30/mapedit_intro.html


