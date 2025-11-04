library(shiny)
library(bushfire)
library(dplyr)

ui <- fluidPage(
  titlePanel("Bushfire Risk in Southeastern Australia"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("years", "Select years:",
                  min = min(bushfire$year), max = max(bushfire$year),
                  value = c(2000, 2020), step = 1, sep = ""),
      selectInput("metric", "Choose metric:",
                  choices = c("mean", "max"),
                  selected = "mean")
    ),
    mainPanel(
      plotOutput("trend"),
      tableOutput("summary")
    )
  )
)

server <- function(input, output) {
  filtered <- reactive({
    bushfire %>%
      dplyr::filter(year >= input$years[1], year <= input$years[2])
  })

  output$trend <- renderPlot({
    plot_fwi_trend(filtered(), metric = input$metric)
  })

  output$summary <- renderTable({
    filtered()
  })
}

shinyApp(ui, server)
