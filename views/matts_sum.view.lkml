view: matts_sum {
  derived_table: {
    sql: SELECT
        SUM(pi.amount_cents) as donation_total_amount_cents,
        ve.name as event_name
      FROM `dev-phaas-org-api`.organization o
      JOIN `dev-phaas-virtualevent-api`.virtual_event ve ON o.organization_id = ve.organization_id
      LEFT JOIN `dev-phaas-virtualevent-api`.purchased_item pi ON ve.id = pi.event_id AND pi.type = 'vevt-donation'
      WHERE o.organization_id = '0c00d031-11a6-474f-9da1-46f3629e8f22'
      GROUP BY o.organization_id, o.name, ve.id, ve.name
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: donation_total_amount_cents {
    type: number
    sql: ${TABLE}.donation_total_amount_cents ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  set: detail {
    fields: [donation_total_amount_cents, event_name]
  }
}
