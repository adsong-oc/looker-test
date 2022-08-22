view: matts_sum {
  derived_table: {
    sql: SELECT
        ve.name as event_name,
        'donations' as amount_type,
        IFNULL(SUM(pid.amount_cents), 0) as amount_cents
      FROM `dev-phaas-org-api`.organization o
      JOIN `dev-phaas-virtualevent-api`.virtual_event ve ON o.organization_id = ve.organization_id
      LEFT JOIN `dev-phaas-virtualevent-api`.purchased_item pid ON ve.id = pid.event_id AND pid.type = 'vevt-donation' AND pid.transaction_status = 'successful' AND pid.deleted = 0
      WHERE
      {% condition organization_id %} o.organization_id {% endcondition %}
      GROUP BY o.organization_id, o.name, ve.id, ve.name
      UNION
      SELECT
       ve.name as event_name,
        'tickets' as amount_type,
        IFNULL(SUM(pit.amount_cents), 0) as amount_cents
      FROM `dev-phaas-org-api`.organization o
      JOIN `dev-phaas-virtualevent-api`.virtual_event ve ON o.organization_id = ve.organization_id
      LEFT JOIN `dev-phaas-virtualevent-api`.purchased_item pit ON ve.id = pit.event_id AND pit.type = 'vevt-ticket' AND pit.transaction_status = 'successful' AND pit.deleted = 0
      WHERE
      {% condition organization_id %} o.organization_id {% endcondition %}
      GROUP BY o.organization_id, o.name, ve.id, ve.name
       ;;
  }

  filter: organization_id {
    type: string
    bypass_suggest_restrictions: no
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: amount_cents {
    type: number
    sql: ${TABLE}.amount_cents ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: amount_type {
    type: string
    sql: ${TABLE}.amount_type ;;
  }

  set: detail {
    fields: [amount_cents, amount_type, event_name]
  }
}
