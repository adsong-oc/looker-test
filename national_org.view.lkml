view: national_org {
  derived_table: {
    sql:
      SELECT
        -- national info
        o.organization_id AS national_organization_id
        ,o.name AS national_name

        -- national layers
        ,ol.id AS layer_id
        ,ol.organization_id
        ,ol.parent_organization_layer_id
        ,ol.layer_name

        -- chapters info
        ,c.chapter_organization_id
        ,c.chapter_name
      FROM `dev-phaas-org-api`.organization o
      LEFT JOIN `dev-phaas-org-api`.organization_layer ol ON o.organization_id = ol.organization_id
      LEFT JOIN (

        -- Chapters that are attached to a nationals layer
        SELECT
          o.organization_id AS chapter_organization_id
          ,o.name AS chapter_name
          ,ol.id AS layer_id
          ,ol.layer_name
        FROM `dev-phaas-org-api`.organization o
        JOIN `dev-phaas-org-api`.organization_layer ol ON o.organization_layer_id = ol.id AND ol.organization_id = 'cbb5f35f-9f9c-46f7-a329-c05369476668'
        WHERE o.parent_organization_id = 'cbb5f35f-9f9c-46f7-a329-c05369476668'

        UNION

        -- Chapters that are not attached to a nationals layer, force it to the nationals blank layer
        SELECT
          o.organization_id AS chapter_organization_id
          ,o.name AS chapter_name
          ,ol2.id AS layer_id
          ,ol2.layer_name
        FROM `dev-phaas-org-api`.organization o
        JOIN `dev-phaas-org-api`.organization_layer ol ON o.organization_layer_id = ol.id AND ol.organization_id <> 'cbb5f35f-9f9c-46f7-a329-c05369476668'
        JOIN `dev-phaas-org-api`.organization_layer ol2 ON ol2.organization_id = 'cbb5f35f-9f9c-46f7-a329-c05369476668' AND ol2.parent_organization_layer_id = ''
        WHERE o.parent_organization_id = 'cbb5f35f-9f9c-46f7-a329-c05369476668'

      ) c ON c.layer_id = ol.id
      WHERE o.organization_id = 'cbb5f35f-9f9c-46f7-a329-c05369476668';;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: national_organization_id {
    type: string
    sql: ${TABLE}.national_organization_id ;;
  }

  dimension: national_name {
    type: string
    sql: ${TABLE}.national_name ;;
  }

  dimension: layer_id {
    type: string
    sql: ${TABLE}.layer_id ;;
  }

  dimension: layer_name {
    type: string
    sql: ${TABLE}.layer_name ;;
  }

  dimension: chapter_organization_id {
    type: string
    sql: ${TABLE}.chapter_organization_id ;;
  }

  dimension: chapter_name {
    type: string
    sql: ${TABLE}.national_name ;;
  }

  set: detail {
    fields: [national_organization_id, national_name, layer_id, layer_name, chapter_organization_id, chapter_name]
  }
}
