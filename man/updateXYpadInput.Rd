% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/XYpad.R
\name{updateXYpadInput}
\alias{updateXYpadInput}
\title{Change a XY pad input on the client}
\usage{
updateXYpadInput(
  session,
  inputId,
  label = NULL,
  value = NULL,
  xmin = NULL,
  xmax = NULL,
  ymin = NULL,
  ymax = NULL,
  ndecimals = NULL,
  bgColor = NULL,
  pointColor = NULL,
  pointRadius = NULL
)
}
\arguments{
\item{session}{session object passed to the Shiny server function}

\item{inputId}{id of the XY pad input}

\item{label}{new label, or \code{NULL} for no change}

\item{value}{new value, or \code{NULL} for no change}

\item{xmin}{new \code{xmin}, or \code{NULL} for no change}

\item{xmax}{new \code{xmax}, or \code{NULL} for no change}

\item{ymin}{new \code{ymin}, or \code{NULL} for no change}

\item{ymax}{new \code{ymax}, or \code{NULL} for no change}

\item{ndecimals}{new \code{ndecimals}, or \code{NULL} for no change}

\item{bgColor}{new \code{bgColor}, or \code{NULL} for no change}

\item{pointColor}{new \code{pointColor}, or \code{NULL} for no change}

\item{pointRadius}{new \code{pointRadius}, or \code{NULL} for no change}
}
\value{
No value is returned, called for side-effect.
}
\description{
Changes a XY pad input on the client.
}
\examples{
library(shiny)
library(shinyXYpad)
ui <- fluidPage(
  fluidRow(
    column(6, XYpadInput("xy", onMove = TRUE, label = "XY pad")),
    column(6, verbatimTextOutput("xyvalue"))
  ),
  br(),
  actionButton("update", "Update")
)
server <- function(input, output, session){
  output[["xyvalue"]] <- renderPrint({ input[["xy"]] })
  observeEvent(input[["update"]], {
    updateXYpadInput(session, "xy", value = list(x = 25, y = 25),
                     bgColor = "chartreuse", pointColor = "yellow",
                     pointRadius = 10, ndecimals = 3)
  })
}

if(interactive()){
  shinyApp(ui, server)
}
}
