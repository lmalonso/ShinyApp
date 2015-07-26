library(shiny)
shinyServer(
     function(input,output){
          l1<-reactive({input$l1})
          l2<-reactive({input$l2})
          alpha1<-reactive({input$slider1})
          alpha2<-reactive({input$slider2})
          pres<-reactive({(as.numeric(input$pres))*5})
          y1<-reactive({round(c(0,l1()*sin(pi*alpha1()/180),l1()*sin(pi*alpha1()/180)+l2()*sin(pi/180*(alpha1()+alpha2()))),3)})
          x1<-reactive({round(c(0,l1()*cos(pi*alpha1()/180),l1()*cos(pi*alpha1()/180)+l2()*cos(pi/180*(alpha1()+alpha2()))),3)})
          
          output$oid1<-renderPrint({x1()[3]})
          output$oid2<-renderPrint({y1()[3]})
          output$newPlot<-renderPlot({plot(x1(),y1(),xlab="Range in X axis",ylab="Range in Y axis",
                                          col='black',main='Working Area',type="o",asp=1,lwd=6,
                                          xlim=c(-(l1()+l2()),l1()+l2()),ylim=c(-(l1()+l2()),l1()+l2()))
                                       })
     }
)