

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
    # scan user repository
    projects <- reactive(
      read.csv(file = file.path(path_portfolio(), "projects.csv"), header = TRUE))
    
    
    # -- project cards
    # intermediate layer to avoid multiple computations
    c_projects <- reactive(
      lapply(projects()$id, function(x) card_project(projects()[projects()$id == x, ], ns, input, path_portfolio())))
    
    
    # -- output: select project
    output$select_project <- renderUI(
      selectInput(inputId = ns("project_type"), 
                  label = "Project type", 
                  choices = unique(unlist(strsplit(projects()$type, split = " "))),
                  multiple = TRUE))
    
    
    # -- output: project grid
    output$project_grid <- renderUI({
    
      # -- get project ids
      idx <- if(is.null(input$project_type))
        projects()$id
      else
        projects() |> dplyr::filter(grepl(paste(input$project_type, collapse = "|"), type)) |> dplyr::pull(id)

      # -- build & return ui
      do.call(
        layout_column_wrap,
        c(
          list(width = "400px",
               fixed_width = TRUE,
               heights_equal = "row"),
          c_projects()[match(idx, projects()$id)]))
      
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
