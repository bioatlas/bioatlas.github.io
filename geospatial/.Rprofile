server_config <- list(
  max_occurrence_records = 500000,
  server_max_url_length = 8150,
  brand = "ALA4R",
  notify = "Please use https://github.com/AtlasOfLivingAustralia/ALA4R/issues/ or email to support@ala.org.au",
  support_email = "support@ala.org.au",
  reasons_function = "ala_reasons",
  fields_function = "ala_fields",
  occurrences_function = "occurrences",
  config_function = "ala_config",
  # this setting seems to be needed by the occurrences() function?
  base_url_spatial = "https://spatial.ala.org.au/layers-service/",
  # base_url_bie = "https://bioatlas.se/bie/",
  base_url_bie = "http://bie.ala.org.au/ws/",
  base_url_biocache = "https://bioatlas.se/biocache-service",
  # base_url_alaspatial = "https://bioatlas.se/alaspatial/",
  base_url_images = "https://bioatlas.se/images/",
  base_url_logger = "https://bioatlas.se/logger-service/service/logger/",
  # base_url_fieldguide = "https://bioatlas.se/fieldguide/",
  # base_url_lists = "https://bioatlas.se/lists/"
  biocache_version = "1.9",
  verbose = TRUE,
  download_reason_id = 10,
  caching = "off"
)

if (!"ALA4R_server_config" %in% names(options())) {
  message("\nNo existing ALA4R server config, using Swedish data sources...\n")
  options(ALA4R_server_config = server_config)
} else {
  message("Overwriting existing ALA server config with new...")
  options(ALA4R_server_config = server_config)
}

message("\n*** Successfully loaded .Rprofile ***\n")