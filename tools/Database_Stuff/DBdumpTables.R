# TODO: Add comment
#
# Author: ryan
#
#  Walk you through connecting and then dumping one or all tables from the database.
#
###############################################################################
library(RSQLite)

readNumberRePrompt <- function(variable, string) {
  ANSWER <- readline(string)
  if (!(ANSWER == "NA"))
    tryCatch(ANSWER <- as.numeric(ANSWER), error = function() { readNumberRePrompt(variable, string) }, warning = function(x) { readNumberRePrompt(variable, string) })
  if (is.numeric(ANSWER) || ANSWER == "NA")
    assign(variable, ifelse(ANSWER == "NA", NA, ANSWER), pos = 1)
}

dir.DB <- ""
print("Path to database files. Windows use / instead of \\")
if (as.logical(readline(paste0("Use Current Directory (TRUE or FALSE): ", getwd(), " : ")))) {
  dir.DB <- getwd()
} else {
  dir.DB <- readline("Path to SQLite database (PATH): ")
  if (!file.exists(dir.DB)) {
    print("Path does not exist")
    dir.DB <- readline("Path to SQLite database (PATH): ")
  }
}

filesInDBdir <- list.files(dir.DB, pattern = "sqlite3")
print(filesInDBdir)
dbIndex <- 0
readNumberRePrompt("dbIndex", "Please select DB: ")
dbName <- filesInDBdir[dbIndex]

dir_out <- ""
print("Path to database output. Windows use / instead of \\")
if (as.logical(readline(paste0("Use Current Directory (TRUE or FALSE): ", getwd(), " : ")))) {
  dir_out <- getwd()
} else {
  dir_out <- readline("Path to output Table(s): ")
  if (!file.exists(dir_out)) {
    print("Path does not exist")
    dir_out <- readline("Path to output Table(s): ")
  }
}

dbFile <- file.path(dir.DB, dbName)

##establish connection##
drv <- dbDriver("SQLite")
con <- dbConnect(drv, dbFile)

headerTables <- c("runs", "sqlite_sequence", "header", "run_labels", "scenario_labels", "sites", "experimental_labels", "treatments", "simulation_years", "weatherfolders")
Tables <- dbListTables(con)
if (any(Tables %in% headerTables)) Tables <- Tables[-which(Tables %in% headerTables)]
print(Tables)
TableNumber <- 0
readNumberRePrompt("TableNumber", "Please select table to dump, 0 = all : ")

if (TableNumber == 0) {
  for (i in 1:length(Tables)) {
    temp <- dbReadTable(con, Tables[i])
    utils::write.csv(x = temp, file = file.path(dir_out, paste0(Tables[i], ".csv")), row.names = FALSE)
  }
  con <- dbConnect(drv, file.path(dir.DB, "dbTables.sqlite3"))
  temp <- dbReadTable(con, "header")
  utils::write.csv(x = temp, file = file.path(dir_out, paste0("header", ".csv")), row.names = FALSE)
} else {
  temp <- dbReadTable(con, Tables[TableNumber])
  utils::write.csv(x = temp, file = file.path(dir_out, paste0(Tables[TableNumber], ".csv")), row.names = FALSE)
  if (as.logical(readline(paste0("Write Header Table (TRUE or FALSE) : ")))) {
    con <- dbConnect(drv, file.path(dir.DB, "dbTables.sqlite3"))
    temp <- dbReadTable(con, "header")
    utils::write.csv(x = temp, file = file.path(dir_out, paste0("header", ".csv")), row.names = FALSE)
  }
}


DBI::dbDisconnect(con)

