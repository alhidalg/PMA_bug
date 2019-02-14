
shinyServer(function(input, output,session) {
  jscode <- "shinyjs.refresh = function() { history.go(0); }"
  
  
  # Year In Scope selection
  updateSelectInput(session, "d_Year",
                    choices = c(" All",as.character(Launch_table_PMA$year)),
                    selected = " All")
  #Geo TreeMap
  
  ## Not working 
  observe({
    if (input$d_Year == " All") {
      m_df_clean <- m_df[m_df$Phase %in% all_accounts,]
    }
    else {
      m_df_clean <- m_df[(m_df$Phase %in% all_accounts)&(m_df$Launch %in% Launch_table_PMA$Launch_Name[Launch_table_PMA$year == input$d_Year]),]
    }
    
  })
  
  observeEvent(input$d_Year,{
    if (input$d_Year == " All") {
      m_df_clean <- m_df[m_df$Phase %in% all_accounts,]
    }
    else {
      m_df_clean <- m_df[(m_df$Phase %in% all_accounts)&(m_df$Launch %in% Launch_table_PMA$Launch_Name[Launch_table_PMA$year == input$d_Year]),]
    }
  })
  ## / Not working 
  
  output$master_geo_tree <- renderD3tree2({d3tree2(master_tree_data, rootname = "Volume of Accounts by Geo, Country and Category")})
})
