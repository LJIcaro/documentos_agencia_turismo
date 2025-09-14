# HU05 - Navegação, Cadastro e Visualização de Pacotes pelo Cliente

**Como um** Visitante ou Cliente:  

**Eu quero** navegar pelo catálogo de pacotes de viagem, criar uma conta e visualizar os detalhes de cada produto,  
**Para que** eu possa explorar as opções, encontrar a viagem perfeita e me preparar para a compra.  

## Critérios de Aceitação

- Como visitante, devo ver a vitrine de pacotes e poder usar filtros (**destino**, **preço**).  

- Devo poder me cadastrar no sistema através de um formulário de "**Criar Conta**", que me criará um registro na tabela `USUARIOS` com o perfil "**Cliente**".  

- Uma vez logado, ao clicar em um pacote, devo ver uma página dedicada com todos os detalhes: roteiro, hotéis, voos, o que está incluso, fotos e o preço final.  

## Regras de Negócio

- O cliente não pode personalizar os serviços dentro de um pacote; ele compra o pacote "fechado".  
