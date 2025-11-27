

contact_ui <- function(id){
  
  div(
    class = "section",
    
    # -- email
    p("Send me an", a(href = "mailto:philippe.peret@hotmail.com", "email")), br(),
    
    # -- linkedin
    actionButton(
      inputId = "linkedin",
      label = "linkedin",
      onclick = paste0("window.open('", "https://www.linkedin.com/in/philippeperet/", "', '_blank')")))
  
}
