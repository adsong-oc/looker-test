connection: "dev"

include: "/views/organization.view.lkml"
include: "/views/org_top_sponsors.view.lkml"

# Aggregate tables
include: "/views/aggregates/events_for_org.view.lkml"
include: "/views/aggregates/total_donations.view.lkml"
include: "/views/aggregates/total_tickets.view.lkml"
include: "/views/aggregates/total_sponsorships.view.lkml"
include: "/views/aggregates/total_auctions.view.lkml"
include: "/views/aggregates/total_fp_and_raffle.view.lkml"
include: "/views/aggregates/aggregate_union.view.lkml"

explore: organization {
  join: events_for_org {
    type:  inner
    sql_on:  ${organization.organization_id} = ${events_for_org.event_organization_id};;
    relationship: one_to_many
  }

  # Joining Aggregates to the Events
  join: total_donations {
    type: inner
    sql_on: ${events_for_org.id} = ${total_donations.event_id} ;;
    relationship: one_to_one
  }

  join: total_tickets {
    type: inner
    sql_on: ${events_for_org.id} = ${total_tickets.event_id} ;;
    relationship: one_to_one
  }

  join: total_sponsorships {
    type: inner
    sql_on: ${events_for_org.id} = ${total_sponsorships.event_id} ;;
    relationship: one_to_one
  }

  join: total_auctions {
    type: inner
    sql_on: ${events_for_org.id} = ${total_auctions.event_id} ;;
    relationship: one_to_one
  }

  join: total_fp_and_raffle {
    type: inner
    sql_on: ${events_for_org.id} = ${total_fp_and_raffle.event_id} ;;
    relationship: one_to_one
  }

  join: aggregate_union {
    type: inner
    relationship: one_to_many
    sql_on: ${events_for_org.id} = ${aggregate_union.event_id} ;;
  }

  # Used as filters for the inner views while creating the SQL
  access_filter: {
    field: organization.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  events_for_org.organization_id
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

# explore: event_name {
#   join: aggregate_union {
#     type: inner
#     relationship: one_to_many
#     sql: ${event_name.id} = ${aggregate_union.event_id} ;;
#   }

#   access_filter: {
#     field:  event_name.organization_id
#     user_attribute: test_org_id
#   }

#   access_filter: {
#     field:  aggregate_union.organization_id
#     user_attribute: test_org_id
#   }
# }


# Separate explore for sponsors. Joining this to the above explore would limit the events shown to those with sponsors only
# They can still share a filter (I'm not certain what cross-filtering even does now).
explore: org_top_sponsors {
  join: events_for_org {
    type: left_outer
    sql_on: ${events_for_org.id} = ${org_top_sponsors.external_id} ;;
    relationship: many_to_one
  }

  access_filter: {
    field: org_top_sponsors.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field:  events_for_org.organization_id
    user_attribute: test_org_id
  }
}
