#' Post traccar data
#'
#' Upload data to your traccar server
#' @param user The username for your traccar database
#' @param password The password for your traccar database
#' @param name The name of the individual you are adding to your traccar server
#' @param unique_id The id of the individual you are adding to your traccar server
#' @param url The url of your traccar server
#' @return A dataframe
#' @export
#' @import dplyr
#' @import httr

add_traccar_data <- function(user,
                             password,
                             name,
                             unique_id,
                             url){
  # url <- paste0(url, '/api/devices')
  name <- paste0(name, ' (', uniqueId, ')')
  r <- POST(url = url, authenticate(admin, password),
            body = list(name=name, unique_id = unique_id),
            encode = 'json')
  if(r$status_code == 200){
    message('Status code is 200, successful')
  } else {
    message('Status code is ', r$status_code, ' unsuccessful (likely because worker already added)')
  }

}
