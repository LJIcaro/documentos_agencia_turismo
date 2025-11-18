# Documentação - Agência de Turismo

## Visão Geral do Projeto

Este repositório contém a documentação completa para um **sistema de agência de turismo**, incluindo análise de requisitos, diagramas de arquitetura, fluxos de processos e histórias de usuário. O projeto foi desenvolvido para estruturar a implementação de uma plataforma de vendas de pacotes de viagem com funcionalidades de gestão de fornecedores, catálogo de serviços, processamento de pagamentos e suporte ao cliente.

A documentação fornece uma base sólida para o desenvolvimento, cobrindo as perspectivas **funcional** (casos de uso e requisitos), **estrutural** (arquitetura de classes e dados) e **de processos** (fluxos de negócio).

## Estrutura do Repositório

```
documentos_agencia_turismo/
├── diagrama_atividade/          # Fluxo de processos de compra
│   ├── codigo_atividade.txt     # Código PlantUML do diagrama de atividade
│   └── diagrama_atividades.png  # Imagem do diagrama renderizado
├── diagrama_caso_uso/           # Casos de uso do sistema
│   └── Diagrama de Caso de Uso - Sistema com Permissionamento por Perfil.png
├── diagrama_classe/             # Estrutura de classes
│   ├── codigo_classe.txt        # Código PlantUML do diagrama de classe
│   └── Diagrama-classe.png      # Imagem do diagrama renderizado
├── diagrama_er/                 # Modelo de dados (DER)
│   ├── codigo-der.txt           # Código PlantUML do diagrama E-R
│   └── DER.png                  # Imagem do diagrama renderizado
├── user_stories/                # Histórias de usuário detalhadas
│   ├── HU01 - Gerenciamento de Perfis de Acesso.md
│   ├── HU02 - Gerenciamento de Todas as Contas de Usuário.md
│   ├── HU03 - Gestão de Fornecedores e Catálogo de Serviços.md
│   ├── HU04 - Criação e Gestão de Pacotes de Viagem do Catálogo.md
│   ├── HU05 - Navegação, Cadastro e Visualização de Pacotes pelo Cliente.md
│   ├── HU06 - Compra de um Pacote e Realização do Pagamento.md
│   ├── HU07 - Gestão e Confirmação de Vendas pelo Atendente.md
│   ├── HU08 - Emissão de Nota Fiscal da Venda.md
│   ├── HU09 - Dashboard Estratégico do Gerente.md
│   ├── HU10 - Abertura de Chamados.md
│   └── HU11 - Atendimento e Gerenciamento de Chamados.md
└── README.md                    # Este arquivo
```

## Diagramas Técnicos

### 1. Diagrama de Caso de Uso

O diagrama de caso de uso ilustra as funcionalidades do sistema e as interações entre os principais atores: **Cliente**, **Visitante**, **Gerente**, **Atendente** e sistemas externos (**Sistema de Pagamentos** e **Sistema Fiscal**).

**Principais Atores e Funcionalidades:**

| Ator | Funcionalidades Principais |
| :--- | :--- |
| **Cliente** | Comprar pacotes, visualizar detalhes, abrir chamados de suporte |
| **Visitante** | Navegar no catálogo, realizar cadastro |
| **Gerente** | Administrar contas, modificar perfis de acesso, acessar dashboard de vendas |
| **Atendente** | Gerenciar vendas, fornecedores, serviços, pacotes e chamados de suporte |
| **Sistema de Pagamentos** | Processar transações (integração externa) |
| **Sistema Fiscal** | Emitir notas fiscais (integração externa) |

### 2. Diagrama de Atividade

O diagrama de atividade detalha o **fluxo de compra de um pacote de viagem**, envolvendo verificação de disponibilidade, aprovação de desconto e processamento de pagamento. O fluxo inclui decisões críticas e envolve múltiplos atores (Cliente, Atendente, Gerente e Sistema).

**Principais Etapas do Fluxo:**

1. **Solicitação:** Cliente solicita a compra de um pacote
2. **Processamento:** Atendente recebe e processa o pedido
3. **Verificação Paralela:** Sistema verifica disponibilidade de hospedagem, passagem e tour simultaneamente
4. **Aprovação de Desconto:** Se aplicável, Gerente aprova ou nega desconto
5. **Pagamento:** Cliente efetua pagamento, que é processado pelo sistema
6. **Finalização:** Se aprovado, sistema confirma reservas, emite nota fiscal e envia confirmação

### 3. Diagrama de Classe

O diagrama de classe modela a estrutura estática do sistema, definindo as entidades principais e seus relacionamentos.

**Hierarquia de Usuários:**

- **Usuario** (classe abstrata): Classe base com atributos comuns (id, nome, email, senha)
  - **Cliente:** Especialização para clientes finais (adiciona CPF, telefone)
  - **AgenteDeViagens:** Especialização para atendentes (adiciona matrícula)
  - **Administrador:** Especialização para gerentes (herda de Usuario)

**Entidades de Venda:**

