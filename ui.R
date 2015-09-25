shinyUI(pageWithSidebar(
  headerPanel("EMI Calculator"),
  sidebarPanel(
    #checkboxGroupInput("id1","Parameter",c("Ozone"="1", "Solar Radiation" = "2", "Wind" = "3", Temperature"="3")),
    #radioButtons("type","Type:",list("Ozone"="Ozone", "Solar Radiation"="Solar.R", "Wind" = "Wind", "Temperature"= "Temp")),    
    numericInput("Principal", "Loan Amount (in $)", value="1000000",min="0",max="1000000000",step="10000"),
    numericInput("Interest", "Yearly Interest Rate (in %)", value="5",min="3",max="20",step="0.25"),
    sliderInput("Tenure", "Tenure (in months)",min=1, max=360,value=12,step=1),
    actionButton("goButton", "Update")
    #p("Click the button to update the value displayed in the main panel.")
  ),
  mainPanel(
    tabsetPanel(
            tabPanel(
                    "EMI Summary",
                     h3("Selected Inputs:"),
                     h6("Loan Amount:"),
                     textOutput("Principal"),
                     h6("Yearly Interest Rate:"),
                     textOutput("Interest"),
                     h6("Tenure"),
                     textOutput("Tenure"),
                     h3("Output:"),
                     h6("Monthly EMI for selected Inputs is:"),
                     textOutput("EMI")
                    ),
            tabPanel(
              "EMI Schedule Break Up",
              tableOutput("EMIBreakUp")
            ),
            tabPanel(
              "Bar Chart",
              plotOutput("EMIPlot")
            )
    )
  )
  
))