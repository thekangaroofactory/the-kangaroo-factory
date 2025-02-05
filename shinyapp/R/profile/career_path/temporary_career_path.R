

temporary_career_path <- function(){
  
  # -- load data
  data <- load_data(path = "E:/Portfolio/R/Projects/the-kangaroo-factory/data/philippeperet",
                    filename = "career_path_en.csv")
  
  # -- apply pipelines
  data_2 <- data_pipeline(data)
  company <- company_pipeline(data_2)
  category <- category_pipeline(data_2)
  section <- section_pipeline(data_2)
  timeline <- timeline_pipeline(data_2)
  
  
  # -- build plot & return
  p <- career_path_2(data_2, company, category, section, timeline)
  
  #renderPlot(p, bg = "transparent")
  
}
