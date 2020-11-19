#' Add a 2D Shaded Sphere to a Plot
#'
#' __Add a Description__
#'
#' @param x0  coordinate on the x-axis of center of the sphere
#' @param y0  coordinate on the y-axis of center of the sphere
#' @param r0  radius of the sphere
#' @param x1  coordinate on the x-axis of center of the shade
#' @param y1  coordinate on the y-axis of center of the shade
#' @param r1  radius of the smallest shade
#' @param h   factor of shading
#' @param n   number of vertices of the circle
#' @param col vector of two colors used to generate a continuous gradient
#'
#' @author Nicolas Casajus, \email{nicolas.casajus@@gmail.com}
#'
#' @export
#' @importFrom grDevices colorRampPalette
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @importFrom sf st_polygon st_sfc st_sf st_intersection st_area st_geometry
#'
#' @examples
#' \dontrun{
#' plot(0, 0, asp = 1, xlim = c(-1, 1), ylim = c(-1, 1))
#' add_sphere()
#' }

add_sphere <- function(x0 = 0, y0 = 0, r0 = 1, x1 = -0.5, y1 = 0.5, r1 = 0.1,
  h = 0.01, n = 1000, col = c("black", "white")) {

  mask <- polar_coords(x0, y0, r0, n) %>%
    list() %>%
    sf::st_polygon() %>%
    sf::st_sfc() %>%
    sf::st_sf()

  rays <- seq(r0 * 2, r1, -1 * h)

  shades <- lapply(rays, polar_coords, x = x1, y = y1, n = n) %>%
    lapply(.data, function(x) sf::st_polygon(list(x))) %>%
    sf::st_sfc() %>%
    sf::st_sf() %>%
    sf::st_intersection(.data, mask)

  outside <- shades %>%
    sf::st_area() %>%
    round(.data, 5) %>%
    duplicated()

  shades <- shades[!outside, ]

  color <- colorRampPalette(col)
  color <- color(nrow(shades))

  plot(sf::st_geometry(shades), border = color, col = color, add = TRUE)
}
