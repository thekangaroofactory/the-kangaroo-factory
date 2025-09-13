

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

contact_server <- function(id, user = NULL, path) {
  moduleServer(id, function(input, output, session) {
    
    # -- get namespace
    ns <- session$ns
    
    # -- module
    MODULE <- paste0("[", id, "]")
    
    
    # --------------------------------------------------------------------------
    # User
    # --------------------------------------------------------------------------
    
    # -- Path to user data
    path_contact <- reactive(file.path(path$data, user(), "contact"))
    
    
    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------

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
        # adding gtag class to trigger google_tag.js
        actionButton(
          inputId = x$name,
          class = "gtag",
          label = x$name,
          onclick = paste0("window.open('", x$link, "', '_blank')"))}
      
      # -- apply helper & return
      tags <- apply(links, MARGIN = 1, helper)

    })
    
  })
}
