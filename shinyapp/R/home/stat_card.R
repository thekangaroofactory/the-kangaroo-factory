

#' Stat Card
#'
#' @param title a character string.
#' @param icon a character string (see details).
#' @param value a numeric value.
#' @param trend a numeric value.
#' @param label a character string.
#' 
#' @details
#' `icon` expects a class to pass to `shiny::tags$i()`.
#'
#' @returns a HTML tag.
#' @export
#'
#' @examples
#' stat_card(title = "foo", icon = "fa-solid fa-arrow", value = 1, label = "lorem ipsum")

stat_card <- function(title, icon, value = 0, trend = NULL, label = "", target = NULL, nav = NULL, id = "#"){
  
  # the component
  div(class = "stat-card",
      onclick = if(!is.null(nav)) sprintf("Shiny.setInputValue('%s', {nav: '%s', id: '%s'}, {priority: 'event'});",
                                          target, nav, id),
      style = if(!is.null(nav)) "cursor: pointer;",
      
      # header (icon + title)
      div(class = "stat-header",
          div(class = "icon-wrapper", tags$i(class = icon)),
          span(class = "stat-title", title)),
      
      # body (value + label)
      div(class = "stat-body",
          div(class = "stat-value", value,
              if(!is.null(trend))
                span(class = "trend-up", tags$i(class = "fa-solid fa-arrow-trend-up"), trend)),
          div(class = "stat-label", label))) 
  
}
