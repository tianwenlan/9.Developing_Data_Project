#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {

    model <- lm(eruptions ~ waiting, data = faithful)

    modelpred <- reactive({
        waitingInput <- input$sliderwaiting
        predict(model, newdata = data.frame(waiting = waitingInput))
    })
    
    output$plot <- renderPlot({
        waitingInput <- input$sliderwaiting
        
        plot(faithful$waiting, faithful$eruptions, xlab = "Waiting Time", 
             ylab = "Duration", bty = "n", pch = 16,
             xlim = c(40, 100), ylim = c(1, 6))
        if(input$showModel){
            abline(model, col = "red", lwd = 2)
        }

        legend(25, 250, c("Model Prediction"), pch = 16, 
               col = c("red", "blue"), bty = "n", cex = 1.2)
        points(waitingInput, modelpred(), col = "red", pch = 16, cex = 2)
    })
    
    output$pred <- renderText({
        modelpred()
    })
    
})