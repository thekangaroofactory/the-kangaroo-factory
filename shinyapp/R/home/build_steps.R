

build_steps <- function(trend){
  
  trend |>
    dplyr::select(type, title) |>
    dplyr::mutate(subtitle = dplyr::case_when(type == "project" ~ "The project description has been updated.",
                                             type == "package" ~ "A new version of the package is available!",
                                             type == "guide" ~ "The book has been updated.",
                                             type == "blog" ~ "A new blog post has been published",
                                             type == "wiki" ~ "A new wiki article is available"),
                  
                  action = dplyr::case_when(type == "project" ~ "Read",
                                            type == "package" ~ "Go to package",
                                            type == "guide" ~ "See it",
                                            type == "blog" ~ "Read post",
                                            type == "wiki" ~ "See it"))
  
}
