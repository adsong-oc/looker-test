include: "./events_for_org.view.lkml"

view: donation_proceeds {
  derived_table: {
    sql: WITH donations AS
      (SELECT
        events.id AS event_id,
        IFNULL(SUM(pi.amount_cents), 0) as amount_cents
        FROM
          ${events_for_org.SQL_TABLE_NAME} events
        LEFT JOIN
          `dev-phaas-virtualevent-api`.purchased_item pi ON events.id = pi.event_id
        WHERE
          pi.type IN ('vevt-donation', 'vevt-appeal', 'vevt-impact')
          AND pi.transaction_status != 'failed'
          AND NOT pi.deleted
        GROUP BY events.id
      ),
      commitments AS
      (SELECT
        events.id AS event_id,
        IFNULL(SUM(c.amount_cents),0) as amount_cents
        FROM
          ${events_for_org.SQL_TABLE_NAME} events
        LEFT JOIN
          `dev-phaas-commitment-api`.commitment c ON events.id = c.event_id
        WHERE
          c.purchased_item_id = ''
          AND NOT c.deleted
        GROUP BY events.id
      )
    SELECT
      events.id as event_id,
      'Donations' as agg_type,
      1 as display_order,
      (IFNULL(donations.amount_cents, 0) + IFNULL(events.total_donation_moments_seed_amount_cents, 0) + IFNULL(commitments.amount_cents, 0)) as total_amount_cents
    FROM
      ${events_for_org.SQL_TABLE_NAME} events
      LEFT JOIN donations ON donations.event_id = events.id
      LEFT JOIN commitments ON commitments.event_id = events.id
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
