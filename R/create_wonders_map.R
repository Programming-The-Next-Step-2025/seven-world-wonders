#' Create a Leaflet map of the New 7 Wonders of the World
#'
#' This function uses the \code{leaflet} package and OpenStreetMap tiles to
#' generate an interactive map with markers for each of the New 7 Wonders of the
#' World.
#' Clicking on a marker displays an informational popup about the corresponding
#' wonder.
#'
#' @param wonders_df A data frame containing columns: \code{name}, \code{lat},
#' \code{lng}, and \code{info}.
#' @return A \code{leaflet} map object.
#' @examples
#' \dontrun{
#' wonders <- world_wonders_data()
#' create_wonders_map(wonders)
#' }
#' @import leaflet
#' @export
create_wonders_map <- function(wonders_df) {
  leaflet(wonders_df) %>%
    addTiles() %>%
    addMarkers(
      lng = ~lng,
      lat = ~lat,
      label = ~name,
      popup = ~info
    )
}
