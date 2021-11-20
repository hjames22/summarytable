#' Table Helper
#'
#' This function helps take a data frame and a chosen variable and counts the frequency of
#' observations within each group then computes what percentage those observations are of
#' the total observations of that variable. Non public function which helps main funciton in package.
#'
#' @param df is the data frame to create summaries from
#' @param var is the non-numeric variable from data frame df
#' @return Tibble containing the number of unique observations in each group and the percentage of the total observations that the group contains
#' @importFrom dplyr mutate
#' @importFrom dplyr summarise
#' @importFrom dplyr count
#' @importFrom stringr str_detect
#' @importFrom rlang as_label
#' @importFrom dplyr n
#' @importFrom dplyr group_by
#' @importFrom magrittr %>%
#' @importFrom tibble tibble



# Main Function

table_helper <- function(df, var){
  var <- rlang :: enquo(var)

  #summarise helper to prevent duplicated code in public function
  df %>%
    dplyr::group_by(!!var) %>% #group by unquoted variable
    dplyr::summarise(count=dplyr::n()) %>%
    dplyr::mutate(percentage = (count/sum(count))*100)
}


#' Summary count and percentage of total
#'
#' This function takes a data frame and a chosen variable and counts the frequency of observations within each group then computes what percentage those observations are of the total observations of that variable.
#'
#' @param df is the data frame to create summaries from
#' @param var is the non-numeric variable from data frame df
#' @param rows is the number of rows the user would like displayed from the summary table, ordered by highest frequency of group
#' @return Tibble containing the groups, the number of unique observations in each group and the percentage of the total observations that the group contains
#' @importFrom dplyr mutate
#' @importFrom dplyr summarise
#' @importFrom dplyr count
#' @importFrom stringr str_detect
#' @importFrom rlang as_label
#' @importFrom dplyr n
#' @importFrom dplyr group_by
#' @importFrom magrittr %>%
#' @importFrom tibble tibble
#' @importFrom ds4psy is_wholenumber
#' @examples
#' count_freq_perc(PlantGrowth, group, 1)
#' count_freq_perc(iris, Species)
#' count_freq_perc(iris, Species, 2)
#' @export
#'
# Function
count_freq_perc <- function(df, var, rows){
  var <- rlang::enquo(var)
  columns <- colnames(df) #create vector of colnames

  #make sure var is actually a column in the data frame
  if(!any(stringr::str_detect(as_label(var), columns)) == TRUE){
    stop("var is not a column in the data frame")
  }

  #check that column is not numeric
  check_a <- dplyr::summarise(df, is.numeric( !!var )) ## from slack thread inspiration
  if (check_a[[1]]) {
    stop("selected variable is numeric")
  }

  #check whether rows is MISSING
  if (missing(rows)) {
    warning("Please specify rows with your desired number of returned rows or with rows = NULL. Returning table with all groups displayed")
    return(table_helper(df, !!var))
  }

  #check whether rows is NULL
  if (is.null(rows)) {
    return(table_helper(df, !!var))
  }

  #Rows specified and an whole number
  if(!is.null(rows) && !ds4psy::is_wholenumber(rows)) {
    stop("number of rows must be a whole number")
  }

  #Rows specified and less than the total number of groups in the data frame
  if(rows > nrow(table_helper(df, !!var))) {
    warning("Number of rows must be less than or equal to the number of groups within the chosen variable. All groups are displayed in output")
    return(table_helper(df, !!var))
  }

  #if passes test, run function with n rows
  else  {table_helper(df, !!var) %>%
      dplyr::slice_max(order_by = count, n= rows)
  }
}

