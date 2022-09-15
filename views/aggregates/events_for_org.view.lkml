view: events_for_org {
  derived_table: {
    sql: SELECT
            id,
            name,
            organization_id,
            primary_date,
            primary_end_date,
            total_donation_moments_seed_amount_cents
          FROM
            `dev-phaas-virtualevent-api`.virtual_event
          WHERE
            NOT deleted
            AND NOT test_event
            AND {% condition organization_id %} organization_id {% endcondition %}
            ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # Custom Filter
  filter: event {
    type:  string
    sql:  ${TABLE}.name ${TABLE}.primary_end_date ;;
  }

  # Templated filter
  filter: organization_id {
    type: string
    sql: {% condition organization_id %} ${event_organization_id} {% endcondition %} ;;
  }

  filter: event_id {
    type:  string
    sql: ${TABLE}.id ;;
  }

  # The SQL is what gets injected into the SQL query.
  filter: event_name {
    type:  string
    suggest_dimension: name
    sql: {% condition event_name %} ${TABLE}.name {% endcondition %};;
  }

  dimension: event_organization_id {
    type:  string
    sql:  ${TABLE}.organization_id ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: primary_date {
    type: date
    sql: ${TABLE}.primary_date ;;
  }

  dimension: primary_end_date {
    type: date
    sql: ${TABLE}.primary_end_date ;;
  }

  dimension: total_donation_moments_seed_amount_cents {
    type:  number
    sql:  ${TABLE}.total_donation_moments_seed_amount_cents ;;
  }

  set: detail {
    fields: [id, name]
  }
}
