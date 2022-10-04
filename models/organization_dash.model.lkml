connection: "@{stack}"

include: "/views/organization.view.lkml"
include: "/views/org_top_sponsors.view.lkml"

# Aggregate tables
include: "/views/aggregates/events_for_org.view.lkml"
include: "/views/aggregates/proceeds_union.view.lkml"


explore: organization {
  join: events_for_org {
    type:  inner
    sql_on:  ${organization.organization_id} = ${events_for_org.event_organization_id};;
    relationship: one_to_many
  }


  join: proceeds_union {
    type: left_outer
    relationship: one_to_many
    sql_on: ${events_for_org.id} = ${proceeds_union.event_id} ;;
  }

  # Used as filters for the inner views while creating the SQL
  access_filter: {
    field: organization.organization_id
    user_attribute: organization_id
  }

  access_filter: {
    field:  events_for_org.organization_id
    user_attribute: organization_id
  }
}


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
    user_attribute: organization_id
  }

  access_filter: {
    field:  events_for_org.organization_id
    user_attribute: organization_id
  }
}
