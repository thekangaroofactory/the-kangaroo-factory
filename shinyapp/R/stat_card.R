

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

stat_card <- function(title, icon, value = 0, trend = NULL, label, target = NULL){
  
  # the component
  tags$div(class = "stat-card",
           onclick = if(!is.null(target)) paste0("Shiny.setInputValue('", target, "', '", title, "', {priority: 'event'});"),
           style = if(!is.null(target)) "cursor: pointer;",
           
           # header (icon + title)
           tags$div(class = "stat-header",
                    tags$div(class = "icon-wrapper", tags$i(class = icon)),
                    tags$span(class = "stat-title", title)),
           
           # body (value + label)
           tags$div(class = "stat-body",
                    tags$div(class = "stat-value", value,
                             if(!is.null(trend))
                               tags$span(class = "trend-up", tags$i(class = "fa-solid fa-arrow-trend-up"), trend)),
                    tags$div(class = "stat-label", label))) 
  
}
