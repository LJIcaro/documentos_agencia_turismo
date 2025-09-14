**Como um** Gerente: 

**Eu quero** configurar as permissões de acesso para cada perfil de usuário (Gerente, Atendente, Cliente),  

**Para que** eu possa garantir a segurança dos dados e que cada pessoa tenha acesso apenas às funcionalidades relevantes à sua função.  

## Critérios de Aceitação

- O sistema deve possuir 3 perfis fixos: "Gerente", "Atendente" e "Cliente".  

- Na tela de configuração, o Gerente deve poder visualizar cada perfil e uma lista de permissões associadas (ex: **"Criar Pacotes"**, **"Visualizar Dashboard"**, **"Emitir Nota Fiscal"**).  

- As permissões do perfil **"Gerente"** são fixas e não podem ser reduzidas.  

- Qualquer alteração de permissão em um perfil deve ser aplicada instantaneamente a todos os usuários pertencentes àquele perfil.  

## Regras de Negócio

- A criação de novos perfis está fora do escopo.  

- Apenas usuários com perfil "Gerente" podem acessar esta funcionalidade.  
