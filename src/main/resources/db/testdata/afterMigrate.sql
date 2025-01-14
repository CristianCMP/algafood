ALTER TABLE cidade DISABLE TRIGGER ALL;
ALTER TABLE cozinha DISABLE TRIGGER ALL;
ALTER TABLE estado DISABLE TRIGGER ALL;
ALTER TABLE forma_pagamento DISABLE TRIGGER ALL;
ALTER TABLE grupo DISABLE TRIGGER ALL;
ALTER TABLE grupo_permissao DISABLE TRIGGER ALL;
ALTER TABLE permissao DISABLE TRIGGER ALL;
ALTER TABLE produto DISABLE TRIGGER ALL;
ALTER TABLE restaurante DISABLE TRIGGER ALL;
ALTER TABLE restaurante_forma_pagamento DISABLE TRIGGER ALL;
ALTER TABLE usuario DISABLE TRIGGER ALL;
ALTER TABLE usuario_grupo DISABLE TRIGGER ALL;


DELETE FROM cidade;
DELETE FROM cozinha;
DELETE FROM estado;
DELETE FROM forma_pagamento;
DELETE FROM grupo;
DELETE FROM grupo_permissao;
DELETE FROM permissao;
DELETE FROM produto;
DELETE FROM restaurante;
DELETE FROM restaurante_forma_pagamento;
DELETE FROM restaurante_usuario_responsavel;
DELETE FROM usuario;
DELETE FROM usuario_grupo;
DELETE FROM item_pedido;
DELETE FROM pedido;
DELETE FROM foto_produto;


ALTER SEQUENCE cidade_id_seq RESTART WITH 1;
ALTER SEQUENCE cozinha_id_seq RESTART WITH 1;
ALTER SEQUENCE estado_id_seq RESTART WITH 1;
ALTER SEQUENCE forma_pagamento_id_seq RESTART WITH 1;
ALTER SEQUENCE grupo_id_seq RESTART WITH 1;
ALTER SEQUENCE permissao_id_seq RESTART WITH 1;
ALTER SEQUENCE produto_id_seq RESTART WITH 1;
ALTER SEQUENCE restaurante_id_seq RESTART WITH 1;
ALTER SEQUENCE usuario_id_seq RESTART WITH 1;

-- Inserção de dados
INSERT INTO cozinha (id, nome) VALUES (1, 'Tailandesa');
INSERT INTO cozinha (id, nome) VALUES (2, 'Indiana');
INSERT INTO cozinha (id, nome) VALUES (3, 'Argentina');
INSERT INTO cozinha (id, nome) VALUES (4, 'Brasileira');

INSERT INTO estado (id, nome) VALUES (1, 'Minas Gerais');
INSERT INTO estado (id, nome) VALUES (2, 'São Paulo');
INSERT INTO estado (id, nome) VALUES (3, 'Ceará');

INSERT INTO cidade (id, nome, estado_id) VALUES (1, 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (2, 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) VALUES (3, 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (4, 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) VALUES (5, 'Fortaleza', 3);

INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro)
VALUES
    (1, 'Thai Gourmet', 10, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, true, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro'),
    (2, 'Thai Delivery', 9.50, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, true, null, null, null, null, null),
    (3, 'Tuk Tuk Comida Indiana', 15, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, true, null, null, null, null, null),
    (4, 'Java Steakhouse', 12, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, true, null, null, null, null, null),
    (5, 'Lanchonete do Tio Sam', 11, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, true, null, null, null, null, null),
    (6, 'Bar da Maria', 6, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, true, true, null, null, null, null, null);

INSERT INTO forma_pagamento (id, descricao, data_atualizacao) VALUES (1, 'Cartão de crédito', CURRENT_TIMESTAMP);
INSERT INTO forma_pagamento (id, descricao, data_atualizacao) VALUES (2, 'Cartão de débito',CURRENT_TIMESTAMP);
INSERT INTO forma_pagamento (id, descricao, data_atualizacao) VALUES (3, 'Dinheiro',CURRENT_TIMESTAMP);

INSERT INTO permissao (id, nome, descricao) VALUES (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
INSERT INTO permissao (id, nome, descricao) VALUES (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');

INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
VALUES
    (1, 1), (1, 2), (1, 3),
    (2, 3), (3, 2), (3, 3),
    (4, 1), (4, 2),
    (5, 1), (5, 2),
    (6, 3);

INSERT INTO produto (nome, descricao, preco, ativo, restaurante_id) VALUES
                                                                        ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, false, 1),
                                                                        ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1),
                                                                        ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2),
                                                                        ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3),
                                                                        ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3),
                                                                        ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4),
                                                                        ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4),
                                                                        ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5),
                                                                        ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6);

