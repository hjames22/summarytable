% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/count_freq_perc.R
\name{count_freq_perc}
\alias{count_freq_perc}
\title{Summary count and percentage of total}
\usage{
count_freq_perc(df, var, rows)
}
\arguments{
\item{df}{is the data frame to create summaries from}

\item{var}{is the non-numeric variable from data frame df}

\item{rows}{is the number of rows the user would like displayed from the summary table, ordered by highest frequency of group}
}
\value{
Tibble containing the groups, the number of unique observations in each group and the percentage of the total observations that the group contains
}
\description{
This function takes a data frame and a chosen variable and counts the frequency of observations within each group then computes what percentage those observations are of the total observations of that variable.
}
\examples{
count_freq_perc(PlantGrowth, group, 1)
count_freq_perc(iris, Species)
count_freq_perc(iris, Species, 2)
}
