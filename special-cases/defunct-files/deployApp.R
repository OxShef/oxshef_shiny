

source("access-oxrep.R", local = TRUE)
switch(menu(c("Yes", "No"), title = paste("The current value of username_oxrep_db is", username_oxrep_db, "\nThis MUST be 'server.username' when deploying to the server. IS IT?")) + 1,
       cat("Nothing done\n"),
       rsconnect::deployApp(),
       message("Okay, please go to data-processing.R and change the value of username_oxrep_db then!"))
