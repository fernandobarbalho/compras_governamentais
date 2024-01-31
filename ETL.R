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


licitacao_v2<-
  purrr::map_dfr(meses, function(mes){

    print(mes)

    ano<- ifelse(mes=="12",2022,2023)

    tmp = tempfile(fileext = ".zip")

    #download.file(URL_add,mode = "wb", destfile = tmp, extra = "-R", method = "libcurl")

    download.file(url = paste0(url_base,ano,mes), destfile = tmp, mode = "wb")

    file_name <-  paste0(ano,mes,"_LicitaÃ§Ã£o.csv")

    unzip(tmp,exdir= "data" )



    read_delim( paste0("data/",file_name),
                delim = ";", escape_double = FALSE, col_types = cols(`Data Resultado Compra` = col_date(format = "%d/%m/%Y"),
                                                                     `Data Abertura` = col_date(format = "%d/%m/%Y")),
                locale = locale(date_names = "pt", date_format = "d%m%Y",
                                decimal_mark = ",", grouping_mark = ".",
                                encoding = "Latin1"), trim_ws = TRUE) %>%

      janitor::clean_names() %>%
      select(
        numero_licitacao,
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



participantes_vencedores<-
  purrr::map_dfr(meses, function(mes){

    print(mes)

    ano<- ifelse(mes=="12",2022,2023)


    file_name <-  paste0(ano,mes,"_ParticipantesLicitaÃ§Ã£o.csv")




    read_delim(paste0("data/",file_name),
             delim = ";", escape_double = FALSE, locale = locale(decimal_mark = ",",
                                                                 grouping_mark = ".", encoding = "latin1"),
             trim_ws = TRUE) %>%


      janitor::clean_names() %>%
      filter(flag_vencedor=="SIM") %>%
      select(
        numero_licitacao,
        nome_ug,
        modalidade_compra,
        nome_orgao,
        codigo_participante,
        nome_participante,
        flag_vencedor
      )

  })



202301_ParticipantesLicitação.csv
202301_ParticipantesLicitaÃ§Ã£o

licitacao_v2%>%
  saveRDS("licitacao.rds")

dca_despesa_orcamentaria_2022<-
  get_dca(year = c(2022), annex = "I-D",  entity = "1")

dca_despesa_orcamentaria_2022 %>%
  saveRDS("dca_despesa_orcamentaria_2022.RDS")

fab<-
licitacao%>%
  filter(situacao_licitacao == "Encerrado") %>%
  select(objeto, uf, valor_licitacao )


licitacao%>%
  filter(situacao_licitacao == "Encerrado") %>%
  select(objeto, uf, valor_licitacao ) %>%
  write_csv("objetos_licitacao.csv")

objetos_licitacao<-
licitacao%>%
  filter(situacao_licitacao == "Encerrado") %>%
  select(objeto, uf, valor_licitacao )

objetos_licitacao_atualizado <- read_csv("objetos_licitacao_atualizado.csv")

objetos_licitacao$id <- seq(1:NROW(objetos_licitacao))

objetos_licitacao_atualizado$id <- objetos_licitacao$id


objetos_licitacao_aquisicao_combustivel <- read_csv("objetos_licitacao_aquisicao_combustivel.csv")

