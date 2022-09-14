connection: "dev"

include: "/views/organization.view.lkml"
include: "/views/org_top_sponsors.view.lkml"
include: "/views/event_name.view.lkml"

# Aggregate tables
include: "/views/aggregates/total_donations.view.lkml"
include: "/views/aggregates/total_tickets.view.lkml"
include: "/views/aggregates/total_sponsorships.view.lkml"
include: "/views/aggregates/total_auctions.view.lkml"
include: "/views/aggregates/total_fp_and_raffle.view.lkml"

explore: organization {
  join: event_name {
    type:  inner
    sql_on:  ${organization.organization_id} = ${event_name.event_organization_id};;
    relationship: one_to_many
  }

  join: total_donations {
    type: left_outer
    sql_on: ${event_name.id} = ${total_donations.event_id} ;;
    relationship: one_to_one
  }

  join: total_tickets {
    type: left_outer
    sql_on: ${event_name.id} = ${total_tickets.event_id} ;;
    relationship: one_to_one
  }

  join: total_sponsorships {
    type: left_outer
    sql_on: ${event_name.id} = ${total_sponsorships.event_id} ;;
    relationship: one_to_one
  }

  join: total_auctions {
    type: left_outer
    sql_on: ${event_name.id} = ${total_auctions.event_id} ;;
    relationship: one_to_one
  }

  join: total_fp_and_raffle {
    type: left_outer
    sql_on: ${event_name.id} = ${total_fp_and_raffle.event_id} ;;
    relationship: one_to_one
  }

  # Used as filters for the inner views while creating the SQL
  access_filter: {
    field: organization.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  event_name.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  total_donations.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  total_tickets.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  total_sponsorships.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  total_auctions.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  total_fp_and_raffle.organization_id
    user_attribute: test_org_id
  }
}


# Separate explore for sponsors. Joining this to the above explore would limit the events shown to those with sponsors only
explore: org_top_sponsors {
  join: event_name {
    type: left_outer
    sql_on: ${event_name.id} = ${org_top_sponsors.external_id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: org_top_sponsors.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  event_name.organization_id
    user_attribute: test_org_id
  }
}
