view: dev_poc_event_proceeds_by_type {
 derived_table: {
  sql: WITH
        eventIDsCTE AS (
          SELECT
            name
            ,id
          FROM
            `dev-phaas-virtualevent-api`.virtual_event
          WHERE
            {% condition organization_id %} organization_id {% endcondition %}
            AND primary_end_date < CURDATE()
          ORDER BY primary_end_date DESC
          LIMIT 3
        )
      SELECT
        ve1.name as event_name,
        'Donations' as amount_type,
        IFNULL(SUM(pi1.amount_cents), 0) as amount_cents
      FROM
        `dev-phaas-virtualevent-api`.virtual_event ve1
      LEFT JOIN
        `dev-phaas-virtualevent-api`.purchased_item pi1 ON ve1.id = pi1.event_id
          AND pi1.type IN ('vevt-donation','vevt-appeal','vevt-impact')
          AND pi1.transaction_status = 'successful' AND pi1.deleted = 0
      WHERE
            ve1.id IN (SELECT id FROM eventIDsCTE)
      GROUP BY ve1.id, ve1.name
      UNION
      SELECT
        ve2.name as event_name,
        'Tickets' as amount_type,
        IFNULL(SUM(pi2.amount_cents), 0) as amount_cents
      FROM
        `dev-phaas-virtualevent-api`.virtual_event ve2
      LEFT JOIN
        `dev-phaas-virtualevent-api`.purchased_item pi2 ON ve2.id = pi2.event_id
          AND pi2.type IN ('vevt-ticket')
          AND pi2.transaction_status = 'successful' AND pi2.deleted = 0
      WHERE
            ve2.id IN (SELECT id FROM eventIDsCTE)
      GROUP BY ve2.id, ve2.name
      UNION
      SELECT
        ve3.name as event_name,
        'Sponsorships' as amount_type,
        IFNULL(SUM(pi3.amount_cents), 0) as amount_cents
      FROM
        `dev-phaas-virtualevent-api`.virtual_event ve3
      LEFT JOIN
        `dev-phaas-virtualevent-api`.purchased_item pi3 ON ve3.id = pi3.event_id
          AND pi3.type IN ('vevt-sponsor-attachment-event-sale')
          AND pi3.transaction_status = 'successful' AND pi3.deleted = 0
      WHERE
            ve3.id IN (SELECT id FROM eventIDsCTE)
      GROUP BY ve3.id, ve3.name
      UNION
      SELECT
        ve4.name as event_name,
        'Auction' as amount_type,
        IFNULL(SUM(pi4.amount_cents), 0) as amount_cents
      FROM
        `dev-phaas-virtualevent-api`.virtual_event ve4
      LEFT JOIN
        `dev-phaas-virtualevent-api`.purchased_item pi4 ON ve4.id = pi4.event_id
          AND pi4.type IN ('vevt-auction-lot')
          AND pi4.transaction_status = 'successful' AND pi4.deleted = 0
      WHERE
            ve4.id IN (SELECT id FROM eventIDsCTE)
      GROUP BY ve4.id, ve4.name
      UNION
      SELECT
        ve5.name as event_name,
        'FP & Raffle' as amount_type,
        IFNULL(SUM(pi5.amount_cents), 0) as amount_cents
      FROM
        `dev-phaas-virtualevent-api`.virtual_event ve5
      LEFT JOIN
        `dev-phaas-virtualevent-api`.purchased_item pi5 ON ve5.id = pi5.event_id
          AND pi5.type IN ('vevt-fixed-price','vevt-raffle')
          AND pi5.transaction_status = 'successful' AND pi5.deleted = 0
      WHERE
            ve5.id IN (SELECT id FROM eventIDsCTE)
      GROUP BY ve5.id, ve5.name;;
  }

  filter: organization_id {
    type: string
    bypass_suggest_restrictions: no
  }

  # measure: count {
  #   type: count
  #   drill_fields: [detail*]
  # }

  measure: amount_cents {
    type: number
    sql: ${TABLE}.amount_cents ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: amount_type {
    type: string
    sql: ${TABLE}.amount_type ;;
  }

  set: detail {
    fields: [amount_cents, amount_type, event_name]
  }
}
