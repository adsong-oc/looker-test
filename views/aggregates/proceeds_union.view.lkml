include: "./auction_proceeds.view.lkml"
include: "./donation_proceeds.view.lkml"
include: "./fp_and_raffle_proceeds.view.lkml"
include: "./sponsorship_proceeds.view.lkml"
include: "./ticket_proceeds.view.lkml"

view: proceeds_union {
  derived_table: {
    sql:
    SELECT * FROM ${auction_proceeds.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${donation_proceeds.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${fp_and_raffle_proceeds.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${sponsorship_proceeds.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${ticket_proceeds.SQL_TABLE_NAME}
    ;;
  }

  dimension:  event_id {
    type:  string
  }

  dimension: agg_type {
    type: string
    order_by_field: display_order
  }

  dimension: total_amount_cents {
    type:  number
  }

  dimension: display_order {
    type:  number
  }

  measure: total_amount {
    type:  number
    value_format_name: usd
    sql:  IFNULL(${TABLE}.total_amount_cents / 100, 0) ;;
  }

  set: detail {
    fields: [event_id, total_amount_cents]
  }
}
