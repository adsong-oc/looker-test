view: virtual_event {
  sql_table_name: `dev-phaas-virtualevent-api`.virtual_event
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: active_donation_moment_id {
    type: string
    sql: ${TABLE}.active_donation_moment_id ;;
  }

  dimension: active_raffle_id {
    type: string
    sql: ${TABLE}.active_raffle_id ;;
  }

  dimension: active_silent_auction_id {
    type: string
    sql: ${TABLE}.active_silent_auction_id ;;
  }

  dimension: allow_pickup_later {
    type: yesno
    sql: ${TABLE}.allow_pickup_later ;;
  }

  dimension: allow_pickup_tonight {
    type: yesno
    sql: ${TABLE}.allow_pickup_tonight ;;
  }

  dimension: ask_employer {
    type: yesno
    sql: ${TABLE}.ask_employer ;;
  }

  dimension: ask_job_title {
    type: yesno
    sql: ${TABLE}.ask_job_title ;;
  }

  dimension: automatic_bidder_number_generation_type {
    type: string
    sql: ${TABLE}.automatic_bidder_number_generation_type ;;
  }

  dimension: banner_image_url {
    type: string
    sql: ${TABLE}.banner_image_url ;;
  }

  dimension: checkout_message_markdown {
    type: string
    sql: ${TABLE}.checkout_message_markdown ;;
  }

  dimension: checkout_notification_message_markdown {
    type: string
    sql: ${TABLE}.checkout_notification_message_markdown ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension: contact_phone {
    type: string
    sql: ${TABLE}.contact_phone ;;
  }

  dimension: cover_cost_custom_message {
    type: string
    sql: ${TABLE}.cover_cost_custom_message ;;
  }

  dimension: cover_cost_default {
    type: yesno
    sql: ${TABLE}.cover_cost_default ;;
  }

  dimension: cover_cost_percent {
    type: number
    sql: ${TABLE}.cover_cost_percent ;;
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

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: custom_tags {
    type: string
    sql: ${TABLE}.custom_tags ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: description_markdown {
    type: string
    sql: ${TABLE}.description_markdown ;;
  }

  dimension: donation_suggested_amounts_cents {
    type: string
    sql: ${TABLE}.donation_suggested_amounts_cents ;;
  }

  dimension: donation_suggested_amounts_show {
    type: yesno
    sql: ${TABLE}.donation_suggested_amounts_show ;;
  }

  dimension: donation_tab_title {
    type: string
    sql: ${TABLE}.donation_tab_title ;;
  }

  dimension: donation_thank_you_message_markdown {
    type: string
    sql: ${TABLE}.donation_thank_you_message_markdown ;;
  }

  dimension: donation_tool_title {
    type: string
    sql: ${TABLE}.donation_tool_title ;;
  }

  dimension: enable_automatic_bidder_numbers {
    type: yesno
    sql: ${TABLE}.enable_automatic_bidder_numbers ;;
  }

  dimension: enable_bidder_numbers {
    type: yesno
    sql: ${TABLE}.enable_bidder_numbers ;;
  }

  dimension: enable_fixed_price {
    type: yesno
    sql: ${TABLE}.enable_fixed_price ;;
  }

  dimension: enable_raffles {
    type: yesno
    sql: ${TABLE}.enable_raffles ;;
  }

  dimension: enable_self_checkin {
    type: yesno
    sql: ${TABLE}.enable_self_checkin ;;
  }

  dimension: enable_ticketing {
    type: yesno
    sql: ${TABLE}.enable_ticketing ;;
  }

  dimension: event_day_tool_short_url {
    type: string
    sql: ${TABLE}.event_day_tool_short_url ;;
  }

  dimension: event_end_message_markdown {
    type: string
    sql: ${TABLE}.event_end_message_markdown ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: fixed_price_item_tab_title {
    type: string
    sql: ${TABLE}.fixed_price_item_tab_title ;;
  }

  dimension: fixedprice_order_ids {
    type: string
    sql: ${TABLE}.fixedprice_order_ids ;;
  }

  dimension: game_tab_title {
    type: string
    sql: ${TABLE}.game_tab_title ;;
  }

  dimension: goal_total_donations_amount_cents {
    type: number
    sql: ${TABLE}.goal_total_donations_amount_cents ;;
  }

  dimension_group: goal_total_donations_amount_cents_met {
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
    sql: ${TABLE}.goal_total_donations_amount_cents_met_on ;;
  }

  dimension: goal_total_donations_seed_amount_cents {
    type: number
    sql: ${TABLE}.goal_total_donations_seed_amount_cents ;;
  }

  dimension: goal_tracker_image_url {
    type: string
    sql: ${TABLE}.goal_tracker_image_url ;;
  }

  dimension: greatfeats_challenge_access_key {
    type: string
    sql: ${TABLE}.greatfeats_challenge_access_key ;;
  }

  dimension: greatfeats_participants_leaderboard_message_markdown {
    type: string
    sql: ${TABLE}.greatfeats_participants_leaderboard_message_markdown ;;
  }

  dimension: greatfeats_participants_leaderboard_tab_title {
    type: string
    sql: ${TABLE}.greatfeats_participants_leaderboard_tab_title ;;
  }

  dimension: hero_image_url {
    type: string
    sql: ${TABLE}.hero_image_url ;;
  }

  dimension: host_shortened_url {
    type: string
    sql: ${TABLE}.host_shortened_url ;;
  }

  dimension: host_url {
    type: string
    sql: ${TABLE}.host_url ;;
  }

  dimension: impact_blurb {
    type: string
    sql: ${TABLE}.impact_blurb ;;
  }

  dimension: impact_order_ids {
    type: string
    sql: ${TABLE}.impact_order_ids ;;
  }

  dimension: invitation_email_subject {
    type: string
    sql: ${TABLE}.invitation_email_subject ;;
  }

  dimension: is_chat_on {
    type: yesno
    sql: ${TABLE}.is_chat_on ;;
  }

  dimension: is_checkout_open {
    type: yesno
    sql: ${TABLE}.is_checkout_open ;;
  }

  dimension: is_cover_cost_active {
    type: yesno
    sql: ${TABLE}.is_cover_cost_active ;;
  }

  dimension: is_pickup_window_scheduled {
    type: yesno
    sql: ${TABLE}.is_pickup_window_scheduled ;;
  }

  dimension: is_virtual_table_active {
    type: yesno
    sql: ${TABLE}.is_virtual_table_active ;;
  }

  dimension: live_auction_preview_tab_title {
    type: string
    sql: ${TABLE}.live_auction_preview_tab_title ;;
  }

  dimension: livestream_chat_channel_count {
    type: number
    sql: ${TABLE}.livestream_chat_channel_count ;;
  }

  dimension: logo_image_url {
    type: string
    sql: ${TABLE}.logo_image_url ;;
  }

  dimension: merchant_account_id {
    type: string
    sql: ${TABLE}.merchant_account_id ;;
  }

  dimension: message_template_markdown {
    type: string
    sql: ${TABLE}.message_template_markdown ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notice_emails_sent {
    type: yesno
    sql: ${TABLE}.notice_emails_sent ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: payments_processed {
    type: yesno
    sql: ${TABLE}.payments_processed ;;
  }

  dimension_group: pickup_close {
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
    sql: ${TABLE}.pickup_close_time ;;
  }

  dimension: pickup_later_notification_message_markdown {
    type: string
    sql: ${TABLE}.pickup_later_notification_message_markdown ;;
  }

  dimension_group: pickup_open {
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
    sql: ${TABLE}.pickup_open_time ;;
  }

  dimension: pre_event_questionnaire_notification_id {
    type: string
    sql: ${TABLE}.pre_event_questionnaire_notification_id ;;
  }

  dimension: pre_event_scheduled_notification_id {
    type: string
    sql: ${TABLE}.pre_event_scheduled_notification_id ;;
  }

  dimension_group: primary {
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
    sql: ${TABLE}.primary_date ;;
  }

  dimension_group: primary_end {
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
    sql: ${TABLE}.primary_end_date ;;
  }

  dimension: raffle_tab_title {
    type: string
    sql: ${TABLE}.raffle_tab_title ;;
  }

  dimension: ready_pickup_notification_message_markdown {
    type: string
    sql: ${TABLE}.ready_pickup_notification_message_markdown ;;
  }

  dimension: receipt_message_markdown {
    type: string
    sql: ${TABLE}.receipt_message_markdown ;;
  }

  dimension: receipt_tax_message {
    type: string
    sql: ${TABLE}.receipt_tax_message ;;
  }

  dimension: recurring_donation_period {
    type: string
    sql: ${TABLE}.recurring_donation_period ;;
  }

  dimension: recurring_donation_suggested_amounts_cents {
    type: string
    sql: ${TABLE}.recurring_donation_suggested_amounts_cents ;;
  }

  dimension: registration_blurb {
    type: string
    sql: ${TABLE}.registration_blurb ;;
  }

  dimension: registration_confirmation_message_markdown {
    type: string
    sql: ${TABLE}.registration_confirmation_message_markdown ;;
  }

  dimension: registration_thank_you_message_markdown {
    type: string
    sql: ${TABLE}.registration_thank_you_message_markdown ;;
  }

  dimension: require_address {
    type: yesno
    sql: ${TABLE}.require_address ;;
  }

  dimension: require_billing_address {
    type: yesno
    sql: ${TABLE}.require_billing_address ;;
  }

  dimension: require_donation_comp_emails {
    type: string
    sql: ${TABLE}.require_donation_comp_emails ;;
  }

  dimension: require_donation_during_registration {
    type: yesno
    sql: ${TABLE}.require_donation_during_registration ;;
  }

  dimension: require_phone {
    type: yesno
    sql: ${TABLE}.require_phone ;;
  }

  dimension: sales_tax_applies_to {
    type: string
    sql: ${TABLE}.sales_tax_applies_to ;;
  }

  dimension: sales_tax_coverage_type {
    type: string
    sql: ${TABLE}.sales_tax_coverage_type ;;
  }

  dimension: sales_tax_percent {
    type: number
    sql: ${TABLE}.sales_tax_percent ;;
  }

  dimension: shareable_slideshow_short_url {
    type: string
    sql: ${TABLE}.shareable_slideshow_short_url ;;
  }

  dimension: short_url {
    type: string
    sql: ${TABLE}.short_url ;;
  }

  dimension: show_address {
    type: yesno
    sql: ${TABLE}.show_address ;;
  }

  dimension: show_billing_address {
    type: yesno
    sql: ${TABLE}.show_billing_address ;;
  }

  dimension: show_game {
    type: yesno
    sql: ${TABLE}.show_game ;;
  }

  dimension: show_greatfeats_participants_leaderboard {
    type: yesno
    sql: ${TABLE}.show_greatfeats_participants_leaderboard ;;
  }

  dimension: show_live_auction_preview {
    type: yesno
    sql: ${TABLE}.show_live_auction_preview ;;
  }

  dimension: show_phone {
    type: yesno
    sql: ${TABLE}.show_phone ;;
  }

  dimension: show_raffle {
    type: yesno
    sql: ${TABLE}.show_raffle ;;
  }

  dimension: show_recurring_donation_management {
    type: yesno
    sql: ${TABLE}.show_recurring_donation_management ;;
  }

  dimension: show_silent_auction {
    type: yesno
    sql: ${TABLE}.show_silent_auction ;;
  }

  dimension: show_silent_auction_countdown {
    type: yesno
    sql: ${TABLE}.show_silent_auction_countdown ;;
  }

  dimension: show_social_auth {
    type: yesno
    sql: ${TABLE}.show_social_auth ;;
  }

  dimension: show_story {
    type: yesno
    sql: ${TABLE}.show_story ;;
  }

  dimension: show_thermometer {
    type: yesno
    sql: ${TABLE}.show_thermometer ;;
  }

  dimension: silent_auction_tab_title {
    type: string
    sql: ${TABLE}.silent_auction_tab_title ;;
  }

  dimension: starting_bidder_number {
    type: number
    sql: ${TABLE}.starting_bidder_number ;;
  }

  dimension: story_markdown {
    type: string
    sql: ${TABLE}.story_markdown ;;
  }

  dimension: story_slide_order_ids {
    type: string
    sql: ${TABLE}.story_slide_order_ids ;;
  }

  dimension: story_tab_title {
    type: string
    sql: ${TABLE}.story_tab_title ;;
  }

  dimension: support_section_header_title {
    type: string
    sql: ${TABLE}.support_section_header_title ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: test_event {
    type: yesno
    sql: ${TABLE}.test_event ;;
  }

  dimension: theme_primary_color {
    type: string
    sql: ${TABLE}.theme_primary_color ;;
  }

  dimension: theme_secondary_color {
    type: string
    sql: ${TABLE}.theme_secondary_color ;;
  }

  dimension: thermometer_config {
    type: string
    sql: ${TABLE}.thermometer_config ;;
  }

  dimension: ticket_option_order_ids {
    type: string
    sql: ${TABLE}.ticket_option_order_ids ;;
  }

  dimension: ticket_type_order_ids {
    type: string
    sql: ${TABLE}.ticket_type_order_ids ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: total_appeal_amount_cents {
    type: number
    sql: ${TABLE}.total_appeal_amount_cents ;;
  }

  dimension: total_donation_moments_seed_amount_cents {
    type: number
    sql: ${TABLE}.total_donation_moments_seed_amount_cents ;;
  }

  dimension: total_donations_amount_cents {
    type: number
    sql: ${TABLE}.total_donations_amount_cents ;;
  }

  dimension: total_donations_count {
    type: number
    sql: ${TABLE}.total_donations_count ;;
  }

  dimension: total_donations_proceeds_amount_cents {
    type: number
    sql: ${TABLE}.total_donations_proceeds_amount_cents ;;
  }

  dimension: total_fixed_price_proceeds_amount_cents {
    type: number
    sql: ${TABLE}.total_fixed_price_proceeds_amount_cents ;;
  }

  dimension: total_live_auction_proceeds_amount_cents {
    type: number
    sql: ${TABLE}.total_live_auction_proceeds_amount_cents ;;
  }

  dimension: total_misc_proceeds_amount_cents {
    type: number
    sql: ${TABLE}.total_misc_proceeds_amount_cents ;;
  }

  dimension: total_offline_donations_amount_cents {
    type: number
    sql: ${TABLE}.total_offline_donations_amount_cents ;;
  }

  dimension: total_raffle_proceeds_amount_cents {
    type: number
    sql: ${TABLE}.total_raffle_proceeds_amount_cents ;;
  }

  dimension: total_registrations_count {
    type: number
    sql: ${TABLE}.total_registrations_count ;;
  }

  dimension: total_silent_auction_proceeds_amount_cents {
    type: number
    sql: ${TABLE}.total_silent_auction_proceeds_amount_cents ;;
  }

  dimension: total_sponsor_attachment_event_sales_proceeds_amount_cents {
    type: number
    sql: ${TABLE}.total_sponsor_attachment_event_sales_proceeds_amount_cents ;;
  }

  dimension: total_tickets_proceeds_amount_cents {
    type: number
    sql: ${TABLE}.total_tickets_proceeds_amount_cents ;;
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

  dimension: venue_details {
    type: string
    sql: ${TABLE}.venue_details ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, contact_name]
  }
}
