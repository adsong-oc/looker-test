view: national_organization_regions {
  derived_table: {
    sql: SELECT org.organization_id, org.name, org.organization_layer_id, layer.layer_name
      FROM `dev-phaas-org-api`.organization org
      INNER JOIN `dev-phaas-org-api`.organization_layer layer ON org.organization_layer_id = layer.id
      WHERE layer.parent_organization_layer_id <> ''

      UNION

      SELECT org.organization_id, org.name, '' as organization_layer_id, '' as layer_name
      FROM `dev-phaas-org-api`.organization org
      INNER JOIN `dev-phaas-org-api`.organization_layer layer ON org.organization_layer_id = layer.id
      WHERE layer.parent_organization_layer_id = ''
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: organization_layer_id {
    type: string
    sql: ${TABLE}.organization_layer_id ;;
  }

  dimension: layer_name {
    type: string
    sql: ${TABLE}.layer_name ;;
  }

  set: detail {
    fields: [organization_id, name, organization_layer_id, layer_name]
  }
}
