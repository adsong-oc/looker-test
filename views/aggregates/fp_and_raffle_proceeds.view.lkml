include: "./events_for_org.view.lkml"

view: fp_and_raffle_proceeds {
  derived_table: {
    sql: SELECT
        ve.id as event_id,
        'Raffle & Fixed Price Sales' as agg_type,
        3 as display_order,
        IFNULL(SUM(pi.amount_cents), 0) AS total_amount_cents
      FROM
        ${events_for_org.SQL_TABLE_NAME} ve
      LEFT JOIN
        `dev-phaas-virtualevent-api`.purchased_item pi ON ve.id = pi.event_id
        AND NOT pi.deleted
        AND pi.transaction_status != 'failed'
        AND pi.type IN ('vevt-fixed-price','vevt-raffle')
      GROUP BY ve.id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: total_amount_cents {
    type: number
    sql: ${TABLE}.total_amount_cents ;;
  }

  dimension: agg_type {
    type:  string
    sql:  ${TABLE}.agg_type ;;
  }

  dimension: display_order {
    type:  number
    sql:  ${TABLE}.display_order ;;
  }

  set: detail {
    fields: [event_id, total_amount_cents]
  }
}
