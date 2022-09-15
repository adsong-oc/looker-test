include: "./total_auctions.view.lkml"
include: "./total_donations.view.lkml"
include: "./total_fp_and_raffle.view.lkml"
include: "./total_sponsorships.view.lkml"
include: "./total_tickets.view.lkml"

view: aggregate_union {
  derived_table: {
    sql:
    SELECT * FROM ${total_auctions.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${total_donations.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${total_fp_and_raffle.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${total_sponsorships.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${total_tickets.SQL_TABLE_NAME}
    ;;
  }

  filter: organization_id {
    type:  string
  }

  dimension:  event_id {
    type:  string
  }

  dimension: agg_type {
    type: string
  }

  dimension: total_amount_cents {
    type:  number
  }

  measure: total_amount {
    type:  number
    value_format_name: usd
    sql:  ${TABLE}.total_amount_cents / 100 ;;
  }

  set: detail {
    fields: [event_id, total_amount_cents]
  }
}
