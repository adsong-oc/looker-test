view: total_donations {
  derived_table: {
    sql: WITH donations AS
      (SELECT
        pi.event_id,
        IFNULL(SUM(pi.amount_cents), 0) as amount_cents
        FROM
          `dev-phaas-virtualevent-api`.purchased_item pi
        WHERE
          {% condition organization_id %} pi.organization_id {% endcondition %}
          AND pi.type IN ('vevt-donation', 'vevt-appeal', 'vevt-impact')
          AND pi.transaction_status != 'failed'
          AND NOT pi.deleted
        GROUP BY pi.event_id
      ),
      commitments AS
      (SELECT
        c.event_id,
        IFNULL(SUM(c.amount_cents),0) as amount_cents
        FROM
          `dev-phaas-commitment-api`.commitment c
        WHERE
          c.purchased_item_id = ''
          AND {% condition organization_id %} c.organization_id {% endcondition %}
          AND NOT c.deleted
        GROUP BY c.event_id
      ),
      events AS
      (SELECT
        e.id as event_id,
        IFNULL(SUM(e.total_donation_moments_seed_amount_cents),0) AS seed_amount_cents
        FROM
          `dev-phaas-virtualevent-api`.virtual_event e
        WHERE
          {% condition organization_id %} e.organization_id {% endcondition %}
          AND NOT e.deleted
          AND NOT e.test_event
        GROUP BY event_id
      )
    SELECT
      events.event_id,
      (IFNULL(donations.amount_cents, 0) + IFNULL(events.seed_amount_cents, 0) + IFNULL(commitments.amount_cents, 0)) as donations_amount_cents
    FROM
      events
      LEFT JOIN donations ON donations.event_id = events.event_id
      LEFT JOIN commitments ON commitments.event_id = events.event_id
       ;;
  }

  filter: organization_id {
    type:  string
  }

  dimension: event_id {
    type:  string
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # Transforming the column outside of the SQL here
  measure: donations {
    type: number
    sql:  ${TABLE}.donations_amount_cents / 100;;
    value_format_name: usd
  }

  dimension: donations_amount_cents {
    type: number
    sql: ${TABLE}.donations_amount_cents ;;
  }

  set: detail {
    fields: [event_id, donations_amount_cents]
  }
}
