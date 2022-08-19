view: commitment_test {
  derived_table: {
    sql: SELECT * FROM `dev-phaas-commitment-api`.commitment WHERE organization_id="52306949-257b-4321-af7a-6bf5a81d0023"
      ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension_group: updated {
    type: time
    sql: ${TABLE}.updated ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: amount_cents {
    type: number
    sql: ${TABLE}.amount_cents ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension_group: expected_paid_date {
    type: time
    sql: ${TABLE}.expected_paid_date ;;
  }

  dimension_group: recieved_payment_date {
    type: time
    sql: ${TABLE}.recieved_payment_date ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: contact_first_name {
    type: string
    sql: ${TABLE}.contact_first_name ;;
  }

  dimension: contact_last_name {
    type: string
    sql: ${TABLE}.contact_last_name ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: contact_phone {
    type: string
    sql: ${TABLE}.contact_phone ;;
  }

  dimension: purchased_item_id {
    type: string
    sql: ${TABLE}.purchased_item_id ;;
  }

  set: detail {
    fields: [
      id,
      organization_id,
      event_id,
      created_time,
      updated_time,
      deleted,
      amount_cents,
      notes,
      expected_paid_date_time,
      recieved_payment_date_time,
      external_id,
      contact_first_name,
      contact_last_name,
      contact_email,
      contact_phone,
      purchased_item_id
    ]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_amount_cents {
    type: sum
    sql: ${amount_cents} ;;
  }
}
