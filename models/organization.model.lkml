connection: "dev"

include: "/views/organization.view.lkml"
include: "/views/org_top_sponsors.view.lkml"
include: "/views/event_name.view.lkml"

explore: organization {
  join: org_top_sponsors {
    type: left_outer
    sql_on: ${organization.organization_id} = ${org_top_sponsors.sponsor_organization_id} AND ${org_top_sponsors.organization_id} ;;
    relationship: one_to_many
  }

  # join: event_name {
  #   type:  left_outer
  #   sql_on:  ${organization.organization_id} = ${event_name.event_organization_id} AND ${event_name.id} = ${org_top_sponsors.external_id};;
  #   relationship: one_to_many
  # }
  # join: matts_sum {
  #   type: left_outer
  #   sql_on: ${organization.organization_id} = ${matts_sum.organization_id} ;;
  #   relationship: one_to_many
  # }

  # sql_always_where: ${organization.organization_id} = "{{ _user_attributes['test_org_id'] }}"
  #   AND ${org_top_sponsors.organization_id} = "{{ _user_attributes['test_org_id'] }}";;
    # AND ${matts_sum.organization_id} = {{ _user_attributes['organization_id'] }};;

  access_filter: {
    field: organization.organization_id
    user_attribute: test_org_id
  }

  access_filter: {
    field: org_top_sponsors.organization_id
    user_attribute: test_org_id
  }

  # access_filter: {
  #   field:  event_name.organization_id
  #   user_attribute: test_org_id
  # }
}
