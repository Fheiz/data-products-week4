library(shiny)

# Define the overall UI
shinyUI(

  # Use a fluid Bootstrap layout
  fluidPage(

    # Give the page a title
    titlePanel("Alcohol consumption in countries from 2000 to 2015"),

    # Generate a row with a sidebar
    sidebarLayout(

      # Define the sidebar with one input
      sidebarPanel(
        uiOutput('beverage_type'),
        uiOutput('country_select'),
        hr(),
        helpText("Data from alcohol consumption by country per year from 2000.", br(), "Select the type of alcohol and the year to get the plot.")
      ),

      # Create a spot for the plot
      mainPanel(
        plotOutput("plot1")
      )
    )
  )
)
