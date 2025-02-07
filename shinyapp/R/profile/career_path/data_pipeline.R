

#library(dplyr)

# -- data
data_pipeline <- function(data){
  
  # -- replace date NAs by current date
  data[is.na(data$end.date), ]$end.date <- Sys.Date()
 
  # -- turn category & section into factors
  data$category <- factor(data$category)
  data$section <- factor(data$section)

  # -- order & return
  data %>%
    arrange(category, section)
  
}

# -- companies
company_pipeline <- function(data){
  
  data %>%
    filter(company != "") %>%
    select(start.date, end.date, company) %>%
    group_by(company) %>%
    summarise(start.date = min(start.date),
              end.date = max(end.date))
  
}

# -- categories
category_pipeline <- function(data){
  
  data %>%
    select(category, level, start.date) %>%
    group_by(category) %>%
    summarise(max = max(level),
              mean = mean(level),
              x = min(start.date)) %>%
    mutate(x = min(x))
    
}

# -- sections
section_pipeline <- function(data){
  
  data %>%
    select(section, level, start.date) %>%
    group_by(section) %>%
    summarise(max = max(level),
              mean = mean(level),
              min =  min(level),
              x = min(start.date)) %>%
    mutate(x = min(x))
  
}

# -- timeline
timeline_pipeline <- function(data){
  
  data %>%
    reframe(label = unique(format(start.date, "%Y")),
              start.date = as.Date(paste0(label, "-01-01")))
  
}
