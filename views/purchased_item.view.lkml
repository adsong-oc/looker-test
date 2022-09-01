view: purchased_item {
  sql_table_name: `dev-phaas-virtualevent-api`.purchased_item
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount_cents {
    type: number
    sql: ${TABLE}.amount_cents ;;
  }

  dimension: auction_id {
    type: string
    sql: ${TABLE}.auction_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: donation_moment_id {
    type: string
    sql: ${TABLE}.donation_moment_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: fixed_price_item_id {
    type: string
    sql: ${TABLE}.fixed_price_item_id ;;
  }

  dimension: guest_id {
    type: string
    sql: ${TABLE}.guest_id ;;
  }

  dimension: impact_id {
    type: string
    sql: ${TABLE}.impact_id ;;
  }

  dimension: is_anonymous {
    type: yesno
    sql: ${TABLE}.is_anonymous ;;
  }

  dimension: is_external {
    type: yesno
    sql: ${TABLE}.is_external ;;
  }

  dimension: item_details {
    type: string
    sql: ${TABLE}.item_details ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: lot_id {
    type: string
    sql: ${TABLE}.lot_id ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: overridden_by_user_id {
    type: string
    sql: ${TABLE}.overridden_by_user_id ;;
  }

  dimension: paid_by_guest_id {
    type: string
    sql: ${TABLE}.paid_by_guest_id ;;
  }

  dimension: pay_after_event {
    type: yesno
    sql: ${TABLE}.pay_after_event ;;
  }

  dimension: proxy_guest_id {
    type: string
    sql: ${TABLE}.proxy_guest_id ;;
  }

  dimension: proxy_user_id {
    type: string
    sql: ${TABLE}.proxy_user_id ;;
  }

  dimension: purchase_id {
    type: string
    sql: ${TABLE}.purchase_id ;;
  }

  dimension: raffle_batch_id {
    type: string
    sql: ${TABLE}.raffle_batch_id ;;
  }

  dimension: raffle_details {
    type: string
    sql: ${TABLE}.raffle_details ;;
  }

  dimension_group: recognize_on {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.recognize_on_date ;;
  }

  dimension: refund_id {
    type: string
    sql: ${TABLE}.refund_id ;;
  }

  dimension: supporter_company_id {
    type: string
    sql: ${TABLE}.supporter_company_id ;;
  }

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: transaction_status {
    type: string
    sql: ${TABLE}.transaction_status ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }

  measure: amount_cents_agg {
    type:  sum
    sql:  ${amount_cents} ;;
  }
}
