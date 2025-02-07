

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
    # Projects
    # --------------------------------------------------------------------------
    
    # -- project list
    projects <- reactive({
      
      # -- read user file
      cat(MODULE, "Scan user repository \n")
      read.csv(file = file.path(path_portfolio(), "projects.csv"), header = TRUE)
      
    })
    
    
    # -- output: select project
    output$select_project <- renderUI(
      
      selectInput(inputId = ns("project_type"), 
                  label = "Project type", 
                  choices = projects()$type,
                  multiple = TRUE))
    
    
    # -- output: project grid
    output$project_grid <- renderUI({
      
      cat(MODULE, "Build project grid \n")
      
      # -- apply filter
      idx <- if(is.null(input$project_type))
        projects()$id
      else
        projects()[projects()$type %in% input$project_type, ]$id
      
      # -- build & return ui
      do.call(
        layout_column_wrap,
        c(
          list(width = "400px",
               fixed_width = TRUE),
          lapply(idx, function(x) card_project(projects()[x, ], ns, input, path_portfolio()))))
      
    }) |> bindEvent(input$project_type, ignoreNULL = FALSE, ignoreInit = TRUE)
    
    
    # -- observe: open project
    observeEvent(input$open_project, {
     
      # -- get project [p*]
      p_nb <- unlist(strsplit(input$open_project, "_"))[2]
      
      showModal(
        modalDialog(
          easyClose = T,
          match.fun(paste0("project_modal_", p_nb))(path$data)
        )
      )
      
      
      
    })
    
    
  })
}
