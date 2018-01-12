view: cengage {
  label: "JW player shared data"
  sql_table_name: CENGAGE.CENGAGE ;;

  measure: ad_impressions {
    type: sum
    sql: ${TABLE}.AD_IMPRESSIONS ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.BROWSER ;;
  }

  measure: completes {
    type: sum
    sql: ${TABLE}.COMPLETES ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATE ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.DEVICE ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.DOMAIN ;;
  }

  measure: embeds {
    type: sum
    sql: ${TABLE}.EMBEDS ;;
  }

  dimension: pageurl {
    type: string
    sql: ${TABLE}.PAGEURL ;;
  }

  dimension: url_data {
    group_label: "url data"
    label: "raw data"
    type: string
    sql: parse_url(${pageurl}, 1) ;;
  }

  dimension: url_parameters {
    sql: ${url_data}:parameters ;;
    hidden: yes
  }

  dimension: gradable {
    group_label: "url data"
    type: string
    sql: ${url_parameters}:isGradable ;;
  }

  dimension: timeliness {
    group_label: "url data"
    description: "how early before due date is this being done?"
    type: number
    sql: datediff(seconds, ${date_raw}, to_timestamp(nullif(${url_parameters}:endDate, '')::int, 3)) / 60 / 60 / 24 ;;
    value_format: "d \d\a\y\s h \h\r\s \b\e\f\o\r\e \d\u\e"
  }

  dimension: timeliness_tier {
    group_label: "url data"
    description: "how early before due date - bucketed"
    type: tier
    style: relational
    sql: ${timeliness} ;;
    tiers: [0, 1, 2, 5, 10]
  }

  dimension: attempt {
    group_label: "url data"
    type: tier
    tiers: [1,2,3]
    sql: ${url_parameters}:attemptIndex ;;
  }

  measure: plays {
    type: sum
    sql: ${TABLE}.PLAYS ;;
  }

  measure: time_watched_total {
    type: sum
    sql: ${TABLE}.TIME_WATCHED ;;
  }

  measure: time_watched_avg {
    type: average
    sql: ${TABLE}.TIME_WATCHED ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
