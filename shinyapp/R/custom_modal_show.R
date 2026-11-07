

custom_modal_show <- function(ui = NULL){

  if(is.null(ui))
    return(invisible(NULL))
  
  # insert UI
  insertUI(selector = "#custom-modal-placeholder",
           where = "beforeEnd",
           ui = ui)
  
  # toggle modal
  shinyjs::addClass(id = "modal-overlay", class = "active")
  
}
