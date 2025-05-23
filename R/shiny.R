#' Run the Seven Wonders Shiny App
#'
#' Launches an interactive Shiny application to explore the New 7 Wonders of
#' the World. Users can filter wonders by continent, structure type, and
#' construction year
#'
#' @examples
#' \donttest{
#' run_wonders_app()
#' }
#' @import shiny
#' @import leaflet
#' @import dplyr
#' @export
run_wonders_app <- function() {
  library(shiny)
  library(leaflet)
  library(dplyr)

  wonders <- world_wonders_data()

  ui <- fluidPage(
    titlePanel("Explore the New 7 Wonders of the World"),
    sidebarLayout(
      sidebarPanel(
        selectInput("continent", "Select Continent:",
                    choices = c("All", unique(wonders$continent))),
        checkboxGroupInput("type", "Type of Structure:",
                           choices = unique(wonders$type),
                           selected = unique(wonders$type)),
        sliderInput("year", "Construction Year:",
                    min = min(wonders$year),
                    max = max(wonders$year),
                    value = c(min(wonders$year), max(wonders$year))),
        hr(),
        h4("Filter Summary:"),
        textOutput("filter_summary")
      ),
      mainPanel(
        leafletOutput("wondersMap", height = 600),
        br(),
        conditionalPanel(
          condition = "output.no_results",
          div(
            class = "alert alert-warning",
            style = "margin-top: 10px;",
            strong("No wonders match your current filters."),
            br(),
            "Try adjusting your selection criteria."
          )
        )
      )
    )
  )

  server <- function(input, output, session) {

    filtered_data <- reactive({
      df <- wonders

      if (input$continent != "All") {
        df <- df %>% filter(continent == input$continent)
      }

      if (length(input$type) > 0) {
        df <- df %>% filter(type %in% input$type)
      } else {
        df <- df[FALSE, ]
      }

      df <- df %>% filter(year >= input$year[1] & year <= input$year[2])

      return(df)
    })

    output$wondersMap <- renderLeaflet({
      filtered <- filtered_data()
      if (nrow(filtered) > 0) {
        create_wonders_map(filtered)
      } else {
        leaflet() %>%
          addTiles() %>%
          setView(lng = 0, lat = 20, zoom = 2)
      }
    })

    output$filter_summary <- renderText({
      filtered <- filtered_data()
      paste("Showing", nrow(filtered), "of", nrow(wonders), "wonders")
    })

    output$no_results <- reactive({
      nrow(filtered_data()) == 0
    })
    outputOptions(output, "no_results", suspendWhenHidden = FALSE)
  }

  shinyApp(ui = ui, server = server)
}
