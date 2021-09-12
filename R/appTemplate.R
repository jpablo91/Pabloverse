# library(shiny); library(shinythemes)
# library(dplyr)
# library(ggplot2)

######### LOAD DATA ########
d <- data.frame(x = rnorm(100, 10, 1),
           y = rpois(100, 5))

######### SET UP FUNCTIONS, DATASETS, etc...########


####### Define UI #########
ui <- navbarPage("New Application Title",
                 theme = shinytheme('sandstone'), # check other themes here https://rstudio.github.io/shinythemes/
                 ##### Main panel of the app ######
                 tabPanel('First panel',
                          sidebarLayout(
                              ####### This is the side panel for options/other UI ######
                              sidebarPanel(
                                  width = 3,
                                  tags$h3("Here you can add the app options"),
                                  hr(),
                                  actionButton(inputId = 'Run', label = 'Run the app')
                              ),
                              #### Here we can put the results/other UI #####
                              mainPanel(type = 'tabs',
                                        # grafico de barras,
                                        # descripcion,
                                        # average calculado,
                                        tags$h4('Plot based on loaded data'),
                                        tabPanel('Plot', plotOutput('p1')),
                                        hr(),
                                        tags$h4('Plot based on reactive options'))
                          )
                 )
                 
                 ###### You can add more panels after here #####
)

######## Define server here ########
server <- function(input, output){
    # plot the data frame
    P1 <- eventReactive(input$Run,{
        P1 <- d 
    })
    
    output$p1 <- renderPlot({
        P1() %>% 
            ggplot() +
            geom_point(aes(x = x, y = y))
    })
    
    
}

#### Run the app ####
shinyApp(ui = ui, server = server)
