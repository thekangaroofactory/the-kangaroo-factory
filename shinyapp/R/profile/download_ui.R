

download_ui <- function(ns){
  
  # -- return
  tagList(
    
    p("Select desired options and click the download button."),
    
    # -- columns
    layout_columns(
      col_widths = c(3, 3, 6),
      
      # -- type
      card(
        class = "border-light",
        card_header("Type"),
        p("Key takeways will be a one-page document without detailed experiences.", br(),
          "It may be useful to quicly share a profile and see if there is an interest for a more detailed resume."),
        radioButtons(
          inputId = ns("resume_type"),
          label = "Select",
          choices = c("Key takeways" = "keyTakeways", 
                      "Full resume" = "full"))),
      
      # -- anonymous
      card(
        class = "border-light",
        card_header("Privacy"),
        p("Set anonymous ON if you want to get a document without the last name, contact info & links to other plateforms."),
        checkboxInput(
          inputId = ns("resume_privacy"),
          label = "Anonymous",
          value = F)),
      
      # -- preview
      card(
        class = "border-light",
        card_header("Preview"),
        "some cute stuff here"))
    
  ) # tagList
  
}
