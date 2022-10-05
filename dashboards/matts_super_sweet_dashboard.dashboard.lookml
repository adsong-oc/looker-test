- dashboard: matts_super_sweet_dashboard
  title: Matts Super Sweet Dashboard (aka - Events Dashboard)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_bar_collapsed: true
  preferred_slug: mattandandrewtest12345
  elements:
  - name: Event Proceeds by Type
    title: Event Proceeds by Type
    model: '@{stack}_matts_super_sweet_model'
    explore: organization
    type: looker_column
    fields: [events_for_org.name, proceeds_union.agg_type, proceeds_union.total_amount]
    pivots: [events_for_org.name]
    sorts: [events_for_org.name, proceeds_union.agg_type]
    limit: 500
    column_limit: 3
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: proceeds_union.total_amount,
            id: fresh - Dont touch (using for bookmarked links) - 1 - proceeds_union.total_amount,
            name: fresh - Dont touch (using for bookmarked links)}, {axisId: proceeds_union.total_amount,
            id: virtual commits 8/29 - 11 - proceeds_union.total_amount, name: virtual
              commits 8/29}, {axisId: proceeds_union.total_amount, id: add card 4/18
              name update - 16 - proceeds_union.total_amount, name: add card 4/18
              name update}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Proceed Type
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '3'
    font_size: ''
    series_colors: {}
    column_spacing_ratio: 0
    show_dropoff: false
    defaults_version: 1
    listen:
      Event: events_for_org.event_name_and_date
    row: 0
    col: 0
    width: 18
    height: 12
  - name: Top Sponsors
    title: Top Sponsors
    model: '@{stack}_matts_super_sweet_model'
    explore: org_top_sponsors
    type: looker_grid
    fields: [org_top_sponsors.name, org_top_sponsors.total]
    sorts: [org_top_sponsors.total desc 0]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      org_top_sponsors.total: Amount
      org_top_sponsors.name: Sponsor
    series_column_widths: {}
    series_cell_visualizations:
      org_top_sponsors.total:
        is_active: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    defaults_version: 1
    listen:
      Event: events_for_org.event_name_and_date
    row: 0
    col: 18
    width: 6
    height: 12
  filters:
  - name: Event
    title: Event
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: '@{stack}_matts_super_sweet_model'
    explore: organization
    listens_to_filters: []
    field: events_for_org.event_name_and_date
