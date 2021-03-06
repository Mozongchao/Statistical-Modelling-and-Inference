library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage(
  title = "Statistical Modeling & Inference!",

  ### REGRESSION MLE
  tabPanel("Regression MLE",
    withMathJax(),
    fluidRow(
      column(1),
      column(5,
        includeMarkdown("regressionmle/topics.md")
      ),
      column(5,
        includeMarkdown("regressionmle/references.md")
      ),
      column(1)
    ),
    fluidRow(
      column(1),
      column(5,
        h2("Regression Model"),
        br(),
        withMathJax("$$y(x) = \\mathbb{E}[t|x]$$"),
        br(),br()
      ),
      column(5,
        h2("Feature Extraction"),
        br(),
        checkboxInput('feature_extraction_examples_visible', 'Show Examples', FALSE), uiOutput('feature_extraction_examples'),
        br(),br()
      ),
      column(1)
    ),
    fluidRow(
      column(1),
      column(5,
        h2("Matrix Differentiation"),
        br(),
        a(href="http://www.econ.ku.dk/metrics/econometrics2_05_ii/lecturenotes/matrixdiff.pdf", "Reference"),
        br(),br()
      ),
      column(5,
        h2("Linear Regression"),
        br(),
        checkboxInput('linear_regression_visible', 'Show Equations', FALSE),
        uiOutput('linear_regression'),
        br(),br()
      ),
      column(1)
    ),
    fluidRow(
      column(1),
      column(5,
        h2("Gaussian Maximum Likelihood"),
        br(),
        checkboxInput('gauss_mle_visible', 'Show Equations', FALSE),
        uiOutput('gauss_mle'),
        br(),br()
      ),
      column(5,
        h2("Inference"),
        br()
      ),
      column(1)
    ),
    fluidRow(
      column(1),
      column(5,
        h2("Predictive Model"),
        br(),
        withMathJax("$$t_{n+1} | x_{n+1} = N(y(x_{n+1}) w_{mle}, q_{mle}^{-1})$$"),
        br(),br()
      ),
      column(5,
        h2("Hat Matrix"),
        br(),
        withMathJax("
          $$H = (\\phi^{T}\\phi)^{-1}\\phi^{T}$$
          $$\\hat{t} = Ht$$"),
        br(),br()
      ),
      column(1)
    ),
    fluidRow(
      column(1),
      column(5,
        h2("Residuals"),
        br(),
        withMathJax("
          $$ e = t - \\hat{t}$$
          When model is correctly specified or over-specified:
          $$ e|X \\backsim N(0, q^{-1}(I - H)) $$
          Standardized residuals:
          $$ e'_{n} = \\sqrt{\\frac{q}{1-H{i,i}}} e_{n} $$"),
        br(),br()
      ),
      column(5,
        h2("Measure of Model Fit"),
        br(),
        withMathJax("
          $$\\frac{1-\\sigma(t|x)}{\\sigma(t)}$$
          $$R^{2} = 1 - \\frac{\\sum_{i=1}^{N}(t_{i} - \\hat{t}_{i})^{2}} {\\sum_{i=1}^{N}(t_{i} - \\bar{t})^{2}}$$"),
        br(),br()
      ),
      column(1)
    )
  ),


  ### SVD REGRESSION
  tabPanel("SVD Regression",
    withMathJax(),
    fluidRow(
      column(1),
      column(5,
        includeMarkdown("svd/topics.md")
      ),
      column(5,
        includeMarkdown("svd/references.md")
      ),
      column(1)
    ),
    fluidRow(
      column(1),
      column(5,
        h2("Geometry of design matrix"),
        tags$ul(
          tags$li("$\\textbf{\\phi^{T}}\\phi$ is positive semi-definite and has the same null space as $\\textbf{\\phi}$"), 
          tags$li("Every positive definite matrix is invertible and its inverse is also positive definite"), 
          tags$li("Cases it may not be invertible (positive semi-definite): mulit-collinearity and $M+1 > N$"),
          tags$li("$r = rank(\\textbf{\\phi}) = rank(\\textbf{\\phi}^{T}\\textbf{\\phi}) \\leq min(M+1, N)$")
      ),
      column(5,
        h2("PCA & SVD in figure")
      ),
      column(1)
    ),
    fluidRow(
      column(1),
      column(5,
        h2("Decomposition of $\\phi w$ & contrast"),
      ),
      column(5,
        h2("Standard Case & Unidentifiable case")
        tags$ul(
          tags$li("Standard: $r = M+1$"), 
          tags$li("Unidentifiable: $r < M+1$ (there will be infinitely many $w*$ consistent with this")
      ),
      column(1)
    ),
    fluidRow(
      column(1),
      column(5,
        h2("SVD regression (eigenvalue thresholding)"),
        tags$ul(
          tags$li("Moore-Penrose pseudo-inverse ($r \\leq M+1$): $(\\textbf{\\phi}^{T} \\textbf{\\phi})^{-1} \\approx U_{r} \\Lambda_{r}^{-1} U_{r}^{T}$"),
          tags$li("$w_mle = U_{r} \\Lambda_{r}^{\\frac{1}{2}} V_{r}^{T} t$"),
          tags$li("Sidebar: Unitary matrix is matrix whose (conjugate) transpose is also its inverse")
        ),
      ),
      column(5,
        h2("Principle Components Regression")
      ),
      column(1)
    )
  ),



  navbarMenu("More",
    tabPanel("Table",
      dataTableOutput("table")
    ),
    tabPanel("About",
      fluidRow(
        column(6,
          includeMarkdown("about.md")
        ),
        column(3,
          img(class="img-polaroid",
            src=paste0("http://upload.wikimedia.org/",
            "wikipedia/commons/9/92/",
            "1919_Ford_Model_T_Highboy_Coupe.jpg")),
          tags$small(
            "Source: Photographed at the Bay State Antique ",
            "Automobile Club's July 10, 2005 show at the ",
            "Endicott Estate in Dedham, MA by ",
            a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
              "User:Sfoskett")
          )
        )
      )
    )
  )
))
