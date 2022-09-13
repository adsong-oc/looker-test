view: org_top_sponsors {
  derived_table: {
    sql: SELECT
        saes.sponsor_attachment_id,
        s.organization_id,
        s.name,
        s.logo_url,
        s.sponsor_id,
        saes.external_id,
        saes.amount_cents
      FROM `dev-phaas-sponsor-api`.sponsor s
      JOIN `dev-phaas-sponsor-api`.sponsor_attachment sa ON sa.sponsor_id = s.sponsor_id
      JOIN `dev-phaas-sponsor-api`.sponsor_attachment_event_sale saes ON saes.sponsor_attachment_id = sa.sponsor_attachment_id AND NOT saes.deleted
      WHERE {% condition organization_id %} s.organization_id {% endcondition %}
      AND {% condition event_id %} saes.external_id {% endcondition %}
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  filter: organization_id {
    type: string
    sql: {% condition organization_id %} ${sponsor_organization_id} {% endcondition %} ;;
  }

  # This filter should be driven by another view. I don't think this works properly actually. Doesn't hurt to keep it here for now.
  filter: event_id {
    type: string
    # sql: WHERE EXISTS (SELECT name FROM `dev-phaas-virtualevent-api`.virtual_event WHERE {% condition organization_id %} organization_id {% endcondition %} AND NOT deleted);;
    bypass_suggest_restrictions: no
  }

  dimension: sponsor_organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: external_id {
    type: string
    sql:${TABLE}.external_id ;;
  }

  dimension: sponsor_attachment_id {
    type:  string
    primary_key: yes
    sql:  ${TABLE}.sponsor_attachment_id;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: logo_url {
    type: string
    sql: ${TABLE}.logo_url ;;
  }

  dimension: sponsor_id {
    type: string
    sql: ${TABLE}.sponsor_id ;;
  }

  dimension: amount_cents {
    type: number
    sql: ${TABLE}.amount_cents ;;
  }

  measure: total {
    type: sum
    sql: ${amount_cents} / 100 ;;
    value_format_name: usd
  }

  set: detail {
    fields: [sponsor_attachment_id, organization_id, name, logo_url, sponsor_id, amount_cents]
  }
}
