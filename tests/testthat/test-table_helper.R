# test that function can handle vectors with no NA
test_that("function works with expected values", {
  expect_s3_class(table_helper(test.data, colour), "data.frame") # regular use case no NA
  expect_equal(dim(table_helper(test.data, colour)), c(4, 3))
  expect_equal(ncol(table_helper(test.data, colour)), 3)
})


# test that function can handle vectors with NA
test_that("function can take N/As", {
  expect_s3_class(table_helper(test.data, sex), "data.frame") # regular use case w NA
  expect_s3_class(table_helper(test.data, nothing), "data.frame") # ALL NA
})
