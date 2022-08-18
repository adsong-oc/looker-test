view: feature_flag {
  sql_table_name: `dev-phaas-chrome-api`.feature_flag
    ;;
  drill_fields: [feature_flag_id]

  dimension: feature_flag_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.feature_flag_id ;;
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

  dimension: disabled {
    type: yesno
    sql: ${TABLE}.disabled ;;
  }

  dimension: entity_id {
    type: string
    sql: ${TABLE}.entity_id ;;
  }

  dimension: feature_name {
    type: string
    sql: ${TABLE}.feature_name ;;
  }

  dimension: flag {
    type: string
    sql: ${TABLE}.flag ;;
  }

  measure: count {
    type: count
    drill_fields: [feature_flag_id, feature_name]
  }
}
