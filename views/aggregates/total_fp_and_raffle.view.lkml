view: total_fp_and_raffle {
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
          AND pi.type IN ('vevt-fixed-price','vevt-raffle')
        GROUP BY pi.event_id
      )
      SELECT
        ve.id as event_id,
        IFNULL(type_total.total_amount_cents, 0) AS total_amount_cents
      FROM
        `dev-phaas-virtualevent-api`.virtual_event ve
      LEFT JOIN
        type_total ON type_total.event_id = ve.id
      WHERE
        NOT ve.deleted
        AND NOT ve.test_event
        AND {% condition organization_id %} ve.organization_id {% endcondition %}
 ;;
  }

  filter: organization_id {
    type: string
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: raffle_and_fixed_price_sales {
    type:  number
    sql: ${TABLE}.total_amount_cents/100 ;;
    value_format_name: usd
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: total_amount_cents {
    type: number
    sql: ${TABLE}.total_amount_cents ;;
  }

  set: detail {
    fields: [event_id, total_amount_cents]
  }
}