- **Pacote:** Representa um pacote de viagem com preço, datas e disponibilidade
- **Reserva:** Representa uma reserva feita por um cliente
- **Pagamento:** Representa uma transação de pagamento
- **Destino:** Representa um destino geográfico

**Relacionamentos Chave:**

- Um **Cliente** faz múltiplas **Reservas** (1:N)
- Um **Pacote** está contido em múltiplas **Reservas** (1:N)
- Uma **Reserva** possui um **Pagamento** (1:1)
- **Pacote** e **Destino** possuem associação N:M

### 4. Diagrama Entidade-Relacionamento (DER)

O DER modela a estrutura do banco de dados com entidades transacionais, funcionais e especialização de serviços.

**Entidades Principais:**

| Categoria | Entidades |
| :--- | :--- |
| **Transacionais** | CLIENTE, PACOTE, RESERVA, PAGAMENTO, DESTINO |
| **Funcionais** | FUNCIONARIO, GERENTE |
| **Recursos/Serviços** | SERVICO, VOO (especialização), HOTEL (especialização) |

**Relacionamentos Críticos:**

- CLIENTE (1) efetua RESERVA (N)
- FUNCIONARIO (1) assessora RESERVA (N)
- GERENTE (1) gerencia FUNCIONARIO (N)
- RESERVA (1) possui PAGAMENTO (N)
- RESERVA (N) contém PACOTE (M)
- PACOTE (N) compõe SERVICO (M)
- SERVICO é especializado em VOO e HOTEL

## Histórias de Usuário

O projeto contém **11 Histórias de Usuário (HUs)** que cobrem os principais requisitos funcionais, organizadas por áreas:

### Gestão de Acesso

**HU01 - Gerenciamento de Perfis de Acesso**
- **Ator:** Gerente
- **Objetivo:** Configurar permissões para perfis fixos (Gerente, Atendente, Cliente)
- **Critérios:** Sistema com 3 perfis fixos, permissões visualizáveis e aplicáveis instantaneamente

**HU02 - Gerenciamento de Todas as Contas de Usuário**
- **Ator:** Gerente
- **Objetivo:** CRUD centralizado de todas as contas de usuário
- **Critérios:** Validação de unicidade, filtros por perfil/status, exclusão lógica

### Catálogo e Fornecedores

**HU03 - Gestão de Fornecedores e Catálogo de Serviços**
- **Ator:** Atendente
- **Objetivo:** Cadastrar e gerenciar fornecedores e serviços (voos, hotéis, tours)
- **Critérios:** Cadastro de fornecedores, associação de múltiplos serviços, validação de CNPJ

**HU04 - Criação e Gestão de Pacotes de Viagem do Catálogo**
- **Ator:** Atendente
- **Objetivo:** Montar, editar e gerenciar pacotes de viagem
- **Critérios:** Seleção de serviços, cálculo automático de preço, histórico de alterações

### Vendas e Compra

**HU05 - Navegação, Cadastro e Visualização de Pacotes pelo Cliente**
- **Ator:** Cliente/Visitante
- **Objetivo:** Navegar no catálogo, realizar cadastro e visualizar detalhes
- **Critérios:** Catálogo público, busca e filtros, confirmação por e-mail

**HU06 - Compra de um Pacote e Realização do Pagamento**
- **Ator:** Cliente
- **Objetivo:** Fluxo completo de compra e pagamento
- **Critérios:** Seleção de passageiros, aplicação de descontos, integração com sistema de pagamentos

**HU07 - Gestão e Confirmação de Vendas pelo Atendente**
- **Ator:** Atendente
- **Objetivo:** Acompanhar, confirmar e gerenciar status das vendas
- **Critérios:** Listagem com filtros, visualização detalhada, alteração de status

**HU08 - Emissão de Nota Fiscal da Venda**
- **Ator:** Atendente
- **Objetivo:** Gerar nota fiscal após confirmação da venda
- **Critérios:** Geração automática, envio para sistema fiscal, armazenamento de cópia

### Gestão e Suporte

**HU09 - Dashboard Estratégico do Gerente**
- **Ator:** Gerente
- **Objetivo:** Acessar painel com métricas e relatórios de vendas
- **Critérios:** Gráficos de vendas, indicadores de receita, exportação de relatórios

**HU10 - Abertura de Chamados**
- **Ator:** Cliente
- **Objetivo:** Abrir e acompanhar chamados de suporte
- **Critérios:** Formulário com categoria, anexação de arquivos, acompanhamento em tempo real

**HU11 - Atendimento e Gerenciamento de Chamados**
- **Ator:** Atendente
- **Objetivo:** Receber, atender e resolver chamados de suporte
- **Critérios:** Fila de chamados, atribuição, histórico de interações, avaliação


- **Vinicius dos Santos** (viniciusdossantosss)

## Licença

Este projeto está disponível sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.

## Contato

Para dúvidas ou sugestões sobre a documentação, abra uma issue no repositório ou entre em contato com o AUTORES - VINICIUS DOS SANTOS REIS E LUCAS DE OLIVEIRA RANGEL

---
