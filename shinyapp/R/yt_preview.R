

yt_preview <- function(id){

  ns <- NS(id)
  
  div(
    id = "yt_preview",
    card_image(src = "./img/lab_video_preview.png", alt = "Video preview"),
    actionButton(class = "ktag", inputId = ns("yt_launch"), label = icon("play")))

}
