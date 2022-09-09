connection: "dev"

include: "/views/organization.view.lkml"
include: "/views/organization_layer.view.lkml"
include: "/views/national_organization_regions.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: national_organizations {
  view_name: organization
  sql_always_where: ${national} = 1 ;;

  join: organization_layer {
    relationship: one_to_many
    sql_on: ${organization.organization_id} = ${organization_layer.organization_id} AND ${organization_layer.parent_organization_layer_id} <> '';;
  }
}

explore: chapters {
  view_name:  organization
  sql_always_where: ${national} = 0 ;;

  join: organization_layer {
    relationship: many_to_one
    sql_on: ${organization.organization_id} = ${organization_layer.organization_id};;
  }
}
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
