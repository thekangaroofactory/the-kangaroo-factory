

temporary_career_path <- function(printable = FALSE){
  
  target_path <- "E:/Portfolio/R/Projects/the-kangaroo-factory/data/philippeperet/profile"
  
  # -- load data
  data <- load_data(path = target_path,
                    filename = "career_path_en.csv")
  
  # -- apply pipelines
  data_2 <- data_pipeline(data)
  company <- company_pipeline(data_2)
  category <- category_pipeline(data_2)
  section <- section_pipeline(data_2)
  timeline <- timeline_pipeline(data_2)
  
  
  # -- build plot & return
  p <- career_path_2(data_2, company, category, section, timeline, printable)
 
  # -- save plot
  ggsave(
    plot = p,
    filename = file.path(target_path, paste0("career_path_en", ifelse(printable, "_printable", ''), ".png")),
    width = 1000, 
    height = 500,
    units = "px",
    dpi = 96,
    bg = "transparent")
   
}
