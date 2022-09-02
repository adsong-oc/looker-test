connection: "dev"

include: "../national_org.view.lkml"
include: "../views/organization.view.lkml"
include: "../views/organization_layer.view.lkml"


explore: national_org {
  join: organization {
    sql_on: ${national_org.chapter_organization_id} = ${organization.organization_id};;
    type:  inner
    relationship: one_to_one
  }
  sql_always_where: ${national_org.national_organization_id} = ${national_org.national_organization_id} ;;
}
