view: events_for_org {
  derived_table: {
    sql:SELECT
          *,
          ROW_NUMBER() OVER w AS 'row_number'
        FROM (
          SELECT
            id,
            name,
            organization_id,
            primary_date,
            primary_end_date,
            total_donation_moments_seed_amount_cents
          FROM
            `@{stack}-phaas-virtualevent-api`.virtual_event
          WHERE
            NOT deleted
            AND NOT test_event
            AND {% condition organization_id %} organization_id {% endcondition %}
          ORDER BY
            primary_end_date DESC
        ) events
        WINDOW w AS (ORDER BY primary_end_date DESC)
     ;;
  }

  dimension: row_number {
    type: number
    sql: ${TABLE}.row_number ;;
  }

  # Templated filter
  filter: organization_id {
    type: string
    sql: {% condition organization_id %} ${event_organization_id} {% endcondition %} ;;
  }

  # filter: event_id {
  #   type:  string
  #   sql: ${TABLE}.id ;;
  # }


  # Custom dimension that concatenates the name + primary end date.
  dimension: event_name_and_date {
    type:  string
    sql:  CONCAT(${TABLE}.name, ' ', IFNULL(DATE_FORMAT(${TABLE}.primary_end_date, '%m/%d/%y'), ''));;
    order_by_field: row_number
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
    order_by_field: date_diff
  }

  dimension: primary_date {
    type: date
    sql: ${TABLE}.primary_date ;;
  }

  dimension: primary_end_date {
    type: date
    sql: ${TABLE}.primary_end_date ;;
  }

  # Unused
  dimension: event_status {
    case: {
      when: {
        sql: ${TABLE}.primary_end_date >= NOW() ;;
        label: "Upcoming"
      }
      else: "Past"
    }
  }

  # Custom dimension to get a value of the end date to the current date. If the primary end date is null
  # it is set to 9999 which is a random, large number
  dimension: date_diff {
    type:  number
    hidden: yes
    sql: IFNULL(ABS(DATEDIFF(${TABLE}.primary_end_date, NOW())), 9999) ;;
  }

  dimension: total_donation_moments_seed_amount_cents {
    type:  number
    sql:  ${TABLE}.total_donation_moments_seed_amount_cents ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [id, name]
  }
}
