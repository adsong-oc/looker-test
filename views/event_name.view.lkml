view: event_name {
  derived_table: {
    sql: SELECT id, name FROM `dev-phaas-virtualevent-api`.virtual_event WHERE NOT deleted AND organization_id='52306949-257b-4321-af7a-6bf5a81d0023'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  set: detail {
    fields: [id, name]
  }
}
