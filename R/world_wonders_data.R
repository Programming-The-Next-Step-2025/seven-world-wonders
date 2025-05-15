#' Get data for the New 7 Wonders of the World
#'
#' This function returns a data frame containing the names, coordinates
#' (latitude and longitude), and descriptions of the New 7 Wonders of the World.
#' The data can be used to generate map markers and informational popups in a
#' Shiny app or Leaflet map.
#'
#' @return A data frame with columns: \code{name}, \code{lat}, \code{lng},
#' and \code{info}.
#' @examples
#' wonders <- world_wonders_data()
#' head(wonders)
#' @export
world_wonders_data <- function() {
  data.frame(
    name = c("Great Wall of China", "Christ the Redeemer", "Machu Picchu",
             "Chichen Itza", "Roman Colosseum", "Taj Mahal", "Petra"),
    lat = c(40.4319, -22.9519, -13.1631, 20.6843, 41.8902, 27.1751, 30.3285),
    lng = c(116.5704, -43.2105, -72.5450, -88.5678, 12.4922, 78.0421, 35.4444),
    info = c(
      "A massive wall stretching across China, built over centuries.",
      "A large statue of Jesus Christ in Rio de Janeiro, Brazil.",
      "A 15th-century Inca citadel in Peru.",
      "A large pre-Columbian archaeological site in Mexico.",
      "An ancient amphitheater in Rome, Italy.",
      "A white marble mausoleum in India, built by Mughal emperor Shah Jahan.",
      "A historical city carved into rock in Jordan."
    ),
    stringsAsFactors = FALSE
  )
}
