# define some credentials
credentials <- data.frame(
    user = c("user", "claudio"), # mandatory
    password = c("pass", "mind2020"), # mandatory
    #start = c("2019-04-15"), # optinal (all others)
    #expire = c(NA, "2019-12-31"),
    #admin = c(FALSE, TRUE),
    #comment = "Simple and secure authentification mechanism  for single ‘Shiny’ applications.",
    stringsAsFactors = FALSE
)

library(shiny)
library(shinymanager)
library(shinydashboard)

ui <- ui <- dashboardPage(
    dashboardHeader(title="IA Performance"),
    dashboardSidebar(),
    dashboardBody()
)

# Wrap your UI with secure_app
ui <- secure_app(ui)


server <- function(input, output, session) {
    
    # call the server part
    # check_credentials returns a function to authenticate users
    res_auth <- secure_server(
        check_credentials = check_credentials(credentials)
    )
    
    output$auth_output <- renderPrint({
        reactiveValuesToList(res_auth)
    })
    
    # your classic server logic
    
}

shinyApp(ui, server)