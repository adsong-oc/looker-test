view: guest {
  sql_table_name: `dev-phaas-virtualevent-api`.guest
    ;;
  drill_fields: [bidding_as_guest_id]

  dimension: bidding_as_guest_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.bidding_as_guest_id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: attendee_number {
    type: string
    sql: ${TABLE}.attendee_number ;;
  }

  dimension: bidder_number {
    type: number
    sql: ${TABLE}.bidder_number ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: managing_guest_id {
    type: string
    sql: ${TABLE}.managing_guest_id ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: pre_event_consent_self_completed {
    type: yesno
    sql: ${TABLE}.pre_event_consent_self_completed ;;
  }

  dimension: pre_event_question_one_answer {
    type: yesno
    sql: ${TABLE}.pre_event_question_one_answer ;;
  }

  dimension: pre_event_question_three_answer {
    type: yesno
    sql: ${TABLE}.pre_event_question_three_answer ;;
  }

  dimension: pre_event_question_two_answer {
    type: yesno
    sql: ${TABLE}.pre_event_question_two_answer ;;
  }

  dimension_group: pre_event_questionnaire_complete {
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
    sql: ${TABLE}.pre_event_questionnaire_complete_time ;;
  }

  dimension: purchased_item_primary_guest_id {
    type: string
    sql: ${TABLE}.purchased_item_primary_guest_id ;;
  }

  dimension: purchased_item_primary_user_id {
    type: string
    sql: ${TABLE}.purchased_item_primary_user_id ;;
  }

  dimension: registration_id {
    type: string
    sql: ${TABLE}.registration_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
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

  dimension: user_card_id {
    type: string
    sql: ${TABLE}.user_card_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [bidding_as_guest_id, last_name, first_name]
  }
}
