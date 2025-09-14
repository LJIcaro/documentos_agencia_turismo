

**Como um** Atendente:

**Eu quero** cadastrar e administrar os fornecedores e seus respectivos serviços, seguindo as diretrizes do meu gerente,  

**Para que** a base de componentes da agência esteja sempre atualizada e pronta para a montagem de pacotes.  

## Critérios de Aceitação

- Devo poder acessar um formulário para cadastrar um novo fornecedor com seus dados principais: Razão Social, CNPJ e Status ("**Ativo**"/"**Inativo**").  

- Para um fornecedor existente, devo poder adicionar múltiplos serviços, cada um com: Nome, Descrição, Destino, Preço de Custo (informado pelo fornecedor) e Preço de Venda (calculado ou definido pela agência).  

- O sistema deve me impedir de usar serviços de fornecedores inativos na criação de novos pacotes.  

## Regras de Negócio

- O Preço de Venda de um serviço nunca pode ser inferior ao seu Preço de Custo.  

- A aprovação de novos fornecedores ou grandes alterações de preços podem exigir a validação de um Gerente (regra de processo).  
