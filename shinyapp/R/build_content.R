
build_content <- function(config, package, blog, wiki){
  
  # Packages
  pkg <- data.frame(type = "package",
                    title = sapply(package, "[[", "Package"),
                    date = sapply(package, "[[", "_created"))
  
  # Projects
  prj <- data.frame(type = "project",
                    title = sapply(config$projects, "[[", "title"),
                    date = sapply(config$projects, "[[", "date"))
  
  # Guides
  bok <- data.frame(type = "guide",
                    title = sapply(config$opensource$guides, "[[", "title"),
                    date = sapply(config$opensource$guides, "[[", "date"))
  
  # Blog
  blg <- data.frame(type = "post",
                    title = blog$entries$item_title,
                    date = blog$entries$item_pub_date)
  
  # Wiki
  wik <- data.frame(type = "article",
                    title = wiki$entries$item_title,
                    date = wiki$entries$item_pub_date)

  # merge & return  
  rbind(pkg, prj, bok, blg, wik)
  
}
