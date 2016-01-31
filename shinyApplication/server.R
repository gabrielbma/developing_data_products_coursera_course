library(shiny)
library(caret)
library(Hmisc)
library(GGally)
library(gridExtra)
library(kernlab)
library(gbm)
library(minqa)
library(e1071)
library(randomForest)

shinyServer(function(input, output, cliendData, session) {
    data <- function() { 
        inTraining <- createDataPartition(iris$Species, p=0.7, list = FALSE)
        training <- iris[inTraining,]
        testing <- iris[-inTraining,]
        list("training" = training, "testing"=testing, "all" = iris)
    }
    ## data <- eventReactive(input$do, {
    ##     inTraining <- createDataPartition(iris$Species, p=0.7, list = FALSE)
    ##     training <- iris[inTraining,]
    ##     testing <- iris[-inTraining,]
    ##     list("training" = training, "testing"=testing, "all" = iris)
    ## })

    method <- eventReactive(input$do, {
        switch(input$method,
               "KNN"="knn",
               "RF"="rf",
               "SVM-Radial"="svmRadial",
               "SVM-Poly"="lssvmPoly",
               "GBM"="gbm")
    })

    fit <- eventReactive(input$do, {
        train(Species~., data=data()$training, method=method(), 
              preProcess = c("center", "scale"))
    })

    pred <- eventReactive(input$do, {
        predict(fit(), data()$testing)
    })

    plotModel <- eventReactive(input$do, {
        plot(fit())
    })
    
    output$dataTable <- renderDataTable({iris})
    output$summary <- renderPrint({summary(data()$all)})
    output$summaryTraining <- renderPrint({summary(data()$training)})
    output$corr <- renderPrint({cor(as.matrix(iris[, -c(5)]))})
    output$structure <- renderPrint({str(data())})
    output$pairPlot <- renderPlot({ 
        ggpairs(data=data()$all, 
                upper = list(continuous = "smooth", combo = "box"),
                colour="Species")
    }, height = 1200, width = 1000)
    output$fit <- renderPrint({fit()})
    output$plot <- renderPlot({plotModel()})
    output$confusionMatrix <- renderPrint({
        confusionMatrix(pred(), data()$testing$Species)
    })

})
