

rss_reader <- function(id, entry){
  
  tagList(
    
    hero_section(title = entry$item_title,
                 description = entry$item_pub_date),
    
    div(class = "section-container rss-entry",
        actionLink(inputId = paste0(id, "-close-btn"), label = "close tab", icon = icon("close"),
                   onclick = sprintf("Shiny.setInputValue('close_tab', '%s-viewer', {priority: \"event\"})", id)),
        HTML(entry$item_description))
    
  )
  
}
