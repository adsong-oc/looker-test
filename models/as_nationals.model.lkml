connection: "dev"

include: "../national_org.view.lkml"
include: "../views/organization.view.lkml"
include: "../views/organization_layer.view.lkml"


explore: national_org {
  join: organization {
    sql_on: ${national_org.national_org_id} = ${organization.parent_organization_id};;
    type:  inner
    relationship: one_to_many
  }

  join: organization_layer {
    sql_on: ${national_org.national_org_id} = ${organization_layer.organization_id};;
    type: inner
    relationship: one_to_one
  }
}
