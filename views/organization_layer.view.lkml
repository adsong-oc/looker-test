view: organization_layer {
  sql_table_name: `dev-phaas-org-api`.organization_layer
    ;;
  drill_fields: [parent_organization_layer_id]

  dimension: parent_organization_layer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.parent_organization_layer_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: layer_name {
    type: string
    sql: ${TABLE}.layer_name ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated ;;
  }

  measure: count {
    type: count
    drill_fields: [parent_organization_layer_id, layer_name]
  }
}
