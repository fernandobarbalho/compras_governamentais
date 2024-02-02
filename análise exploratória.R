library(tidyverse)


#link para o painel de compras
#http://paineldecompras.economia.gov.br/processos-compra

unique(licitacao$situacao_licitacao)

14764140022.95+ 1358098935.24 + 1052260751.6 + 200082359.8 + 2460445821.43 + 26230835929.69 + 8184061827.22 + 36.79 + 3703117086.85	+ 2671895626.56

14455012914.65+ 1307234671.12 + 1037630110.13 + 198630242.75	+ 2442839498 + 25895706997.64 + 8079174126.67 + 36.79 + 3555013561.03 + 2595447684.62

60.624.938.398

59.566.689.843


library(rsiconfi)


###2016
dca_despesa_orcamentaria_2016<-
  get_dca(year = c(2016), annex = "I-D",  entity = "1")

names(dca_despesa_orcamentaria_2016)

glimpse(dca_despesa_orcamentaria_2016)

dca_despesa_orcamentaria_2016 %>%
  filter(cod_conta %in% c("DO3.3.90.30.00.00",
                          "DO3.3.90.32.00.00",
                          "DO3.3.90.33.00.00",
                          "DO3.3.90.35.00.00",
                          "DO3.3.90.36.00.00",
                          "DO3.3.90.39.00.00",
                          "DO3.3.90.38.00.00",
                          "DO3.3.90.37.00.00",
                          "DO4.4.90.51.00.00",
                          "DO4.4.90.52.00.00")) %>%
  select(conta, valor, coluna) %>%
  summarise(valor_total = sum(valor),
            .by = coluna)

59566689843 + 1058248555




3.3.90.39.00 -
123456789011245



#2017

dca_despesa_orcamentaria_2017<-
  get_dca(year = c(2017), annex = "I-D",  entity = "1")



dca_despesa_orcamentaria_2017 %>%
  filter(cod_conta %in% c("DO3.3.90.30.00.00",
                          "DO3.3.90.32.00.00",
                          "DO3.3.90.33.00.00",
                          "DO3.3.90.35.00.00",
                          "DO3.3.90.36.00.00",
                          "DO3.3.90.39.00.00",
                          "DO3.3.90.38.00.00",
                          "DO3.3.90.37.00.00",
                          "DO4.4.90.51.00.00",
                          "DO4.4.90.52.00.00")) %>%
  summarise(valor_total = sum(valor),
            .by = coluna)

perc_pib_fab<- (60965849995 / (6.583 * 10^12))*100


perc_pib_texto_calc<- ((48+39)*10^9/ (6.583 * 10^12))*100

perc_pib_texto_calc/perc_pib_fab


#2022
dca_despesa_orcamentaria_2022<-
  get_dca(year = c(2022), annex = "I-D",  entity = "1")


dca_despesa_orcamentaria_2022 %>%
  filter(cod_conta %in% c("DO3.3.90.30.00.00",
                          "DO3.3.90.32.00.00",
                          "DO3.3.90.33.00.00",
                          "DO3.3.90.35.00.00",
                          "DO3.3.90.36.00.00",
                          "DO3.3.90.39.00.00",
                          "DO3.3.90.38.00.00",
                          "DO3.3.90.37.00.00",
                          "DO4.4.90.51.00.00",
                          "DO4.4.90.52.00.00")) %>%
  summarise(valor_total = sum(valor),
            .by = coluna)

dca_despesa_orcamentaria_2022 %>%
  filter(cod_conta %in% c("DO3.3.90.30.00.00",
                          "DO3.3.90.32.00.00",
                          "DO3.3.90.33.00.00",
                          "DO3.3.90.35.00.00",
                          "DO3.3.90.36.00.00",
                          "DO3.3.90.39.00.00",
                          "DO3.3.90.38.00.00",
                          "DO3.3.90.37.00.00",
                          "DO4.4.90.51.00.00",
                          "DO4.4.90.52.00.00")) %>%
  mutate(conta = str_sub(conta,16,200)) %>%
  select(conta, valor, coluna) %>%
  filter(coluna == "Despesas Liquidadas")

66555876690 + 1402538720

0.66+0.55

licitacao <- readRDS("~/Github/compras_governamentais/licitacao.rds")

licitacao %>%
  filter(situacao_licitacao == "Encerrado") %>%
  summarise(sum(valor_licitacao))

amostra_combustivel<-
objetos_licitacao_atualizado %>%
  filter(combustivel_relacionado == TRUE) %>%
  slice_sample(n=100)


objetos_licitacao_aquisicao_combustivel %>%
  filter(aquisicao_combustivel == TRUE) %>%
  summarise(mean(valor_licitacao),
            median(valor_licitacao),
            sum(valor_licitacao))


licitacao %>%
  filter(situacao_licitacao == "Encerrado") %>%
  slice_sample(n=1000) %>%
  summarise(mean(valor_licitacao),
            median(valor_licitacao),
            sum(valor_licitacao))


licitacao_v2 %>%
  filter(situacao_licitacao == "Encerrado") %>%
