

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

portfolio_server <- function(id, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- declare objects
    ns <- session$ns
    MODULE <- paste0("[", id, "]")

    
    # --------------------------------------------------------------------------
    # Projects
    # --------------------------------------------------------------------------
    
    # -- read project list
    projects <- read.csv(file = file.path(path, "projects.csv"), header = TRUE)
    
    # -- project cards
    # intermediate layer to avoid multiple computations
    c_projects <- reactive(
      lapply(projects$id, function(x) card_project(projects[projects$id == x, ], ns, input, path)))
    
    
    # -- output: select project
    output$select_project <- renderUI(
      selectInput(inputId = ns("project_type"), 
                  label = "Filter by project type", 
                  choices = unique(unlist(strsplit(projects$type, split = " "))),
                  multiple = TRUE))
    
    
    # -- output: project grid
    output$project_grid <- renderUI({
    
      # -- log
      if(!is.null(input$project_type))
        ktag(who = session$token, where = id, what = "filter_type", how = paste(input$project_type, collapse = "+"))
      
      # -- get project ids
      idx <- if(is.null(input$project_type))
        projects$id
      else
        projects |> dplyr::filter(grepl(paste(input$project_type, collapse = "|"), type)) |> dplyr::pull(id)

      # -- build & return ui
      do.call(
        layout_column_wrap,
        c(
          list(width = "400px",
               fixed_width = TRUE,
               gap = "2rem",
               heights_equal = "row"),
          c_projects()[match(idx, projects$id)]))
      
    }) |> bindEvent(input$project_type, ignoreNULL = FALSE, ignoreInit = TRUE)
    
    
    # -- observe: open project
    observeEvent(input$open_project, {
     
      # -- get project [p*]
      p_nb <- unlist(strsplit(input$open_project, "_"))[2]
      
      showModal(
        modalDialog(
          easyClose = T,
          match.fun(paste0("project_modal_", p_nb))(path)))
      
    })
    
  })
}
