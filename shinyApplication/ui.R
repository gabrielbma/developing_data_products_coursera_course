library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Iris dataset analysis application"),
    sidebarPanel(
        radioButtons("method", "Model selection:", 
                     list("KNN"="KNN", 
                          "Random Forest"="RF",
                          "SVM Radial" = "SVM-Radial",
                          "GBM" = "GBM")),
        actionButton("do","Build model")
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Dataset",
                     dataTableOutput("dataTable")),
            tabPanel("Summary",
                     h2("All observations:"),
                     verbatimTextOutput("summary"),
                     h2("Dataset structure:"),
                     verbatimTextOutput("structure"),
                     h2("Training observations:"),
                     verbatimTextOutput("summaryTraining"),
                     h2("Correlations"),
                     verbatimTextOutput('corr')),
            tabPanel("Plots", 
                     p('Please be patient, it takes about 10 seconds to have the plots built after clicking on that tab.'),
                     plotOutput("pairPlot")),
            tabPanel("Model", 
                     p("Please, choose a model and click on the 'Build model' button to have the model built on the left side."),
                     h2("Model fit"),
                     verbatimTextOutput("fit"),
                     h2("Model plot"),
                     plotOutput("plot"),
                     h2("Model test"),
                     verbatimTextOutput("confusionMatrix")),
            tabPanel("Documentation",
                     h2("Instructions"),
                     p("The main goal of this application is to allow users to easily inspect the Iris dataset by providing 
                       built-in features such as dataset summary, plots and some machine learning models."),
                     p("You can click on the \"Dataset\", \"Summary\", and \"Plots\" tabs to take explore the Iris dataset."),
                     p("You can also create some machine learning models by choosing one from left side list, clicking on the \"Build model\" button and selection 
                       the model tab."),
                     h2("Source code"),
                     p("The source code is available at: https://github.com/gabrielbma/developing_data_products_coursera_course/tree/master/shinyApplication"))
        )
    )
))
