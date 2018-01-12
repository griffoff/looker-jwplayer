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
