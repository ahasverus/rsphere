#' Get Polar Coordinates of a Circle
#'
#' __Add a Description__
#'
#' @param x coordinate on the x-axis of center of the circle
#' @param y coordinate on the y-axis of center of the circle
#' @param r radius of the circle
#' @param n number of vertices of the circle
#'
#' @author Nicolas Casajus, \email{nicolas.casajus@@gmail.com}
#'
#' @export
#'
#' @return A two-columns data frame with polar coordinates of the circle.
#'
#' @examples
#' \dontrun{
#' polar_coords(0, 0, 1, 500)
#' }


polar_coords <- function(x, y, r = 1, n = 1000) {

  angles <- seq(0, 2 * pi, length.out = n)
  coords <- cbind(cos(angles) * r + x, sin(angles) * r + y)

  rbind(coords, coords[1, ])
}
