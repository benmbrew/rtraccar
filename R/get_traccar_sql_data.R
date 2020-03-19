#' Get traccar sql data
#'
#' Retrieve traccar data stored in a sql database
#' @param database_name The name of your database
#' @param database_host_ip The host ip address of your database
#' @param user The username for your database
#' @param password The password for your database
#' @param port The port number for yourdatabse
#' @return A dataframe
#' @export
#' @import dplyr
#' @import httr

get_traccar_sql_data <- function(database_name, database_host_ip, user, password, port){
  # Example to connect to database:
  creds <- list(dbname = database_name,
                host = database_host_ip,
                user = user,
                pass = pass)

  # Connect to database
  con <- DBI::dbConnect(drv = RMySQL::MySQL(),
                        dbname = creds$dbname,
                        host = creds$host,
                        user = creds$user,
                        pass = creds$pass,
                        port = port)

  out = dbGetQuery(conn = con,
                   "select * FROM users;")

  return(out)
}
