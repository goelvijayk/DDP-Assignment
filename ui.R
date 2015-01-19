library(shiny)
library(datasets)

shinyUI(pageWithSidebar(
  headerPanel("Identify cars based on your search criteria"),
  sidebarPanel(
    h3('Select filters'),
    checkboxGroupInput("cyl", "Cylinders", selected = c("4", "6", "8"),
                       c("4" = 4,
                         "6" = 6,
                         "8" = 8
                         )
                       ),
    checkboxGroupInput("class", label = "Class of car", selected = c("2seater", "compact", "midsize", "minivan", "pickup", "subcompact", "suv"),
                       c("2seater" = "2seater",
                         "compact" = "compact",
                         "midsize" = "midsize",
                         "minivan" = "minivan",
                         "pickup"  = "pickup",
                         "subcompact" = "subcompact",
                         "suv" = "suv"
                         )
                       ),
      sliderInput('cty', 'minimum city MPG', value = 10, min = 1, max = 50, step = 1),
      sliderInput('hwy', 'minimum highway MPG', value = 10, min = 1, max = 50, step = 1),
      sliderInput('year', 'year of model release', value = 1999, min = 1999, max = 2008, step = 1),
    submitButton('Refine'),
    downloadButton('downloadData', 'Download results')
    ),
  mainPanel(
    #h6(paste("# of matching results - "), output$r),
    verbatimTextOutput("results"),
    verbatimTextOutput("ocars")
    )
  ))