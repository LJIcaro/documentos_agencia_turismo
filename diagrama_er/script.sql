CREATE TABLE "PERFIS"(
    "id_perfil" INTEGER NOT NULL,
    "nome" VARCHAR(50) NOT NULL
);
ALTER TABLE
    "PERFIS" ADD PRIMARY KEY("id_perfil");
ALTER TABLE
    "PERFIS" ADD CONSTRAINT "perfis_nome_unique" UNIQUE("nome");
CREATE TABLE "USUARIOS"(
    "id_usuario" INTEGER NOT NULL,
    "fk_id_perfil" INTEGER NOT NULL,
    "nome_completo" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "senha_hash" VARCHAR(255) NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT '1',
    "data_criacao" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cpf_cnpj" VARCHAR(18) NULL,
    "telefone" VARCHAR(20) NULL,
    "endereco" TEXT NULL
);
ALTER TABLE
    "USUARIOS" ADD PRIMARY KEY("id_usuario");
ALTER TABLE
    "USUARIOS" ADD CONSTRAINT "usuarios_email_unique" UNIQUE("email");
ALTER TABLE
    "USUARIOS" ADD CONSTRAINT "usuarios_cpf_cnpj_unique" UNIQUE("cpf_cnpj");
CREATE TABLE "FORNECEDORES"(
    "id_fornecedor" INTEGER NOT NULL,
    "razao_social" VARCHAR(255) NOT NULL,
    "cnpj_cpf" VARCHAR(18) NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT '1'
);
ALTER TABLE
    "FORNECEDORES" ADD PRIMARY KEY("id_fornecedor");
ALTER TABLE
    "FORNECEDORES" ADD CONSTRAINT "fornecedores_cnpj_cpf_unique" UNIQUE("cnpj_cpf");
CREATE TABLE "SERVICO"(
    "id_servico" INTEGER NOT NULL,
    "fk_id_fornecedor" INTEGER NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "descricao" TEXT NULL,
    "destino" VARCHAR(255) NULL,
    "preco_custo" DECIMAL(10, 2) NOT NULL,
    "preco_venda" DECIMAL(10, 2) NOT NULL
);
ALTER TABLE
    "SERVICO" ADD PRIMARY KEY("id_servico");
CREATE TABLE "PACOTE"(
    "id_pacote" INTEGER NOT NULL,
    "fk_id_usuario_criador" INTEGER NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "descricao" TEXT NULL,
    "preco_venda_final" DECIMAL(10, 2) NOT NULL,
    "status" VARCHAR(255) CHECK
        (
            "status" IN(
                '-Em Edição;
-Disponível;
-Arquivado;'
            )
        ) NOT NULL DEFAULT 'Em Edição'
);
ALTER TABLE
    "PACOTE" ADD PRIMARY KEY("id_pacote");
CREATE TABLE "PACOTE_SERVICO"(
    "id_pacote_servico" INTEGER NOT NULL,
    "fk_id_pacote" INTEGER NOT NULL,
    "fk_id_servico" INTEGER NOT NULL
);
ALTER TABLE
    "PACOTE_SERVICO" ADD PRIMARY KEY("id_pacote_servico");
CREATE TABLE "VENDAS"(
    "id_venda" INTEGER NOT NULL,
    "fk_id_cliente" INTEGER NOT NULL,
    "fk_id_atendente" INTEGER NOT NULL,
    "fk_id_pacote" INTEGER NOT NULL,
    "data_venda" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "valor_final_venda" DECIMAL(10, 2) NOT NULL,
    "status_venda" VARCHAR(255) CHECK
        (
            "status_venda" IN(
                '-Aguardando Pagamento;
-Confirmada;
-Cancelada;'
            )
        ) NOT NULL DEFAULT 'Aguardando Pagamento'
);
ALTER TABLE
    "VENDAS" ADD PRIMARY KEY("id_venda");
CREATE TABLE "PAGAMENTOS"(
    "id_pagamento" INTEGER NOT NULL,
    "fk_id_venda" INTEGER NOT NULL,
    "valor_pago" DECIMAL(10, 2) NOT NULL,
    "data_pagamento" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metodo_pagamento" VARCHAR(100) NULL
);
ALTER TABLE
    "PAGAMENTOS" ADD PRIMARY KEY("id_pagamento");
CREATE TABLE "NOTAS_FISCAIS"(
    "id_nota_fiscal" INTEGER NOT NULL,
    "fk_id_venda" INTEGER NOT NULL,
    "numero_nf" VARCHAR(100) NOT NULL,
    "chave_acesso" VARCHAR(255) NOT NULL,
    "data_emissao" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "caminho_arquivo_pdf" VARCHAR(500) NULL
);
ALTER TABLE
    "NOTAS_FISCAIS" ADD PRIMARY KEY("id_nota_fiscal");
