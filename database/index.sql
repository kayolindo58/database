CREATE DATABASE IF NOT EXISTS loja_byte;

USE loja_byte;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    estado CHAR(2) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nomeproduto VARCHAR(300) NOT NULL,
    valorproduto DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2),
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedidos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2),
    CONSTRAINT fk_itens_pedidos_produtos FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

INSERT INTO
    clientes (nome, estado)
VALUES ('wagner', 'MG'),
    ('filipe', 'BA'),
    ('robson', 'BA'),
    ('gabriel', 'BA');

INSERT INTO
    produtos (
        nomeproduto,
        valorproduto,
        estoque
    )
VALUES ('notebook', 1000.00, 100),
    ('celular', 2000.00, 2000),
    ('planta de dragão', 40.00, 50),
    (
        'semente de hydra',
        2200.00,
        4
    );

INSERT INTO pedidos (id_cliente) VALUES (1);

INSERT INTO pedidos (id_cliente) VALUES (2), (3), (4);

INSERT INTO
    itens_pedido (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES (1, 1, 2, 1000.00),
    (2, 2, 1, 2000.00),
    (2, 3, 3, 40.00),
    (3, 4, 1, 2200.00);

INSERT INTO
    itens_pedido (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES (4, 2, 1, 2000.00);

-- CAMPO 2

INSERT INTO
    clientes (id_cliente, nome, estado)
VALUES (6, 'rafael', 'MG');

INSERT INTO
    produtos (
        id_produto,
        nomeproduto,
        valorproduto,
        estoque
    )
VALUES
(50, 'Headset', 150.00, 100);

-- CAMPO 3

-- A)
SELECT
p.id_pedido,
c.nome,
c.estado
FROM pedidos p
INNER JOIN clientes c
ON p.id_pedido = c.id_cliente;

-- B)

INSERT INTO clientes (id_cliente, nome, estado)
VALUES
(7, 'diego', 'MG');

SELECT
p.id_pedido,
p.data_pedido,
c.nome,
c.estado
FROM clientes c
LEFT JOIN pedidos p
ON c.id_cliente = p.id_pedido;

-- C)

INSERT INTO clientes (nome, estado)
VALUES
('danilo', 'SP');

SELECT
p.id_pedido,
p.data_pedido,
c.nome,
c.estado
FROM clientes c
LEFT JOIN pedidos p
ON c.id_cliente = p.id_pedido
WHERE id_pedido IS NULL;

-- D)

SELECT
p.id_pedido,
p.data_pedido,
c.nome,
c.estado
FROM pedidos p
RIGHT JOIN clientes c 
ON p.id_pedido = c.id_cliente;

SELECT
p.id_pedido,
p.data_pedido,
c.nome,
c.estado
FROM pedidos p
RIGHT JOIN clientes c
ON p.id_pedido = c.id_cliente
WHERE id_pedido IS NULL;

-- CAMPO 4

-- A)

SELECT COUNT(p.id_pedido)
FROM pedidos p;

-- B)

SELECT SUM(t.quantidade * t.preco_unitario)
FROM itens_pedido t;

-- C)

SELECT COUNT(DISTINCT c.id_cliente)
FROM clientes c;

SELECT 
COUNT(DISTINCT c.id_cliente),
c.nome
FROM clientes c
INNER JOIN pedidos p
ON c.id_cliente = p.id_pedido
WHERE c.id_cliente IS NOT NULL
GROUP BY c.id_cliente, p.id_pedido;

-- D)

SELECT AVG(p.valorproduto) AS preco_medio
FROM produtos p;

SELECT MIN(p.valorproduto) AS preco_min
FROM produtos p;

SELECT MAX(p.valorproduto) AS preco_max
FROM produtos p;


-- CAMPO 5

SELECT
c.estado,
SUM(t.quantidade * t.preco_unitario) AS faturamento_total,
SUM(t.quantidade) AS total_itens_vendidos
FROM itens_pedido t
INNER JOIN pedidos p
ON t.id_pedido = p.id_pedido
INNER JOIN clientes c
ON p.id_cliente = c.id_cliente
GROUP BY c.estado
ORDER BY faturamento_total DESC;

-- CAMPO 6

SELECT
c.estado,
SUM(t.quantidade * t.preco_unitario) AS faturamento_total,
SUM(t.quantidade) AS total_itens_vendidos
FROM itens_pedido t
INNER JOIN pedidos p
ON t.id_pedido = p.id_pedido
INNER JOIN clientes c
ON p.id_cliente = c.id_cliente
WHERE p.data_pedido > '2026-11-01'
GROUP BY c.estado
HAVING faturamento_total > 500
ORDER BY faturamento_total DESC;

-- CAMPO 7

INSERT INTO produtos (id_produto, nomeproduto, valorproduto, estoque)
VALUES
(240, 'mouses', 2000.00, 40)

UPDATE produtos
SET id_produto = 20, nomeproduto = 'mouse', 
valorproduto = 90.00, estoque = 20
WHERE id_produto = 240;

-- CAMPO 8 

SELECT
p.id_pedido,
p.data_pedido,
c.nome,
c.estado
FROM clientes c
LEFT JOIN pedidos p
ON c.id_cliente = p.id_pedido;

DELETE FROM clientes 
WHERE id_cliente = 7;

DELETE FROM clientes 
WHERE id_cliente = 8;

-- CAMPO 9

UPDATE clientes
SET estado = 'SP'
WHERE id_cliente = 2;

