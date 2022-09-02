view: national_org {
  derived_table: {
    sql: SELECT organization_id AS national_org_id, name AS national_name FROM `dev-phaas-org-api`.organization WHERE national = TRUE AND organization_id="cbb5f35f-9f9c-46f7-a329-c05369476668"
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: national_org_id {
    type: string
    sql: ${TABLE}.national_org_id ;;
  }

  dimension: national_name {
    type: string
    sql: ${TABLE}.national_name ;;
  }

  set: detail {
    fields: [national_org_id, national_name]
  }
}
