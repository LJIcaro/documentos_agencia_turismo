# 📑 Modelo Entidade-Relacionamento (DER) — Sistema de Agência de Turismo

Este documento descreve a estrutura de dados completa, refletindo o script SQL fornecido.

---

## 🔎 Visão Geral das Áreas do Modelo

1. **Pessoas e Acesso** → Quem são os usuários e seus níveis de permissão.  
2. **Catálogo de Produtos** → Os serviços (ingredientes) e pacotes (produtos finais).  
3. **Processo Comercial e Financeiro** → Ciclo de vida de uma venda, do pedido à nota fiscal.  
4. **Atendimento ao Cliente** → Estrutura para chamados e mensagens entre cliente e atendente.  

---

## 👥 Área 1: Pessoas e Acesso

### **1. PERFIS**
- **Descrição:** Define os papéis de acesso ao sistema.  
- **Atributos:**
  - `id_perfil` *(PK, Inteiro)*  
  - `nome` *(VARCHAR, Único, Não Nulo)* → Ex: *Gerente, Atendente, Cliente*  

---

### **2. USUARIOS**
- **Descrição:** Tabela central de autenticação de indivíduos.  
- **Atributos:**
  - `id_usuario` *(PK, Inteiro)*  
  - `fk_id_perfil` *(FK → PERFIS.id_perfil, Não Nulo)*  
  - `nome_completo` *(VARCHAR, Não Nulo)*  
  - `email` *(VARCHAR, Único, Não Nulo)*  
  - `senha_hash` *(VARCHAR, Não Nulo)*  
  - `ativo` *(BOOLEAN, Não Nulo)*  
  - `data_criacao` *(TIMESTAMP, Não Nulo)*  
  - `cpf_cnpj` *(VARCHAR, Único, Opcional)*  
  - `telefone` *(VARCHAR, Opcional)*  
  - `endereco` *(TEXT, Opcional)*  

---

## 🛎️ Área 2: Catálogo de Produtos

### **3. FORNECEDORES**
- **Descrição:** Empresas parceiras fornecedoras de serviços.  
- **Atributos:**
  - `id_fornecedor` *(PK, Inteiro)*  
  - `razao_social` *(VARCHAR, Não Nulo)*  
  - `cnpj_cpf` *(VARCHAR, Único, Não Nulo)*  
  - `ativo` *(BOOLEAN, Não Nulo)*  

---

### **4. SERVICO**
- **Descrição:** Catálogo de itens individuais comercializados.  
- **Atributos:**
  - `id_servico` *(PK, Inteiro)*  
  - `fk_id_fornecedor` *(FK → FORNECEDORES.id_fornecedor, Não Nulo)*  
  - `nome` *(VARCHAR, Não Nulo)*  
  - `descricao` *(TEXT, Opcional)*  
  - `destino` *(VARCHAR, Opcional)*  
  - `preco_custo` *(DECIMAL, Não Nulo)*  
  - `preco_venda` *(DECIMAL, Não Nulo)*  

---

### **5. PACOTE**
- **Descrição:** Produto final, composto por serviços.  
- **Atributos:**
  - `id_pacote` *(PK, Inteiro)*  
  - `fk_id_usuario_criador` *(FK → USUARIOS.id_usuario, Não Nulo)*  
  - `nome` *(VARCHAR, Não Nulo)*  
  - `descricao` *(TEXT, Opcional)*  
  - `preco_venda_final` *(DECIMAL, Não Nulo)*  
  - `status` *(VARCHAR, Não Nulo, CHECK: 'Em Edição', 'Disponível', 'Arquivado')*  

---

### **6. PACOTE_SERVICO** *(Associativa)*
- **Descrição:** Relação N:N entre pacotes e serviços.  
- **Atributos:**
  - `id_pacote_servico` *(PK, Inteiro)*  
  - `fk_id_pacote` *(FK → PACOTE.id_pacote, Não Nulo)*  
  - `fk_id_servico` *(FK → SERVICO.id_servico, Não Nulo)*  

---

## 💰 Área 3: Processo Comercial e Financeiro

