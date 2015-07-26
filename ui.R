library(shiny)
shinyUI(pageWithSidebar(
     headerPanel("SCARA robot position calculator"),
     sidebarPanel(
          h4("Note:"),          
          helpText("This app is designed to help people understand the working range of a SCARA robot.
                   A SCARA robot is a 2 dimensional robot that performs tasks such as assembly, 
                   picking, ordering, transporting, and others.
                   With this simple app, we will show the parameters that affect the scope of a simple SCARA
                   robot.
                   The first two inputs are the size of the links of this robot.
                   The sliders allow us manipulate the rotational position of each link. 
                   The first link initial position is 0º respect to the standard convention.
                   The second link initial position is 0º respect to the first link axis.
                   The outputs are a graphic representation of the position of the SCARA robot, and 
                   the cordinates of the final position of the robot according to the input parameters."),
          numericInput('l1','Length of Link 1',1,min=0,max=20,step=0.5),
          numericInput('l2','Length of Link 2',1,min=0,max=20,step=0.5),
          sliderInput("slider1", label = h3("Angle Range of Link 1"), min = -180, 
                      max = 180, value = 0,step=1),
          sliderInput("slider2", label = h3("Angle Range of Link 2"), min = -180, 
                      max = 180, value = 0,step=1),
          submitButton('Submit')
     ),
     mainPanel(
          h3('Graphic Representation'),
          plotOutput('newPlot'),
          h3('X axis Position'),
          verbatimTextOutput("oid1"),
          h3('Y axis Position'),
          verbatimTextOutput("oid2")
     )
))