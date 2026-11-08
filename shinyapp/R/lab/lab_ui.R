

lab_ui <- function(id){
  
  # -- namespace
  ns <- shiny::NS(namespace = id)
  
  # -- wrap & return
  tagList(
    
    hero_section(title = "The Lab",
                 description = "Try it by yourself!"),
    
    div(class = "section-container",
        
        # ----------------------------------------------------------------------
        # intro
        
        p("The lab offers an opportunity to test the {", a(id = "lab-link_kitems_doc_1", 
                                                           class = "ktag", 
                                                           href = "https://thekangaroofactory.github.io/kitems/", 
                                                           target = "_blank", 
                                                           "kitems"), "} framework."),
        
        p("The package defines itself as a framework because it comes with a flexible mindset & many features:"),
        tags$ul(
          tags$li("different architecture / implementation patterns"),
          tags$li("flexible create / update / delete workflows"),
          tags$li("communication strategy"),
          tags$li("filtering layers")),
        
        p("For the sake of the example, a very basic data model is defined in this example with date, name, value and checked attributes.", br(),
          "This was done through the Admin Console that can't be implemented here for security reasons (basically I can't allow you to break this lab!)."),
        
        
        # ----------------------------------------------------------------------
        # start
        
        h2(class = "section", "Before you start"),
        
        layout_columns(
          col_widths = c(4, 4),
          card(
            card_header("Documentation"),
            p("Visit the package", a(id = "lab-link_kitems_doc_2", 
                                     class = "ktag", 
                                     href = "https://thekangaroofactory.github.io/kitems/", 
                                     target = "_blank", "website"), "to get detailed description.")),
          card(
            card_header("Introduction video"),
            div(
              id = "yt_container",
              class = "k-preview",
              yt_preview(id)))),
        
        # ----------------------------------------------------------------------
        # demo area
        
        h2(class = "section", "Try it!"),
        
        div(
          class = "mt-5",
          navset_card_pill(
            
            # -- items tab
            nav_panel("Items",
                      
                      p(class = "mt-2", "For demonstration purpose, autosave is turned OFF 
                        (data will be lost if you refresh the page)"),
                      
                      # -- layout
                      layout_columns(
                        class = "mt-3",
                        col_widths = c(7, 5),
                        
                        # -- kitems ui
                        wellPanel(
                          
                          # -- actions (btn + filter)
                          layout_columns(
                            col_widths = c(4, 8),
                            
                            # -- buttons
                            div(
                              class = "mt-4",
                              style = "display:inline-block;",
                              kitems::create_widget(ns(id)),
                              kitems::update_widget(ns(id)),
                              kitems::delete_widget(ns(id))),
                            
                            # -- filter
                            div(
                              kitems::date_slider_widget(ns(id)))),
                          
                          # -- item table
                          kitems::item_widget(ns(id))),
                        
                        # -- side card
                        card(
                          class = "border-radius tkf-bg-camel color-dark p-3",
                          fill = TRUE,
                          card_header("Behind the scene"),
                          
                          p("How does it work?"),
                          p("The UI components are the visible part of the iceberg,
                            while a module server is running in the background to automate 
                            everything from the data model definition."),
                          
                          p("Once the data model is defined, kitems takes care of all the core tasks:"),
                          tags$ul(
                            tags$li("create / update / delete items"),
                            tags$li("manage data persistence (turned off here)"),
                            tags$li("generate dynamic forms based on the data model"),
                            tags$li("apply filter(s) on the data")),
                          
                          p("But all it takes is... a single line!", br(),
                            tags$code("data <- kitems::kitems(id = 'lab')")),
                          
                          p("From there, you can use the", tags$code("data"), "object to navigate & use the items."),
                          
                          p("Server-to-server back-end capabilities may be used to programmatically create (update / delete) items:"),
                          div(
                            style = "display:inline-block;",
                            actionButton(inputId = ns("generate_10"), label = "Generate x10 items"),
                            actionButton(inputId = ns("generate_100"), label = "Generate x100 items"),
                            actionButton(inputId = ns("clear"), label = "Clear all items")),
                          
                          p("In the below example, the", tags$code("data"), "object is used to build two basic plots:"),
                          
                          # -- plots
                          uiOutput(ns("layout"))))),
            
            
            # -- data model tab
            nav_panel("Data model",
                      
                      p(class = "mt-2", "The data model documents the definition of an item.", br(),
                        "It holds attributes that are defined with:"),
                      
                      tags$ul(
                        tags$li("a type"),
                        tags$li("a default value or function (optional)"),
                        tags$li("whether they are displayed in the item table"),
                        tags$li("whether they are skipped in the item form"),
                        tags$li("options if used to order the items")),
                      
                      p("To do so, an Admin Console is delivered as a standalone Shiny app."))))))
  
}
