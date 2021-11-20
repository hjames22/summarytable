# test that function can handle vectors with no NA
test_that("function works with expected values", {
  expect_s3_class(count_freq_perc(test.data, colour, 3), "data.frame") # regular use case no NA
  expect_error(count_freq_perc(test.data, ID, rows = NULL), "variable is numeric") # error for numeric
  expect_equal(dim(count_freq_perc(test.data, colour, 3)), c(4, 3))
  expect_equal(ncol(count_freq_perc(test.data, colour, 2)), 3)
})


# test that function can handle vectors with NA
test_that("function can take N/As", {
  expect_s3_class(count_freq_perc(test.data, sex, rows = NULL), "data.frame") # regular use case w NA
  expect_s3_class(count_freq_perc(test.data, nothing, rows = NULL), "data.frame") # ALL NA
  expect_error(count_freq_perc(test.data, age, rows = NULL), "variable is numeric") # error for numeric
  expect_equal(dim(count_freq_perc(test.data, nothing, rows = NULL)), c(1, 3))#should have one row, 3 col
  expect_error(count_freq_perc(test.data, ID, rows = NULL), "variable is numeric")
})


# test that function rejects vector not in data frame and other incompatible inputs
test_that("testing new summary function", {
  expect_error(count_freq_perc(test.data, AGES, rows = NULL), "var is not a column in the data frame")
  expect_error(count_freq_perc(test.data, 72, rows = NULL), "var is not a column in the data frame")
  expect_error(count_freq_perc(test.data, "alphabet", rows = NULL), "var is not a column in the data frame")
})

#test rows functionality
test_that("testing selected rows addition ", {
  expect_s3_class(count_freq_perc(test.data, sex, rows = 2), "data.frame")
  expect_equal(dim(count_freq_perc(test.data, colour, rows = 1)), c(1, 3))#should have one row, 3 col
  expect_error(count_freq_perc(test.data, AGES, rows = "spaghetti"), "var is not a column in the data frame")
  expect_warning(count_freq_perc(test.data, sex, rows = 56), "Number of rows must be less than or equal to the number of groups within the chosen variable. All groups are displayed in output")
  expect_error(count_freq_perc(test.data, sex, rows = 56.87), "number of rows must be a whole number")
  expect_warning(count_freq_perc(test.data, sex), "Please specify rows with your desired number of returned rows or with rows = NULL. Returning table with all groups displayed")
  expect_error(count_freq_perc(test.data, sex, rows = "56.8"), "non-numeric argument to mathematical function")
}
)
