

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

portfolio_server <- function(id, user = NULL, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    # -- declare objects
    path_portfolio <- reactiveVal(NULL)
    
    
    # --------------------------------------------------------------------------
    # User
    # --------------------------------------------------------------------------
    
    # -- Observe user
    observeEvent(user(), {
      
      cat(MODULE, "Set user =", user(), "\n")
      
      # -- set path
      path_portfolio(file.path(path$data, user(), "portfolio"))
      
      
      
    })
    
    
    # --------------------------------------------------------------------------
    # Project selector
    # --------------------------------------------------------------------------
    
    # -- strategy
    # a partir du user, on scanne les répertoires du repository
    # sections.csv
    # img
    
    # -- build project list
    projects <- reactive({
      
      # -- 
      cat(MODULE, "Scan user repository \n")
      read.csv(file = file.path(path_portfolio(), "projects.csv"), header = TRUE)
      
    })
    
    
    output$select_project <- renderUI(
      
      selectInput(inputId = ns("project_type"), 
                  label = "Project type", 
                  choices = projects()$type,
                  multiple = TRUE)
      
    )
    
    
    observe({
      
      cat(MODULE, "Update preview \n")
      
      # -- 
      helper <- function(x){
        
        # -- card
        card(
          id = ns(paste0("project_", x$id)),
          class = "border border-light",
          fill = FALSE,
          full_screen = TRUE,
          card_image(
            file = file.path(path_portfolio(), paste0("p", x$id), "preview.jpg"),
            alt = "Project preview image"),
          card_body(
            fill = FALSE,
            card_title(x$name),
            p(x$type, br(), x$summary),
            actionButton(inputId = paste0("btn_", x$id),
                         label = "View",
                         onclick = paste0('Shiny.onInputChange("', ns("project_click"), '",', x$id, ')'))))
        
      }
      
      # -- Build project grid output
      output$project_grid <- renderUI(
        
        do.call(
          layout_column_wrap,
          c(
            list(width = "400px",
                 fixed_width = TRUE),
            lapply(projects()[projects()$type %in% input$project_type, ]$id, function(x) helper(projects()[x, ])))))
      
    })
    
    
    # -- observe project card click (view button)
    observeEvent(input$project_click, {
      
      cat(MODULE, "Project click =", input$project_click, "\n")
      project <- projects()[projects()$id == as.integer(input$project_click), ]
      
      showModal(modalDialog(
        size = "xl",
        title = project$name,
        p(project$type),
        p(project$summary),
        p("something")))
                 
      })
    
    observeEvent(input$project_1_full_screen,
                 str(input$project_1_full_screen))
    
    
  })
}
