#' @title Add assignment
#' 
#' @description
#' Simple add assignment operator
#' 
#' @param l variable to modify. class: numeric
#' @param r by what value to modify. class: numeric
#' @examples
#' x <- 1:10
#' y <- 5
#' x %+=% 10
#' x %+=% y
#' y %+=% 10
#' @export
`%+=%` = function(l, r) {
  assertNumeric(l)
  assertNumeric(r)
  eval.parent(substitute(l <- l + r))
}

#' @title Subtract assignment
#' 
#' @description
#' Simple subtract assignment operator
#' 
#' @param l variable to modify. class: numeric
#' @param r by what value to modify. class: numeric
#' @examples
#' x <- 1:10
#' y <- 5
#' x %-=% 10
#' x %-=% y
#' y %-=% 10
#' @export
`%-=%` = function(l, r) {
  assertNumeric(l)
  assertNumeric(r)
  eval.parent(substitute(l <- l - r))
}

#' @title Multiply assignment
#' 
#' @description
#' Simple Multiply assignment operator
#' 
#' @param l variable to modify. class: numeric
#' @param r by what value to modify. class: numeric
#' @examples
#' x <- 1:10
#' y <- 5
#' x %*=% 10
#' x %*=% y
#' y %*=% 10
#' @export
`%*=%` = function(l, r) {
  assertNumeric(l)
  assertNumeric(r)
  eval.parent(substitute(l <- l * r))
}

#' @title Divide assignment
#' 
#' @description
#' Simple Divide assignment operator
#' 
#' @param l variable to modify. class: numeric
#' @param r by what value to modify. class: numeric
#' @examples
#' x <- 1:10
#' y <- 5
#' x %/=% 10
#' x %/=% y
#' y %/=% 10
#' @export
`%/=%` = function(l, r) {
  assertNumeric(l)
  assertNumeric(r)
  if (!is.na(r) && any(r == 0)) {stop("Divisor should not equal 0.")}
  eval.parent(substitute(l <- l / r))
}

#' @title Concatinate assignment
#' 
#' @description
#' Simple Concatinate assignment operator
#' 
#' @param l variable to modify. atomic vector
#' @param r what to add. atomic vector
#' @examples
#' x <- 1:5
#' y <- c("a", "b", "c")
#' x %c=% 6:10
#' y %c=% c("d", "e")
#' @export
`%c=%` = function(l, r) {
  assert_atomic(l)
  assert_atomic(r)
  len <- eval.parent(substitute(length(l)))
  lento <- length(r)
  eval.parent(substitute(l[seq(from = len + 1, length.out = lento)] <- r))
  invisible(get(substitute(l), envir = parent.frame()))
}

#' @title Increment by one
#' 
#' @description
#' equivalent of l %+=% 1
#' 
#' @param l variable to modify. class: numeric
#' @examples
#' x <- 1:10
#' y <- 20
#' `++`(x)
#' `++`(y)
#' @export
`++` = function(l) {
  eval.parent(substitute(l %+=% 1))
}

#' @title Decrement by one
#' @name minus-minus
#' @description
#' equivalent of l %-=% 1
#' 
#' @param l variable to modify. class: numeric
#' @examples
#' x <- 1:10
#' y <- 20
#' `--`(x)
#' `--`(y)
#' @export
`--` = function(l) {
  eval.parent(substitute(l %-=% 1))
}
