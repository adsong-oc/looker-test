view: feature {
  sql_table_name: `dev-phaas-chrome-api`.feature
    ;;

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
