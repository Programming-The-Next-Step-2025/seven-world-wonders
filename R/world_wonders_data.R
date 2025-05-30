#' Get data for the New 7 Wonders of the World
#'
#' This function returns a data frame with information about the New 7 Wonders
#' of the World. The dataset includes each wonder's name, geographic coordinates,
#' description, site type, and approximate year of origin.
#' This data can be used to generate map markers and informational popups
#' in a Shiny app.
#'
#' @return A data frame with columns: \code{name}, \code{lat}, \code{lng},
#' \code{info}, \code{continent}, \code{type}, and \code{year}.
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
        "A vast defensive structure built over centuries to protect against
        invasions, stretching across diverse landscapes — near Beijing, China.",
        "An iconic 30-meter-tall Art Deco statue of Jesus Christ overlooking the
        city from Mount Corcovado — Rio de Janeiro, Brazil.",
        "A 15th-century Incan citadel renowned for its dry-stone construction
        and dramatic mountain setting — near Cusco, Peru.",
        "An ancient Maya city famous for its pyramid, astronomical precision,
        and cultural significance — Yucatán, Mexico.",
        "A massive Roman amphitheater used for gladiator contests and public
        spectacles — Rome, Italy.",
        "A white marble mausoleum built by Emperor Shah Jahan as a symbol of
        love for his wife Mumtaz Mahal — Agra, India.",
        "A historical city carved into rose-colored rock cliffs by the
        Nabataeans, known for its temples and tombs — near Ma'an, Jordan."
      ),

    continent = c("Asia", "South America", "South America", "North America",
                  "Europe", "Asia", "Asia"),
    type = c("Military", "Religious", "Residential", "Religious", "Entertainment",
             "Religious", "Religious"),
    year = c(-700, 1931, 1450, 600, 80, 1643, -300),
    stringsAsFactors = FALSE
  )
}
