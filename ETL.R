library(tidyverse)

url_base<- "https://portaldatransparencia.gov.br/download-de-dados/licitacoes/" #202301 (final do arquivo)

meses<- c("01","02","03","04","05","06","07","08","09","10","11","12")

licitacao<-
purrr::map_dfr(meses, function(mes){

  print(mes)

  ano<- ifelse(mes=="12",2022,2023)

  tmp = tempfile(fileext = ".zip")

  #download.file(URL_add,mode = "wb", destfile = tmp, extra = "-R", method = "libcurl")

  download.file(url = paste0(url_base,ano,mes), destfile = tmp, mode = "wb")

  file_name <-  paste0(ano,mes,"_Licitação.csv")

  unzip(tmp, files=file_name, exdir= "data" )



  read_delim( paste0("data/",file_name),
                          delim = ";", escape_double = FALSE, col_types = cols(`Data Resultado Compra` = col_date(format = "%d/%m/%Y"),
                                                                               `Data Abertura` = col_date(format = "%d/%m/%Y")),
                          locale = locale(date_names = "pt", date_format = "d%m%Y",
                                          decimal_mark = ",", grouping_mark = ".",
                                          encoding = "Latin1"), trim_ws = TRUE) %>%

      janitor::clean_names() %>%
      select(
        nome_ug,
        modalidade_compra,
        objeto,
        situacao_licitacao,
        nome_orgao_superior,
        nome_orgao,
        uf,
        municipio,
        data_resultado_compra,
        data_abertura,
        valor_licitacao
      )

})










X202301_Licitação <- read_delim("202301_Licitacoes/202301_Licitação.csv",
                                delim = ";", escape_double = FALSE, col_types = cols(`Data Resultado Compra` = col_date(format = "%d/%m/%Y"),
                                                                                     `Data Abertura` = col_date(format = "%d/%m/%Y")),
                                locale = locale(date_names = "pt", date_format = "d%m%Y",
                                                decimal_mark = ",", grouping_mark = ".",
                                                encoding = "Latin1"), trim_ws = TRUE)