### **7. VENDAS**
- **Descrição:** Registro das transações de compra.  
- **Atributos:**
  - `id_venda` *(PK, Inteiro)*  
  - `fk_id_cliente` *(FK → USUARIOS.id_usuario, Não Nulo)*  
  - `fk_id_atendente` *(FK → USUARIOS.id_usuario, Não Nulo)*  
  - `fk_id_pacote` *(FK → PACOTE.id_pacote, Não Nulo)*  
  - `data_venda` *(TIMESTAMP, Não Nulo)*  
  - `valor_final_venda` *(DECIMAL, Não Nulo)*  
  - `status_venda` *(VARCHAR, CHECK: 'Aguardando Pagamento', 'Confirmada', 'Cancelada')*  

---

### **8. PAGAMENTO**
- **Descrição:** Registra pagamento (parciais ou integrais).  
- **Atributos:**
  - `id_pagamento` *(PK, Inteiro)*  
  - `fk_id_venda` *(FK → VENDAS.id_venda, Não Nulo)*  
  - `valor_pago` *(DECIMAL, Não Nulo)*  
  - `data_pagamento` *(TIMESTAMP, Não Nulo)*  
  - `metodo_pagamento` *(VARCHAR, Opcional)*  

---

### **9. NOTAS_FISCAIS**
- **Descrição:** Nota Fiscal de Serviço emitida por venda.  
- **Atributos:**
  - `id_nota_fiscal` *(PK, Inteiro)*  
  - `fk_id_venda` *(FK → VENDAS.id_venda, Único, Não Nulo)*  
  - `numero_nf` *(VARCHAR, Não Nulo)*  
  - `chave_acesso` *(VARCHAR, Único, Não Nulo)*  
  - `data_emissao` *(TIMESTAMP, Não Nulo)*  
  - `caminho_arquivo_pdf` *(VARCHAR, Opcional)*  

---

## 📞 Área 4: Atendimento ao Cliente

### **10. CHAMADO**
- **Descrição:** Registro de solicitações dos clientes.  
- **Atributos:**
  - `id_chamdo` *(PK, Inteiro)*  
  - `fk_id_cliente` *(FK → USUARIOS.id_usuario, Não Nulo)*  
  - `fk_id_atendente` *(FK → USUARIOS.id_usuario, Opcional)*  
  - `titulo` *(VARCHAR, Não Nulo)*  
  - `status` *(VARCHAR, CHECK: 'Aberto', 'Em Atendimento', 'Fechado')*  
  - `data_abertura` *(TIMESTAMP, Não Nulo)*  
  - `data_fechamento` *(TIMESTAMP, Opcional)*  

---

### **11. MENSAGENS**
- **Descrição:** Mensagens trocadas dentro de um chamado.  
- **Atributos:**
  - `id_mensagem` *(PK, Inteiro)*  
  - `fk_id_chamado` *(FK → CHAMADO.id_chamdo, Não Nulo)*  
  - `fk_id_remetente` *(FK → USUARIOS.id_usuario, Não Nulo)*  
  - `conteudo` *(TEXT, Não Nulo)*  
  - `data_envio` *(TIMESTAMP, Não Nulo)*  

---

## 🔗 Resumo dos Relacionamentos

- Um **PERFIL** → tem um **USUARIOS**.  
- Um **USUARIO** (Gerente/Atendente) → cria muitos **PACOTE**.  
- Um **FORNECEDOR** → fornece muitos **SERVICO**.  
- Um **PACOTE** → composto por muitos **SERVICO** (*via PACOTE_SERVICO*).  
- Um **USUARIO** (Cliente) → pode ter muitas **VENDAS** e **CHAMADO**.  
- Um **USUARIO** (Atendente) → pode atender muitas **VENDAS** e **CHAMADO**.  
- Uma **VENDA** → gera uma única **NOTA_FISCAL** e e tem um **PAGAMENTO**.  
- Um **CHAMADO** → contém várias **MENSAGENS**.  

---

#### [Clique aqui para acessar o DER do sistema](https://drawsql.app/teams/fesf-1/diagrams/agencia-turismo)
