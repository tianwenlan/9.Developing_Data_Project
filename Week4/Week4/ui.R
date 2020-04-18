#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Eruption Duration from waiting"),
    mainPanel(
        h3("Description:"),
        "This project uses R default dataset: faithful",
        "It builds a model to predict the eruption duration by waiting time",
        
        h3("Usage:"),
        "Select the input for waiting time by sliding the bar",
        "The app will predict the eruption duration and output the result",
        "You can show/hide prediction line by checking/unchecking the show box"
        
    ),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderwaiting", "What is the duration of the eruption?", 40, 100, value = 70),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE),
        ),
        mainPanel(
            plotOutput("plot"),
            h4("Predicted Eruption duration:"),
            textOutput("pred"),
        )
    )

))