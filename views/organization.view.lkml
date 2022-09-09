view: organization {
  sql_table_name: `dev-phaas-org-api`.organization
    ;;
  drill_fields: [parent_organization_id]

  dimension: parent_organization_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.parent_organization_id ;;
  }

  dimension: address_city {
    type: string
    sql: ${TABLE}.address_city ;;
  }

  dimension: address_country {
    type: string
    sql: ${TABLE}.address_country ;;
  }

  dimension: address_state {
    type: string
    sql: ${TABLE}.address_state ;;
  }

  dimension: address_street {
    type: string
    sql: ${TABLE}.address_street ;;
  }

  dimension: address_zip {
    type: string
    sql: ${TABLE}.address_zip ;;
  }

  dimension: amex_flat_fee {
    type: number
    sql: ${TABLE}.amex_flat_fee ;;
  }

  dimension: amex_percent_fee {
    type: number
    sql: ${TABLE}.amex_percent_fee ;;
  }

  dimension: api_rate_limit {
    type: number
    sql: ${TABLE}.api_rate_limit ;;
  }

  dimension: billing_email {
    type: string
    sql: ${TABLE}.billing_email ;;
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

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: discover_flat_fee {
    type: number
    sql: ${TABLE}.discover_flat_fee ;;
  }

  dimension: discover_percent_fee {
    type: number
    sql: ${TABLE}.discover_percent_fee ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: firstamerican_flat_rate {
    type: yesno
    sql: ${TABLE}.firstamerican_flat_rate ;;
  }

  dimension: fiscal_year_goal {
    type: number
    sql: ${TABLE}.fiscal_year_goal ;;
  }

  dimension: fiscal_year_start {
    type: yesno
    sql: ${TABLE}.fiscal_year_start ;;
  }

  dimension: internal {
    type: yesno
    sql: ${TABLE}.internal ;;
  }

  dimension: logo_url {
    type: string
    sql: ${TABLE}.logo_url ;;
  }

  dimension: master_flat_fee {
    type: number
    sql: ${TABLE}.master_flat_fee ;;
  }

  dimension: master_percent_fee {
    type: number
    sql: ${TABLE}.master_percent_fee ;;
  }

  dimension: maximum_manual_message_recipient_count {
    type: number
    sql: ${TABLE}.maximum_manual_message_recipient_count ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: national {
    type: yesno
    sql: ${TABLE}.national ;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: organization_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: organization_layer_id {
    type: string
    sql: ${TABLE}.organization_layer_id ;;
  }

  dimension: other_flat_fee {
    type: number
    sql: ${TABLE}.other_flat_fee ;;
  }

  dimension: other_percent_fee {
    type: number
    sql: ${TABLE}.other_percent_fee ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: platform_fee {
    type: number
    sql: ${TABLE}.platform_fee ;;
  }

  dimension: primary_color {
    type: string
    sql: ${TABLE}.primary_color ;;
  }

  dimension: receipt_digital_signature_url {
    type: string
    sql: ${TABLE}.receipt_digital_signature_url ;;
  }

  dimension: receipt_footer {
    type: string
    sql: ${TABLE}.receipt_footer ;;
  }

  dimension: receipt_prefix {
    type: string
    sql: ${TABLE}.receipt_prefix ;;
  }

  dimension: receipt_printed_signature {
    type: string
    sql: ${TABLE}.receipt_printed_signature ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}.salesforce_id ;;
  }

  dimension: stripe_customer_id {
    type: string
    sql: ${TABLE}.stripe_customer_id ;;
  }

  dimension: tax_id {
    type: string
    sql: ${TABLE}.tax_id ;;
  }

  dimension: ticket_fee_waived {
    type: yesno
    sql: ${TABLE}.ticket_fee_waived ;;
  }

  dimension: ticket_max_fee {
    type: number
    sql: ${TABLE}.ticket_max_fee ;;
  }

  dimension: ticket_percent_fee {
    type: number
    sql: ${TABLE}.ticket_percent_fee ;;
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

  dimension: visa_flat_fee {
    type: number
    sql: ${TABLE}.visa_flat_fee ;;
  }

  dimension: visa_percent_fee {
    type: number
    sql: ${TABLE}.visa_percent_fee ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      parent_organization_id,
      nickname,
      name,
      organization.nickname,
      organization.parent_organization_id,
      organization.name,
      organization.count
    ]
  }
}
