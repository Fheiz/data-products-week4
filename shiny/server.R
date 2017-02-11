library(shiny)
library(ggplot2)

# Define where to read the data and how to read them
data = read.csv("data/better_beer_consumption.csv", sep=",", header=T)
unique_country = unique(data$Country)


# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  dataInput <- reactive({
    subset(data, subset=(data$Country == c(input$country))&(data$Beverage.Types == c(input$alcohol_type)))
  })
  
  output$beverage_type = renderUI({
    selectInput("alcohol_type", "Type of alcohol:", choices=c(levels(unique(data$Beverage.Types))), multiple=TRUE)
  })
  
  output$country_select = renderUI({
    selectInput("country", "Choose a country:", choices=c(levels(unique(data$Country))))
  })
  
  # Fill in the spot we created for a plot
  output$plot1 <- renderPlot({

    # Render the plot
    ggplot(
      dataInput(),
      aes(
        x=Year,
        y=Values,
        group=Beverage.Types,
        colour=as.factor(Beverage.Types)
      )
    ) + geom_line() + labs(
      x='Year',
      y='Values',
      title=paste('Alcohol consumption for', input$country),
      colour='Beverage Type'
    )
  })
})