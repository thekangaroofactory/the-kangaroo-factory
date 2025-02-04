

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

contact_server <- function(id, user = NULL, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    # -- declare objects
    path_contact <- reactiveVal(NULL)
    
    
    # --------------------------------------------------------------------------
    # User
    # --------------------------------------------------------------------------
    
    # -- Observe user
    observeEvent(user(), {
      
      cat(MODULE, "Set user =", user(), "\n")
      
      # -- set path
      path_contact(file.path(path$data, user(), "contact"))
      
    })
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------
    
    # -- Contact grid
    output$contact_grid <- renderUI({
      
      # -- read user contact file
      cat(MODULE, "Build contact grid \n")
      contacts <- read.csv(file = file.path(path_contact(), "contacts.csv"), header = T)
      
      # -- helper function
      helper <- function(x){
        
        # -- cast to list (to use $)
        x <- as.list(x)
        
        # -- return
        card(
          class = "border border-light",
          card_header(x$name),
          x$description,
          tags$a(href = x$link, 
                 target = "_blank",
                 x$name))}
      
      # -- apply helper
      cards <- apply(contacts, MARGIN = 1, helper)
      
      # -- wrap
      contact_wrapper <- if(length(cards) > 1)
        do.call(layout_column_wrap, c(list(class = "mt-5"), unname(cards)))
      else
        cards
      
      # -- key figures
      card(
        class = "border-radius bg-light p-3",
        
        layout_columns(
          col_widths = c(4, 8),
          
          # -- text
          tagList(
            p("You can contact me blablablablabla")),
          
          # -- cards
          contact_wrapper
      
        ))
      
      
    })
    
    
    # -- Links grid
    output$link_grid <- renderUI({
      
      # -- read user link file
      cat(MODULE, "Build link grid \n")
      links <- read.csv(file = file.path(path_contact(), "links.csv"), header = T)
      
      # -- helper function
      helper <- function(x){
        
        # -- cast to list (to use $)
        x <- as.list(x)
        
        # -- return
        card(
          class = "border border-light",
          card_header(
            class = "bg-primary",
            x$name),
          x$description,
          tags$a(href = x$link, 
                 target = "_blank",
                 x$name))}
      
      # -- apply helper & return
      cards <- apply(links, MARGIN = 1, helper)
      
      # -- wrap & return
      if(length(cards) > 1)
        do.call(layout_column_wrap, c(list(class = "mt-5"), unname(cards)))
      else
        cards
      
    })
    
  })
}
