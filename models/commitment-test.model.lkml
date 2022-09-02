connection: "dev"

include: "/commitment_test.view"                # include all views in the views/ folder in this project
include: "../views/event_name.view"
include: "../views/purchased_item.view"
include: "../views/guest.view"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
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

explore: commitment_test {
  description: "This is an Explore description test!"
}

explore: event_name {
  description: "A simple view to get the Event ID and Event Name"
  join: commitment_test {
    sql_on: ${commitment_test.event_id} = ${event_name.id} AND NOT ${commitment_test.deleted};;
    relationship: many_to_many
  }
  join: purchased_item {
    sql_on: ${event_name.id} = ${purchased_item.event_id} AND NOT ${purchased_item.deleted};;
    relationship: one_to_many
  }
  join: guest {
    sql_on: ${guest.event_id} = ${event_name.id} AND NOT ${guest.deleted} AND ${guest.id} = ${purchased_item.guest_id};;
    relationship: many_to_one
  }
}

# explore: purchased_item {
#   join: guest {
#     sql_on: ${guest.id} = ${purchased_item.guest_id} AND NOT ${guest.deleted};;
#     relationship: one_to_one
#   }
# }

# explore: guest {}
