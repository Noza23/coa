helper <- function(x) {
  switch(x, "%+=%" = list(fun = `%+=%`, job = "Add", expected = list(11, 2:11, rep(NA_real_, 10))),
                       "%-=%" = list(fun = `%-=%`, job = "Subtract", expected = list(9, 0:9, rep(NA_real_, 10))),
                       "%*=%" = list(fun = `%*=%`, job = "Multiply", expected = list(10, 1:10, rep(NA_real_, 10))),
                       "%/=%" = list(fun = `%/=%`, job = "Divide",  expected = list(10, 1:10, rep(NA_real_, 10))),
                       "%c=%" = list(fun = `%c=%`, job = "Concatinate", expected = list(c(10, 1), c(1:10, 1), c(1:10, 1, NA_real_))),
                       "++" = list(fun = `++`, job = "Increment by 1", expected = list(6, 2:4, NA_real_)),
                       "--" = list(fun = `--`, job = "Decrement by 1", expected = list(4, 0:2, NA_real_))
                       )
}
operators <- c("%+=%", "%-=%", "%*=%", "%/=%", "%c=%", "++", "--")

for (op in operators) {
  attrib <- helper(op)
  if (!op %in% c("++",  "--")) {
    test_that(desc = "Testing compund assignment operators", {
      x <- 10
      y <- 1
      z <- 1:10
      f <- NA
      expect_equal(attrib$fun(x, y), attrib$expected[[1]])
      expect_equal(attrib$fun(z, y), attrib$expected[[2]])
      expect_equal(attrib$fun(z, f), attrib$expected[[3]])
      if(op != "%c=%") {
        expect_error(attrib$fun(x, "a"), "Assertion on 'r' failed: Must be of type 'numeric', not 'character'.")
      }
      if(op == "%/=%") {
        expect_error(attrib$fun(x, 0), "Divisor should not equal 0.")
      }
    })
  } else {
    test_that(desc = "Testing Increment Decrement by one unit operators", {
      x <- 5
      y <- 1:3
      z <- NA
      expect_equal(attrib$fun(x), attrib$expected[[1]])
      expect_equal(attrib$fun(y), attrib$expected[[2]])
      expect_equal(attrib$fun(z), attrib$expected[[3]])
      expect_error(attrib$fun("a"), "Assertion on 'l' failed: Must be of type 'numeric', not 'character'.")
    })
  }
    
}
