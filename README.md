# Teste Bionexo

1. Importar os dados de UBSs disponíveis em formato CSV no site: http://dados.gov.br/dataset/unidades-basicas-de-saude-ubs
2. Desenvolver uma aplicação Web API, bem simples, com apenas uma rota de consulta para essas informações

#Rota
GET: api/v1/find_ubs

#Parametros Exemplo
query: -23.604936,-46.692999 Lat/Log para pesquisa
page: 2 Página atual
per_page: 10 Itens por página (default: 10)

#Exemplo de retorno
GET: /find_ubs?query=-23.604936,-46.692999&page=1&per_page=1
{
current_page: 1,
per_page: 1,
total_entries: 37690,
entries: [{
id: 39860,
name: "UBS REAL PQ PAULO MANGABEIRA ALBERNAZ FILHO",
address: "RUA BARAO MELGACO",
city: "São Paulo",
phone: "1137582329",
geocode: {
lat: -23.6099946498864,
long: -46.7057347297655
},
scores: {
size: 3,
adaptation_for_seniors: 3,
medical_equipment: 1,
medicine: 3
}
}]
}

#Requisitos
Temos preferência por Ruby/Rails, porém, utilize a linguagem e frameworks de sua preferência
Utilize as boas práticas de desenvolvimento de software que achar necessário
Organize seu projeto com gerenciador de pacote, testes e documentação
Deve ser possível utilizar o retorno da API em aplicações Web e Mobile

#Bônus
Execução do projeto com Docker
Ter aplicação deployada e rodando em algum server (ex.: heroku)
