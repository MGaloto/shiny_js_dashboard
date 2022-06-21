shinyServer(function(input, output, session) {
    
    output$vbox <- renderValueBox({
        
        hc <- hchart(df, "area", hcaes(periodos, Salud), name = "lines of code")  %>% 
            hc_size(height = 100) %>% 
            hc_credits(enabled = FALSE) %>% 
            hc_add_theme(hc_theme_sparkline_vb()) 
        
        valueBoxSpark(
            value = "1,345",
            title = toupper("Lines of code written"),
            sparkobj = hc,
            subtitle = tagList(HTML("&uarr;"), "25% Since last day"),
            info = "This is the lines of code I've written in the past 20 days! That's a lot, right?",
            icon = icon("code"),
            width = 4,
            color = "teal",
            href = NULL
        )
        
        
    })
    
    output$vbox2 <- renderValueBox({
        
        hc2 <- hchart(df, "line", hcaes(periodos, Salud), name = "Distance")  %>% 
            hc_size(height = 100) %>% 
            hc_credits(enabled = FALSE) %>% 
            hc_add_theme(hc_theme_sparkline_vb()) 
        
        valueBoxSpark(
            value = "1,345 KM",
            title = toupper("Distance Traveled"),
            sparkobj = hc2,
            subtitle = tagList(HTML("&uarr;"), "25% Since last month"),
            info = "This is the lines of code I've written in the past 20 days! That's a lot, right?",
            icon = icon("plane"),
            width = 4,
            color = "purple",
            href = NULL
        )
        
    })
    
    output$vbox3 <- renderValueBox({
        
        hc3 <- hchart(df, "column", hcaes(periodos, Salud), name = "Daily amount")  %>% 
            hc_size(height = 100) %>% 
            hc_credits(enabled = FALSE) %>% 
            hc_add_theme(hc_theme_sparkline_vb())
        
        valueBoxSpark(
            value = "1,3 Hrs.",
            title = toupper("Thinking time"),
            sparkobj = hc3,
            subtitle = tagList(HTML("&uarr;"), "5% Since last year"),
            info = "This is the lines of code I've written in the past 20 days! That's a lot, right?",
            icon = icon("hourglass-half"),
            width = 4,
            color = "fuchsia",
            href = NULL
        )
        
        
    })
    
    
    output$chart1 <- renderHighchart({
        
        highcharts_demo() %>% 
            hc_add_theme(hc_theme_hcrt())
        
    })
    
    output$chart2 <- renderHighchart({
        
        yvar <- input$yvalue
        
        hc <-   df %>%
            hchart("scatter", hcaes(x = df$periodos, y = !!sym(yvar), names = df$periodos), maxSize = "20%") %>% 
            hc_colors(c("#9e030b", "#2980b9")) %>% 
            hc_add_dependency("plugins/highcharts-regression.js") %>% 
            hc_credits(enabled = TRUE, text = "Fuente: Indec",align = "right",verticalAlign = "bottom",
                       style = list(color = "black", fontSize = '15px'),
                       href = "https://www.indec.gob.ar/") %>% 
            hc_title(text = paste0('Scatter Plot - Linear Regression Order: ',input$orden),
                     style = list(fontSize = '20px', fontWeight = 'bold')) %>% 
            hc_subtitle(text = paste0('<b><br>X: ', input$xvalue, ' Y: ', input$yvalue,'</br></b>'),
                        style = list(fontSize = '16px', color = "black"))
        
        
    })
    
})