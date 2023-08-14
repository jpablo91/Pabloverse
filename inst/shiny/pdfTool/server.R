# Server
function(input, output){
  # Download File -------------
  output$downloadFile <- downloadHandler(
    filename = function() {'merged.pdf'},
    content = function(file) {
      # tmpdir <- tempdir()
      # setwd(tempdir())
      # print(tempdir())
      # fs <- c('merged.pdf')
      pdftools::pdf_combine(input = c(input$file_1$datapath, input$file_2$datapath), output = file)
      # print(fs)
      
      # zip(zipfile=file, files=fs)
      # if(file.exists(paste0(file, ".zip"))) {file.rename(paste0(file, ".zip"), file)}
      
    },
    # contentType = "application/zip"
  )
  
} %>% shinyServer()