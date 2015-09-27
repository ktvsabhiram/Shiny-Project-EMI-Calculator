library(shiny)
library(xtable)
library(dplyr)

shinyServer(
  function(input, output){
    
    output$Principal <- renderText({
      input$goButton
      isolate(input$Principal)
    })
    
    output$Interest <- renderText({
      input$goButton
      isolate(input$Interest)
    })
    
    output$Tenure <- renderText({
      if(input$goButton != 0) {
        input$goButton
        isolate(input$Tenure)
      }
    })
    
    output$EMI <- renderText({
      input$goButton
      isolate(EMI(input$Principal,input$Interest,input$Tenure))
    })
   
    output$EMIBreakUp <- renderTable({
        input$goButton
        EMICalc = as.numeric(EMI(input$Principal,input$Interest,input$Tenure))
        isolate(EMIBreakUp(input$Principal,input$Interest,input$Tenure,EMICalc))
    },
    include.rownames=FALSE
    )
    
  }
  )

EMI <- function(Principal,Interest,Tenure) {
  temp1 = (1+Interest/12/100)**Tenure
  EMI = Principal*Interest/12/100*temp1/(temp1-1)
}

EMIBreakUp <- function(Principal,Interest,Tenure,EMI){
  Principal.Balance = Principal
  
  Month = 0
  Interest.Paid = 0
  Principal.Paid = 0
  Outstanding = 0
  
  Month = as.integer(Month)
  Interest.Paid = as.numeric(Interest.Paid)
  Principal.Paid = as.numeric(Principal.Paid)
  Outstanding = as.numeric(Outstanding)

  for(i in 1:Tenure){
    #Split.Principal[i,] = EMI_Principal_BreakUp(EMI,Principal,Interest,i)
    Month[i]=i
    Interest.Paid[i] = Principal.Balance*Interest/12/100
    Principal.Paid[i] = EMI - Interest.Paid[i]
    Principal.Balance = Principal.Balance-Principal.Paid[i] 
    Outstanding[i]=Principal.Balance+0.0000001 #tiny value added to avoid roundoff
  }
  
  EMIBreakUp = data.frame(Month,Principal.Paid,Interest.Paid,Outstanding)
  colnames(EMIBreakUp) = c("Month","Principal","Interest","Outstanding")
  EMIBreakUp = xtable(EMIBreakUp)
}