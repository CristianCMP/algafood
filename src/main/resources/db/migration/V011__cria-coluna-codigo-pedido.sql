ALTER TABLE pedido
    ADD COLUMN codigo VARCHAR(36) NOT NULL;

UPDATE pedido
SET codigo = gen_random_uuid()::VARCHAR;

ALTER TABLE pedido
    ADD CONSTRAINT uk_pedido_codigo UNIQUE (codigo);
