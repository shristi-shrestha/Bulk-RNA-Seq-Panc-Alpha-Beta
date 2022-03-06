

library(ggplot2)
library(reshape2)
library(tidyverse)

#expression data
exp <- read.csv("DATA/Normalized_Expression_Values.csv",header = TRUE, row.names = 1)
subset <- exp[,c(3:12)]

ui <- fluidPage(
  titlePanel(h1(id="big-heading", "Bulk RNA gene expression human pancreatic islets/FACS-sorted Alpha and Beta cells" )),
  tags$style(HTML("#big-heading{color: #4292C6;
                  font-style: Avenir Light;}")),

  p(em("Contact shristi.shrestha.2@vanderbilt.org for questions")),
  
  hr(),
  #p(em("Explore gene expression level in human and mouse islets ")),
  textInput(inputId = "Gene",
            label = "Enter Official Gene Symbol"),
  hr(),
  
  
          fluidPage(
            verticalLayout(plotOutput("plot1")
                           )

  ))

server <- function(input, output) {
  output$plot1 <- renderPlot({
  req(input$Gene)
  
  sub <- subset[toupper(input$Gene),]
  
  
  # tidy it using reshape2 package
  ss <- melt(sub, variable.name = "sample")
  ss$celltype <- c(rep("Alpha",5),rep("Beta",5))
  
  ggplot(ss, aes(x = sample, y = value, fill=celltype)) + 
    geom_bar(stat="identity",colour = "black", width = 0.8) + 
    scale_fill_manual(values=c("#66A459", "#BA5550"))+
    theme(axis.title = element_text(size = 14, face = "bold",colour = "black"), 
          axis.text = element_text(size = 12, colour = "gray20", vjust = 0.25), 
          axis.text.x = element_text(size = 10, colour = "black")) +
    labs(x = "Samples", y = "TMM normalized expression") + theme(plot.subtitle = element_text(size = 1), 
                                                axis.line = element_line(linetype = "solid"), 
                                                axis.ticks = element_line(size = 0.8), 
                                                panel.grid.minor = element_line(linetype = "blank"), 
                                                axis.text = element_text(size = 15), 
                                                axis.text.x = element_text(size = 15, angle = 90), 
                                                plot.title = element_text(size = 16, 
                                                                          face = "bold"), legend.text = element_text(size = 13), 
                                                legend.title = element_text(size = 14, 
                                                                            face = "bold")
                                                ) +
    labs(title = "Bulk RNA-seq-Human FACS-sorted Alpha/Beta", subtitle = "Brissva et al 2018, Saunders et al., 2019 ")+ 
    theme(plot.subtitle = element_text(size = 12))
  
  
  } , height = 500, width = 700)

}
shinyApp(ui=ui,server=server)
