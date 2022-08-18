connection: "dev"

# include all the views
include: "/views/**/*.view"

datagroup: dive2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dive2_default_datagroup

explore: feature {}

explore: feature_flag {}

explore: schema_migrations {}

explore: matts_sum {}
