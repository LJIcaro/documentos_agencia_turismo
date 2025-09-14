# HU08 - Emissão de Nota Fiscal da Venda

**Como um** Atendente:

**Eu quero** emitir a Nota Fiscal de Serviço (NFS-e) para uma venda concluída,  
**Para que** a agência cumpra com suas obrigações fiscais e forneça o documento legal ao cliente.  

## Critérios de Aceitação

- A opção "**Emitir Nota Fiscal**" só deve estar disponível para vendas com status "**Confirmada**".  
  
- O sistema deve utilizar os dados do cliente (CPF/CNPJ) e da venda (valor, descrição) para preencher os campos da NF.  
  
- Após a emissão (via integração com sistema fiscal), o sistema deve armazenar a chave de acesso, o número e o link para o PDF/XML da nota.  
  
- O cliente deve ser notificado por e-mail quando sua nota fiscal for emitida.  

## Regras de Negócio

- A nota fiscal é sempre emitida com o valor final pago pelo cliente.  
