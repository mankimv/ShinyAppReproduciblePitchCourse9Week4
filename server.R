library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)
shinyServer(function(input, output) {
        output$plot1 <- renderPlot({
                t<-data.frame(key=character(), value=numeric(), distribution=factor())
                if (input$ShowPoisson==TRUE) {
                        pois<-as.data.frame(rpois(input$sliderX, input$Lambda))
                        pois<-mutate(pois, rnorm(input$sliderX, input$Lambda, sqrt(input$Lambda)))
                        colnames(pois)<-c("poisson", "normal")
                        pois<-gather(pois, key, value, poisson:normal)
                        pois<-mutate(pois, "Poisson")
                        colnames(pois)<-c("key", "value", "distribution")
                        t<-rbind(t, pois)
                }
                if (input$ShowBi==TRUE) {
                        bi<-as.data.frame(rbinom(n=input$sliderX, input$Size, prob=.5))
                        bi<-mutate(bi, rnorm(input$sliderX, .5*input$Size, .5*sqrt(input$Size)))
                        colnames(bi)<-c("binomial", "normal")
                        bi<-gather(bi, key, value, binomial:normal)
                        bi<-mutate(bi, "Binomial")
                        colnames(bi)<-c("key", "value", "distribution")
                        t<-rbind(t, bi)
                        
                }
                g<-ggplot(t)+
                        geom_density(aes(x=value, fill=key, color=key), alpha=.3, adjust=2)+
                        facet_grid(.~ distribution)+theme(legend.position = "bottom")
                g
                })
})
