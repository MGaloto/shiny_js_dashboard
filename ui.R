dashboardPage(
    skin = "blue",
    dashboardHeader(title = "Shiny App",
                    titleWidth = 200),
    dashboardSidebar(tags$head(tags$style(HTML('.skin-blue .main-header .navbar
                                              {background-image: url("https://i.gifer.com/IrF.gif");
                                               background-size: cover;}
                                               
                                               .skin-blue .main-header .logo {
                                                background-image: url("https://i.gifer.com/IrF.gif");}
                                               
                                               .skin-blue .main-header .navbar .sidebar-toggle {
                                                background-image: url("https://i.gifer.com/IrF.gif");}
                                                
                                               .a .sidebar {
                                                background-image: url("https://i.gifer.com/IrF.gif");}
                                                
                                               .skin-blue .main-sidebar {
                                                background-color: #031923;}'))), 
                     collapsed = TRUE,
                     width = 200,
                     sidebarMenu(
                         menuItem("Panel Principal",
                                  tabName = "variation",
                                  startExpanded = F,
                                  icon = icon("align-justify")),
# Rubros ---------------------------------------------------------
                         
                         menuItem("Rubros",
                                  tabName = "acercade",
                                  startExpanded = F,
                                  icon = icon("signal")
                                  
# Variaciones ---------------------------------------------------------
                                  
                         ),
                         menuItem("Variaciones",
                                  tabName = "vars",
                                  startExpanded = F,
                                  icon = icon("signal")
                                  
# Datos ---------------------------------------------------------
                                  
                         ),
                         menuItem("Datos",
                                  tabName = "datosbase",
                                  startExpanded = F,
                                  icon = icon("database")
                         ),
                                  
# Resumen ---------------------------------------------------------
                                  
                         
                         menuItem("Resumen",
                                  tabName = "tabla",
                                  startExpanded = F,
                                  icon = icon("table")))),
    dashboardBody(
        tabItems(
          tabItem(tabName = "variation",
            fluidRow(
            valueBoxOutput("vbox"),
            valueBoxOutput("vbox2"),
            valueBoxOutput("vbox3"),
            fluidPage(
                column(width = 3,selectInput(inputId = 'yvalue',
                                 label = tags$strong('Variable Y'),
                                 choices = gsub("_", " ", sort(names(df[,-c(14,15,16,17)]))), selected = "Educacion")),
                       column(width = 3,radioButtons(
                    inputId = 'orden',
                    label = tags$strong('Orden'),
                    choices = c(1,2,3,4,5), selected = 1,
                    inline = TRUE,
                    width = '600px'))),
            box(highchartOutput("chart1")),
            box(highchartOutput("chart2")))
            ),
          
          tabItem(
            tabName = 'acercade',
            fluidPage(
                h1('Proporcion de Inversion por Rubro Anual'),
                fluidRow(
                    box(
                        title = strong("Variacion Porcentual en Inversion por Rubro"), 
                        solidHeader = TRUE,
                        width = 100,
                        p("Podemos visualizar que el Rubro que mas crecio en terminos relativos desde 1947 es el", strong("Digital")),
                        p("Los Rubros que siguen a Digital son: ", strong("Health, Social y Educacion"), 'con un significativo incremento en la inversion en terminos relativos.'))),
                
                box(title = "Variaciones de Inversion desde 1947",
                    status = "primary",
                    solidHeader = T, 
                    height = "550" ,
                    width = '600'))
            )
          )
    )
)