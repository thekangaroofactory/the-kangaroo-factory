

# library(ggplot2)
# library(ggtext)
# library(ragg)
# library(RColorBrewer)

career_path_2 <- function(data, company, category, section, timeline){

  # -- colors
  # plot_background_fill <- "#2d3037"
  plot_background_fill <- 'transparent'
  background_color <- "grey85"
  text_color <- "grey90"
  
  # -- segments
  segment_contract_x <- 150
  segment_size_y <- 4
  segment_alpha <- 0.7
  segment_text_size <- 4
  segment_text_nudge_y <- 0.1
  segment_text_nudge_x <- 200
  
  # -- category & section
  section_nudge_x <- 1000
  
  # -- company
  company_y <- -0.4
  
  # -- timeline
  timeline_text_y <- -0.15
  
  # -- axis
  expand_limits_x <- 0
  
    
  # -- init
  data %>% 
    ggplot() +
    
    # -- experiences & skills --------------------------------------------------
    # -- segments
    geom_segment(
      aes(x = start.date + segment_contract_x,
          xend = end.date - segment_contract_x,
          y = level,
          yend = level,
          colour = as.numeric(start.date)),
      linewidth = segment_size_y,
      lineend = 'round', 
      alpha = segment_alpha) +
    
    # -- apply color palette (on start.date)
    scale_color_distiller(palette = "OrRd", trans = "reverse") +
    
    # -- labels: title
    geom_text(
      aes(
        x = start.date + (end.date - start.date) / 2,
        y = level,
        label = title,
        hjust = 0),
      nudge_y = segment_text_nudge_y,
      nudge_x = segment_text_nudge_x,
      size = segment_text_size,
      colour = text_color) +
    
    # -- labels: sub-title-1
    geom_text(
      aes(
        x = start.date + (end.date - start.date) / 2,
        y = level,
        label = sub.title.1,
        hjust = 0),
      nudge_y = segment_text_nudge_y,
      nudge_x = -segment_text_nudge_x,
      size = segment_text_size,
      colour = text_color) +
    
    # -- labels: sub-title-2
    # HACK: only data domains uses this variable
    # To avoid text on segment
    geom_text(
      aes(
        x = start.date + segment_contract_x,
        y = level,
        label = sub.title.2,
        hjust = 0),
      nudge_y = segment_text_nudge_y,
      size = segment_text_size,
      colour = text_color) +
  
    # -- axis (timeline) -------------------------------------------------------
    # -- line
    geom_hline(
      aes(yintercept = 0),
      colour = background_color,
      alpha = 0.5) +
      
    # -- ticks
    geom_point(
      data = timeline,
      aes(
        x = start.date, 
        y = 0), 
      shape = 24,
      fill = background_color,
      size = 4) +
        
    # -- legends
    geom_text(
      data = timeline,
      aes(
        x = start.date, 
        y = timeline_text_y, 
        label = label), 
      size = 5,
      fontface = "bold",
      colour = text_color,
      hjust = 0.5) +
    
    # -- section ---------------------------------------------------------------
    # -- section titles
    geom_text(
      data = section,
      aes(x = x - section_nudge_x,
          y = min,
          label = section),
      hjust = 0,
      family = "Grandview",
      fontface = "bold",
      colour = text_color,
      size = 6) +
    
    
    # -- company ---------------------------------------------------------------
    # -- segments
    geom_segment(
      data = company,
      aes(x = start.date + segment_contract_x,
          xend = end.date - segment_contract_x,
          y = company_y,
          yend = company_y,
          colour = as.numeric(start.date)),
      linewidth = segment_size_y, 
      lineend = 'round', 
      alpha = segment_alpha) +
    
    # -- labels
    geom_text(
      data = company,
      aes(
        #x = start.date + segment_contract_x,
        x = start.date + (end.date - start.date) / 2,
        y = company_y,
        label = company,
        hjust = 1),
      nudge_y = -segment_text_nudge_y,
      size = segment_text_size,
      colour = text_color) +
    
    # **************************************************************************
    coord_flip() +


    # -- axis ------------------------------------------------------------------
    # expand beyond end.date to allow more rooms for labels
    expand_limits(x = max(data$end.date) + expand_limits_x,
                  y = c(-0.9, 2.6)) +
    
    # -- theme -----------------------------------------------------------------
    theme(
      
      # -- background & grid
      panel.background = element_rect(fill = plot_background_fill, colour = NA),
      panel.border = element_blank(),
      plot.background = element_rect(fill = plot_background_fill, colour = NA),
      panel.grid = element_blank(),
      
      # -- axis
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      axis.text.y = element_blank(),
      axis.text.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.ticks.y = element_blank(),
      
      # -- legend
      legend.position = "none")
  
}
