shinyUI(fluidPage(
        titlePanel("Central Limit Theorem Simulation"),
        sidebarLayout(
                sidebarPanel(
                       
                        numericInput("Lambda", "Poisson Lambda value", 
                                     value = 10, min = 1, max = 1000, step = 1),
                       
                        numericInput("Size", "Binomial Size value",
                                  value = 10, min = 1, max = 1000, step = 1 ),
                        
                        sliderInput("sliderX", "The number of observations",
                                    50, 1000, 10),
                        checkboxInput("ShowPoisson", "Poisson", value = TRUE),
                        checkboxInput("ShowBi", "Binomial", value = TRUE)
                        ),
                mainPanel(
                        h3("Distributions"),
                        plotOutput("plot1")
                )
        )
))
