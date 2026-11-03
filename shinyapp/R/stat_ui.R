

stat_ui <- function(stats){
  
  # the component
  tags$div(class = "stats-container",
           tags$div(class = "stats-grid",
                    
                    # loop over input
                    lapply(stats, \(x) do.call(stat_card, x))
                    
           ),
           
           # footer
           tags$div(class = "stats-footer",
                    actionLink("hide_stats", "Hide stats", class = "btn-hide")))
  
}
