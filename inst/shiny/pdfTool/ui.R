# User interface

# header ------------------
h <- dashboardHeader()

# sidebar
sb <- dashboardSidebar(
  sidebarMenu(
    menuItem(text = 'Main', tabName = 'mainTab')
  )
  
)

# Body -------------
b <- dashboardBody(
  tabItems(
    tabItem(tabName = 'mainTab',
            box(
              width = 12, 
              fileInput('file_1', label = 'File 1', accept = '.pdf'),
              fileInput('file_2', label = 'File 2', accept = '.pdf'),
              downloadButton('downloadFile', 'Download File'),
            )
            )
  )
)


# UI --------
dashboardPage(header = h, 
              sidebar = sb, 
              body = b
)  %>% 
  shinyUI

