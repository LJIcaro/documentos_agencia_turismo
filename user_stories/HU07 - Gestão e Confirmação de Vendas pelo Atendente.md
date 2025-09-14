

**Como um** Atendente:

**Eu quero** ter um painel para visualizar e gerenciar as novas vendas realizadas,  
**Para que** eu possa realizar as reservas necessárias junto aos fornecedores e formalizar a viagem do cliente.  

## Critérios de Aceitação

- Um painel de "**Vendas**" deve listar todas as transações, com status como "**Aguardando Confirmação**", "**Confirmada**", "**Cancelada**".  

- Ao selecionar uma venda, devo visualizar todos os seus dados: quem comprou, qual pacote, valores e status do pagamento.  

- Após efetivar as reservas externamente, devo ter a ação de mudar o status da venda para "**Confirmada**".  

- Ao confirmar a venda, o sistema deve gerar um contrato em PDF com os detalhes da viagem para ser enviado ao cliente.  

## Regras de Negócio

- Uma venda só pode ser "**Confirmada**" após a verificação do recebimento do pagamento.  