INSERT INTO grupo (id, nome) VALUES (1, 'Gerente'), (2, 'Vendedor'), (3, 'Secretária'), (4, 'Cadastrador');

INSERT INTO grupo_permissao (grupo_id, permissao_id) VALUES (1, 1), (1, 2), (2, 1), (2, 2), (3, 1);

INSERT INTO usuario (id, nome, email, senha, data_cadastro) VALUES
                                                                (1, 'João da Silva', 'joao.ger@algafood.com.br', '123', CURRENT_TIMESTAMP),
                                                                (2, 'Maria Joaquina', 'maria.vnd@algafood.com.br', '123', CURRENT_TIMESTAMP),
                                                                (3, 'José Souza', 'jose.aux@algafood.com.br', '123', CURRENT_TIMESTAMP),
                                                                (4, 'Sebastião Martins', 'sebastiao.cad@algafood.com.br', '123', CURRENT_TIMESTAMP),
                                                                (5, 'Manoel Lima', 'manoel.loja@gmail.com', '123', CURRENT_TIMESTAMP),
                                                                (6, 'Débora Mendonça', 'email.teste.aw+debora@gmail.com', '123', CURRENT_TIMESTAMP),
                                                                (7, 'Carlos Lima', 'email.teste.aw+carlos@gmail.com', '123', CURRENT_TIMESTAMP);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (1, 1), (1, 2), (2, 2);

INSERT INTO restaurante_usuario_responsavel (restaurante_id, usuario_id) VALUES (1, 5), (3, 5);

INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status, data_criacao, subtotal, taxa_frete, valor_total)
VALUES
    (1, 'f9981ca4-5a5e-4da3-af04-933861df3e55', 1, 6, 1, 1, '38400-000', 'Rua Floriano Peixoto', '500', 'Apto 801', 'Brasil', 'CRIADO', CURRENT_TIMESTAMP, 298.90, 10, 308.90);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
VALUES
    (1, 1, 1, 1, 78.9, 78.9, null),
    (2, 1, 2, 2, 110, 220, 'Menos picante, por favor');

INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro, status, data_criacao, subtotal, taxa_frete, valor_total)
VALUES
    (2, 'd178b637-a785-4768-a3cb-aa1ce5a8cdab', 4, 6, 2, 1, '38400-111', 'Rua Acre', '300', 'Casa 2', 'Centro', 'CRIADO', CURRENT_TIMESTAMP, 79, 0, 79);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
VALUES
    (3, 2, 6, 1, 79, 79, 'Ao ponto');

ALTER TABLE cidade ENABLE TRIGGER ALL;
ALTER TABLE cozinha ENABLE TRIGGER ALL;
ALTER TABLE estado ENABLE TRIGGER ALL;
ALTER TABLE forma_pagamento ENABLE TRIGGER ALL;
ALTER TABLE grupo ENABLE TRIGGER ALL;
ALTER TABLE grupo_permissao ENABLE TRIGGER ALL;
ALTER TABLE permissao ENABLE TRIGGER ALL;
ALTER TABLE produto ENABLE TRIGGER ALL;
ALTER TABLE restaurante ENABLE TRIGGER ALL;
ALTER TABLE restaurante_forma_pagamento ENABLE TRIGGER ALL;
ALTER TABLE usuario ENABLE TRIGGER ALL;
ALTER TABLE usuario_grupo ENABLE TRIGGER ALL;