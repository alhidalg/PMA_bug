
#################### Data Load ################ 

m_df <<- NULL
Launch_PMA <<-NULL


######### Load local data sets
master_doc <- "master_view.csv"       # Document Name with extension
master_data <- paste0("./data/",master_doc)   # Path for Data Source
m_df <- read_csv(master_data)           # Creation of Data Frame
m_df <<-  as.data.frame(m_df) #cambiarlo a DataFrame
master_table <- data.table(m_df)    ## cambiar a data table pa'cerlo más rápido

Launch_doc <- "launch.csv"       # Document Name with extension
Launch_PMA_d <- paste0("./data/",Launch_doc)   # Path for Data Source
Launch_PMA <- read_csv(Launch_PMA_d)           # Creation of Data Frame
Launch_PMA <<-  as.data.frame(Launch_PMA) #cambiarlo a DataFrame
Launch_table_PMA <- data.table(Launch_PMA)    ## cambiar a data table pa'cerlo más rápido


######### Listas por Estado

all_accounts <- c("Kick Off","Kick-Off","Data Collection","Data Upload","Data Summary","Data Verification","Data Validation",
                  "Model Run","Pre-Assessment","Quality Check","Results Internal Review","Results Presentation","Results Senior Review",
                  "Ticket Labeling","Ticket Classification","Completed")

#Geo TreeMap
m_df_clean <- m_df[m_df$Phase %in% all_accounts,]

m_df_map <- m_df_clean %>%     
  dplyr::group_by(
    IOT = m_df_clean$IOT,
    Country = m_df_clean$Country,
    Category = m_df_clean$Category
  )%>%
  tally()

master_tree_data <- treemap(m_df_map, index = c("IOT","Country","Category"), vSize = "n", 
                            title = "Volume of Accounts by Geo, Country and Category",
                            fontsize.title = 12)
