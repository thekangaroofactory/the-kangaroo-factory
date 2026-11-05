

service_ui <- function(){
  
  # -- return
  tagList(
    
    h1("Technical-Functional Data Services"),
    p(class="subtitle", "Backed by", as.numeric(format(Sys.Date(), "%Y")) - 2001, "years of data experience."),
    
    # -- contact me
    div(
      class = "mt-5",
      actionButton(
        class = "ktag",
        inputId = "switch_contact",
        label = "Contact me")),
    
    # -- intro
    p(class = "mt-5", "Services are organized into three main axes — each of them involves a combination of technical-functional skills."),
    
    
    # //////////////////////////////////////////////////////////////////////////
    # main layout
    
    layout_column_wrap(
      class = "mt-5",
      
      # -- functional ----------------------------------------------------------
      tagList(
        h2("Functional Services"),
        
        tags$ul(
          tags$li("Data Project Management"),
          tags$li("Architecture (portfolio, apps, data flow)"),
          tags$li("Quality Assessment"),
          tags$li("Transformation"))),
      
      
      # -- mentoring -----------------------------------------------------------
      tagList(
        h2("Mentoring Services"),
        
        tags$ul(
          tags$li("Coaching & mentoring"),
          tags$li("Training development"),
          tags$li("Capitalization"),
          tags$li("Content creation"))),
      
      
      # -- technical -------------------------------------------------------
      tagList(
        h2("Technical Services"),
        
        tags$ul(
          tags$li("Data analysis & visualizations"),
          tags$li("APIs, dashboards & web applications"),
          tags$li("Packages & documentation")))))
  
}
