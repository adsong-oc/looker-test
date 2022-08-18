view: schema_migrations {
  sql_table_name: `dev-phaas-chrome-api`.schema_migrations
    ;;

  dimension: dirty {
    type: yesno
    sql: ${TABLE}.dirty ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
