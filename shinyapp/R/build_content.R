
build_content <- function(config, package, blog, wiki){
  
  # Packages
  pkg <- data.frame(type = "package",
                    id = sapply(package, "[[", "id"),
                    title = sapply(package, "[[", "Package"),
                    date = sapply(package, "[[", "_created"))
  
  # Projects
  prj <- data.frame(type = "project",
                    id = sapply(config$projects, "[[", "id"),
                    title = sapply(config$projects, "[[", "title"),
                    date = sapply(config$projects, "[[", "date"))
  
  # Guides
  bok <- data.frame(type = "guide",
                    id = sapply(config$guides, "[[", "id"),
                    title = sapply(config$guides, "[[", "title"),
                    date = sapply(config$guides, "[[", "date"))
  
  # Blog
  blg <- data.frame(type = "post",
                    id = blog$entries$id,
                    title = blog$entries$item_title,
                    date = blog$entries$item_pub_date)
  
  # Wiki
  wik <- data.frame(type = "article",
                    id = wiki$entries$id,
                    title = wiki$entries$item_title,
                    date = wiki$entries$item_pub_date)

  # merge & return  
  rbind(pkg, prj, bok, blg, wik)
  
}
