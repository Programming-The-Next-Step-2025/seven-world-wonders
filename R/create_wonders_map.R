#' Create a Leaflet map of the New 7 Wonders of the World
#'
#' This function uses the \code{leaflet} package and OpenStreetMap tiles to
#' generate an interactive map with markers for each of the New 7 Wonders of the
#' World. Clicking on a marker displays an informational popup about the corresponding
#' wonder. Markers are color-coded by structure type for easy visual distinction.
#'
#' @param wonders_df A data frame containing wonder information with columns:
#' \code{name} (character), \code{lat} (numeric), \code{lng} (numeric),
#' \code{info} (character), \code{continent} (character), \code{type} (character),
#' and \code{year} (numeric).
#' @return A \code{leaflet} map object with color-coded markers and
#' informational popups.
#' @examples
#' \dontrun{
#' wonders <- world_wonders_data()
#' create_wonders_map(wonders)
#' }
#' @import leaflet
#' @export
create_wonders_map <- function(wonders_df) {
  get_color <- function(type) {
    switch(type,
           "Military" = "red",
           "Religious" = "blue",
           "Residential" = "green",
           "Entertainment" = "orange",
           "black") # default color
  }

  wonders_df$color <- sapply(wonders_df$type, get_color)

  wonders_df$enhanced_popup <- paste0(
    "<strong>", wonders_df$name, "</strong><br/>",
    "<em>", wonders_df$continent, " (", wonders_df$year, ")</em><br/>",
    "<strong>Type:</strong> ", wonders_df$type, "<br/><br/>",
    wonders_df$info
  )

  leaflet(wonders_df) %>%
    addTiles() %>%
    addCircleMarkers(
      lng = ~lng,
      lat = ~lat,
      label = ~name,
      popup = ~enhanced_popup,
      color = "white",
      fillColor = ~color,
      radius = 10,
      fillOpacity = 0.8,
      stroke = TRUE,
      weight = 2,
      opacity = 1
    ) %>%
    addLegend(
      position = "bottomright",
      colors = c("red", "blue", "green", "orange"),
      labels = c("Military", "Religious", "Residential", "Entertainment"),
      title = "Structure Type",
      opacity = 1
    )
}
