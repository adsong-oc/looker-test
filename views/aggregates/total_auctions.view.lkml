include: "./events_for_org.view.lkml"

view: total_auctions {
  derived_table: {
    sql: WITH type_total AS (
        SELECT
          pi.event_id,
          IFNULL(SUM(pi.amount_cents),0) as total_amount_cents
        FROM
          `dev-phaas-virtualevent-api`.purchased_item pi
        WHERE
          NOT pi.deleted
          AND pi.transaction_status != 'failed'
          AND {% condition organization_id %} pi.organization_id {% endcondition %}
          AND pi.type IN ('vevt-auction-lot')
        GROUP BY pi.event_id
      )
      SELECT
        ve.id as event_id,
        'Auctions' as agg_type,
        IFNULL(type_total.total_amount_cents, 0) AS total_amount_cents
      FROM
        ${events_for_org.SQL_TABLE_NAME} ve
      LEFT JOIN
        type_total ON type_total.event_id = ve.id
 ;;
  }

  filter: organization_id {
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: auctions {
    type:  number
    sql: ${TABLE}.total_amount_cents/100 ;;
    value_format_name: usd
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

  set: detail {
    fields: [event_id, total_amount_cents]
  }
}
