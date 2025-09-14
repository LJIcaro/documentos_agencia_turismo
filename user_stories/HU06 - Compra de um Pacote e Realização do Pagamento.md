# HU06 - Compra de um Pacote e Realização do Pagamento

**Como um** Cliente:

**Eu quero** passar por um processo de checkout simples para comprar um pacote, inserir os dados dos viajantes e efetuar o pagamento,  
**Para que** eu possa garantir minha reserva de forma rápida e segura.  

## Critérios de Aceitação

- Na página de detalhes do pacote, um botão "**Comprar Agora**" deve iniciar o fluxo de checkout.  

- O fluxo deve solicitar os dados do comprador e dos demais passageiros.  

- O sistema deve apresentar as opções de pagamento (ex: PIX, Cartão de Crédito com parcelamento).  

- Após a conclusão bem-sucedida do pagamento, uma tela de confirmação deve ser exibida e a venda deve ser registrada no sistema com o status "**Aguardando Confirmação**".  

## Regras de Negócio

- As regras de parcelamento (ex: máximo 6x sem juros) são definidas pelo Gerente e aplicadas no checkout.  