ALTER TABLE
    "NOTAS_FISCAIS" ADD CONSTRAINT "notas_fiscais_fk_id_venda_unique" UNIQUE("fk_id_venda");
ALTER TABLE
    "NOTAS_FISCAIS" ADD CONSTRAINT "notas_fiscais_chave_acesso_unique" UNIQUE("chave_acesso");
CREATE TABLE "CHAMADO"(
    "id_chamdo" INTEGER NOT NULL,
    "fk_id_cliente" INTEGER NOT NULL,
    "fk_id_atendente" INTEGER NULL,
    "titulo" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) CHECK
        (
            "status" IN(
                '-Aberto;
-Em Atendimento;
-Fechado;'
            )
        ) NOT NULL DEFAULT 'Aberto',
        "data_abertura" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "data_fechamento" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
ALTER TABLE
    "CHAMADO" ADD PRIMARY KEY("id_chamdo");
CREATE TABLE "MENSAGENS"(
    "id_mensagem" INTEGER NOT NULL,
    "fk_id_chamado" INTEGER NOT NULL,
    "fk_id_remetente" INTEGER NOT NULL,
    "conteudo" TEXT NOT NULL,
    "data_envio" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    "MENSAGENS" ADD PRIMARY KEY("id_mensagem");
ALTER TABLE
    "PACOTE_SERVICO" ADD CONSTRAINT "pacote_servico_fk_id_servico_foreign" FOREIGN KEY("fk_id_servico") REFERENCES "SERVICO"("id_servico");
ALTER TABLE
    "VENDAS" ADD CONSTRAINT "vendas_fk_id_pacote_foreign" FOREIGN KEY("fk_id_pacote") REFERENCES "PACOTE"("id_pacote");
ALTER TABLE
    "USUARIOS" ADD CONSTRAINT "usuarios_fk_id_perfil_foreign" FOREIGN KEY("fk_id_perfil") REFERENCES "PERFIS"("id_perfil");
ALTER TABLE
    "PAGAMENTOS" ADD CONSTRAINT "pagamentos_fk_id_venda_foreign" FOREIGN KEY("fk_id_venda") REFERENCES "VENDAS"("id_venda");
ALTER TABLE
    "MENSAGENS" ADD CONSTRAINT "mensagens_fk_id_remetente_foreign" FOREIGN KEY("fk_id_remetente") REFERENCES "USUARIOS"("id_usuario");
ALTER TABLE
    "PACOTE" ADD CONSTRAINT "pacote_fk_id_usuario_criador_foreign" FOREIGN KEY("fk_id_usuario_criador") REFERENCES "USUARIOS"("id_usuario");
ALTER TABLE
    "MENSAGENS" ADD CONSTRAINT "mensagens_fk_id_chamado_foreign" FOREIGN KEY("fk_id_chamado") REFERENCES "CHAMADO"("id_chamdo");
ALTER TABLE
    "CHAMADO" ADD CONSTRAINT "chamado_fk_id_cliente_foreign" FOREIGN KEY("fk_id_cliente") REFERENCES "USUARIOS"("id_usuario");
ALTER TABLE
    "SERVICO" ADD CONSTRAINT "servico_fk_id_fornecedor_foreign" FOREIGN KEY("fk_id_fornecedor") REFERENCES "FORNECEDORES"("id_fornecedor");
ALTER TABLE
    "CHAMADO" ADD CONSTRAINT "chamado_fk_id_atendente_foreign" FOREIGN KEY("fk_id_atendente") REFERENCES "USUARIOS"("id_usuario");
ALTER TABLE
    "VENDAS" ADD CONSTRAINT "vendas_fk_id_cliente_foreign" FOREIGN KEY("fk_id_cliente") REFERENCES "USUARIOS"("id_usuario");
ALTER TABLE
    "PACOTE_SERVICO" ADD CONSTRAINT "pacote_servico_fk_id_pacote_foreign" FOREIGN KEY("fk_id_pacote") REFERENCES "PACOTE"("id_pacote");
ALTER TABLE
    "NOTAS_FISCAIS" ADD CONSTRAINT "notas_fiscais_fk_id_venda_foreign" FOREIGN KEY("fk_id_venda") REFERENCES "VENDAS"("id_venda");
ALTER TABLE
    "VENDAS" ADD CONSTRAINT "vendas_fk_id_atendente_foreign" FOREIGN KEY("fk_id_atendente") REFERENCES "USUARIOS"("id_usuario");