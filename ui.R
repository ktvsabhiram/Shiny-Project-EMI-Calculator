shinyUI(pageWithSidebar(
  headerPanel(
    h1("EMI Calculator")
    #br(),
    #h5("This app calculates monthly EMI payable on the Principal borrowed"),
    #h5("Please refer documentation tab to know how to use the app")
    ),
  sidebarPanel(
    numericInput("Principal", "Loan Amount (in $)", value="1000000",min="0",max="1000000000",step="10000"),
    numericInput("Interest", "Yearly Interest Rate (in %)", value="5",min="3",max="20",step="0.25"),
    sliderInput("Tenure", "Tenure (in months)",min=1, max=360,value=12,step=1),
    actionButton("goButton", "Update")
    #p("Click the button to update the value displayed in the main panel.")
  ),
  mainPanel(
    tabsetPanel(
            tabPanel(
              "Documentation",
              h4("This app calculates monthly EMI payable on the Principal borrowed"),
              h4("There are three tabs in this app. Documentation, EMI Summary and EMI Schedule BreakUp"),
              p("The app is set to default values initally. The user needs to click on Update button after entering the desired numbers to see the calculated EMI"),
              p("See the EMI Summary tab for monthly EMI output"),
              p("See the EMI Schedule Break Up tab for the table showing monthly breakup of oustanding principal and interest"),
              
              br(),
              
              h4("The formula to calculate EMI is:"),
              img(src="EMI-Formula.PNG"),
              em(p("where A is the EMI payable, P is the principal borrowed, r is the rate of interest for the tenure, n is the tenure or duration")),
              
              h4("Refer the following wikipedia link to learn about EMI calculation:"),
              h5(div(a("https://en.wikipedia.org/wiki/Equated_Monthly_Installment",href="https://en.wikipedia.org/wiki/Equated_Monthly_Installment"),style="color:blue")),
              
              br(),
              strong(h4("Following are the inputs to be given in sidepanel:")),
              strong("1. Loan Amount:"),
              p("This is the amount borrowed in $. This should be a numeric with value greater than Zero."),
              p("Entering non-zero values or strings results in unrealistic outcome or NA."),
              
              br(),
              
              strong("2. Yearly Interest Rate:"),
              p("This is the annual rate of interest at which the loan is borrowed in %. It should be a positive numeric value."),
              p("Entering non-zero values or strings results in unrealistic outcome or NA."),
              
              br(),
              
              strong("3. Tenure:"),
              p("This is the duration for which loan is borrowed in number of months. It should be a positivie numeric value."),
              p("Entering non-zero values or strings results in unrealistic outcome or NA"),
              
              br(),
              
              strong(em(p("Note: If not specified, consider the Principal, Interest & EMI to be in $ "))),
              
              br(),
              
              h4("The calculations in this app can be verfied with the standard emi calculators available as in below link:"),
              h5(div(a("http://emicalculator.net/",href="http://emicalculator.net/"),style="color:blue")),
              
              br(),
              
              em(h4("Thank you for using this App")),
              em(h5("--Abhiram"))
              
            ),
            tabPanel(
                    "EMI Summary",
                     strong(h3("Selected Inputs:")),
                     h6("Loan Amount in $:"),
                     textOutput("Principal"),
                     h6("Yearly Interest Rate as %:"),
                     textOutput("Interest"),
                     h6("Tenure in Months"),
                     textOutput("Tenure"),
                     br(),
                     strong(h3("Output:")),
                     h4("Monthly EMI in $ is:"),
                     strong(h4(div(textOutput("EMI"),style="color:blue")))
                    ),
            tabPanel(
              "EMI Schedule Break Up",
              tableOutput("EMIBreakUp")
            )
    )
  )
  
))