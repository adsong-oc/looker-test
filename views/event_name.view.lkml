view: event_name {
  derived_table: {
    sql: SELECT id, name, organization_id FROM `dev-phaas-virtualevent-api`.virtual_event WHERE NOT deleted AND
    {% condition organization_id %} organization_id {% endcondition %}
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # Templated filter
  filter: organization_id {
    type: string
    sql: {% condition organization_id %} ${event_organization_id} {% endcondition %} ;;
  }

  filter: event_name {
    type:  string
    suggest_dimension: name
    sql:  EXISTS (SELECT name FROM `dev-phaas-virtualevent-api`.virtual_event WHERE {% condition %} organization_id {% endcondition %});;
  }

  dimension: event_organization_id {
    type:  string
    sql:  ${TABLE}.organization_id ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  set: detail {
    fields: [id, name]
  }
}
