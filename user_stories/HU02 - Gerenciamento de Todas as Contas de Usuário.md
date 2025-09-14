
**Como um** Gerente: 

**Eu quero** cadastrar, consultar, atualizar e inativar as contas de todos os usuários do sistema (**Gerentes**, **Atendentes** e **Clientes**) em um único local,  

**Para que** eu possa ter um controle centralizado sobre quem acessa a plataforma.  

## Critérios de Aceitação

- Um formulário de criação de usuário deve conter os campos:
  
- Nome Completo, E-mail, Senha Provisória e **Perfil** ("**Gerente**", "**Atendente**" ou "**Cliente**").
  
- Se o perfil selecionado for "Cliente", os campos **CPF/CNPJ** e **Telefone** devem se tornar obrigatórios. Para outros perfis, estes campos não devem ser solicitados. 

- O sistema deve validar que o E-mail e o CPF/CNPJ (quando preenchido) são únicos na base de dados.  

- Na tela de listagem, deve ser possível pesquisar usuários por nome ou e-mail e filtrar por perfil e status ("Ativo"/"Inativo").  

- Ao inativar um usuário, ele é impedido de fazer login, mas todos os seus registros históricos (**vendas associadas**, **pacotes criados**) permanecem intactos (**exclusão lógica**).  

## Regras de Negócio

- A senha deve ser armazenada de forma criptografada (hash). 

- Clientes também podem se cadastrar sozinhos através de uma tela de registro pública (HU05).  
