

stat_ui <- function(stats){
  
  # the component
  div(class = "stats-container",
           div(class = "stats-grid",
                    
                    # loop over input
                    lapply(stats, \(x) do.call(stat_card, x))
                    
           ),
           
           # footer
           div(class = "stats-footer",
                    actionLink("hide_stats", "Hide stats", class = "btn-hide")))
  
}
