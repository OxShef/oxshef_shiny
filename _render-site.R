detach_package <- function(pkg, character.only = FALSE)
{
  if (!character.only)
  {
    pkg <- deparse(substitute(pkg))
  }
  search_item <- paste("package", pkg, sep = ":")
  while (search_item %in% search())
  {
    detach(search_item,
           unload = TRUE,
           character.only = TRUE)
  }
}
library(tidyverse)

current_packages <- .packages()
base_r_packages <- c("stats", "graphics", "grDevices", "utils", "datasets", "methods", "base")
invisible(lapply(setdiff(current_packages, base_r_packages), function(x) detach_package(x, character.only = TRUE)))

## You MUST ensure to restart R before generating the site!
rm(list = ls())
rmarkdown::clean_site()
rmarkdown::render_site(envir = new.env())
unlink("README.html")