licitacao %>%
  filter(situacao_licitacao == "Encerrado") %>%
  summarise(sum(valor_licitacao))


#link para o painel de compras
#http://paineldecompras.economia.gov.br/processos-compra

unique(licitacao$situacao_licitacao)
