/*DROP TABLE IF EXISTS pedido_completo CASCADE;

CREATE TABLE pedido_completo (
    id_pedido           INTEGER,
    data_pedido         TIMESTAMP,
    nome_cliente        VARCHAR(100),
    cpf_cliente         VARCHAR(14) unique,
    telefone_cliente    VARCHAR(100),
    endereco_cliente    VARCHAR(200),
    id_produto          INTEGER,
    nome_produto        VARCHAR(100),
    categoria_produto   VARCHAR(80),
    id_categoria        INTEGER,
    descricao_categoria TEXT,
    quantidade          INTEGER,
    valor_unitario      NUMERIC(10,2),
    
    PRIMARY KEY (id_pedido, id_produto)
);

INSERT INTO pedido_completo (id_pedido, data_pedido, nome_cliente, cpf_cliente, telefone_cliente, endereco_cliente,
id_produto, nome_produto, categoria_produto, id_categoria, descricao_categoria, quantidade, valor_unitario)
VALUES
(1, '2026-03-01 10:15:00', 'João Silva', '111.111.111-11', '21999999999,21988888888', 'Rua A, 123, Centro, Teresópolis, RJ',
 101, 'Notebook Dell', 'Informática', 1, 'Equipamentos eletrônicos', 1, 3500.00),
(1, '2026-03-01 10:15:00', 'João Silva', '111.111.111-11', '21999999999,21988888888', 'Rua A, 123, Centro, Teresópolis, RJ',
 102, 'Mouse Gamer', 'Informática', 1, 'Equipamentos eletrônicos', 2, 150.00),
(2, '2026-03-01 11:30:00', 'Maria Souza', '222.222.222-22', '21977777777', 'Rua B, 45, Várzea, Teresópolis, RJ',
 103, 'Geladeira Brastemp', 'Eletrodomésticos', 2, 'Aparelhos para residência', 1, 2800.00),
(3, '2026-03-01 14:10:00', 'Carlos Pereira', '333.333.333-33', '21966666666,21955555555', 'Rua C, 78, Alto, Teresópolis, RJ',
 101, 'Notebook Dell', 'Informática', 1, 'Equipamentos eletrônicos', 1, 3500.00),
(4, '2026-03-02 09:00:00', 'Ana Lima', '444.444.444-44', '21944444444', 'Rua D, 200, São Pedro, Teresópolis, RJ',
 104, 'Sofá 3 Lugares', 'Móveis', 3, 'Móveis residenciais', 1, 1800.00),
(5, '2026-03-02 10:20:00', 'Bruno Alves', '555.555.555-55', '21933333333', 'Rua E, 300, Centro, Teresópolis, RJ',
 105, 'Smart TV 50"', 'Eletrônicos', 1, 'Equipamentos eletrônicos', 1, 2500.00),
(6, '2026-03-02 13:45:00', 'Fernanda Rocha', '666.666.666-66', '21922222222,21911111111', 'Rua F, 12, Meudon, Teresópolis, RJ',
 102, 'Mouse Gamer', 'Informática', 1, 'Equipamentos eletrônicos', 3, 150.00),
(7, '2026-03-02 15:00:00', 'Ricardo Mendes', '777.777.777-77', '21900000000', 'Rua G, 89, Barra, Teresópolis, RJ',
 103, 'Geladeira Brastemp', 'Eletrodomésticos', 2, 'Aparelhos para residência', 1, 2800.00),
(8, '2026-03-03 08:30:00', 'Juliana Costa', '888.888.888-88', '21888888888', 'Rua H, 500, Alto, Teresópolis, RJ',
 106, 'Mesa de Jantar', 'Móveis', 3, 'Móveis residenciais', 1, 1200.00),
(9, '2026-03-03 09:40:00', 'Paulo Henrique', '999.999.999-99', '21777777777', 'Rua I, 45, Centro, Teresópolis, RJ',
 105, 'Smart TV 50"', 'Eletrônicos', 1, 'Equipamentos eletrônicos', 2, 2500.00);*/



-- 1. Script de criação das tabelas após normalizar para a 1FN.



DROP TABLE IF EXISTS pedido_completo CASCADE;


CREATE TABLE pedido (
    id_pedido           serial primary key,
    data_pedido         TIMESTAMP,
    nome_cliente        VARCHAR(100),
    cpf_cliente         VARCHAR(14) unique,
    rua varchar (100),
    numero int,
    bairro varchar (100),
    cidade varchar (100),
    estado char (2),
    id_produto          INTEGER,
    nome_produto        VARCHAR(100),
    categoria_produto   VARCHAR(80),
    id_categoria        INTEGER,
    descricao_categoria TEXT,
    quantidade          INTEGER,
    valor_unitario      NUMERIC(10,2)
);


create table telefone (
	id_telefone serial primary key,
	id_cliente int references pedido (id_pedido),
	telefone char(11)
);


INSERT INTO pedido (
data_pedido, nome_cliente, cpf_cliente, rua, numero, bairro, cidade, estado,
id_produto, nome_produto, categoria_produto, id_categoria, descricao_categoria,
quantidade, valor_unitario
)
VALUES
('2026-03-01 10:15:00', 'João Silva', '111.111.111-11', 'Rua A', 123, 'Centro', 'Teresópolis', 'RJ',
102, 'Mouse Gamer', 'Informática', 1, 'Equipamentos eletrônicos', 2, 150.00),
('2026-03-01 11:30:00', 'Maria Souza', '222.222.222-22', 'Rua B', 45, 'Várzea', 'Teresópolis', 'RJ',
103, 'Geladeira Brastemp', 'Eletrodomésticos', 2, 'Aparelhos para residência', 1, 2800.00),
('2026-03-01 14:10:00', 'Carlos Pereira', '333.333.333-33', 'Rua C', 78, 'Alto', 'Teresópolis', 'RJ',
101, 'Notebook Dell', 'Informática', 1, 'Equipamentos eletrônicos', 1, 3500.00),
('2026-03-02 09:00:00', 'Ana Lima', '444.444.444-44', 'Rua D', 200, 'São Pedro', 'Teresópolis', 'RJ',
104, 'Sofá 3 Lugares', 'Móveis', 3, 'Móveis residenciais', 1, 1800.00),
('2026-03-02 10:20:00', 'Bruno Alves', '555.555.555-55', 'Rua E', 300, 'Centro', 'Teresópolis', 'RJ',
105, 'Smart TV 50', 'Eletrônicos', 1, 'Equipamentos eletrônicos', 1, 2500.00),
('2026-03-02 13:45:00', 'Fernanda Rocha', '666.666.666-66', 'Rua F', 12, 'Meudon', 'Teresópolis', 'RJ',
102, 'Mouse Gamer', 'Informática', 1, 'Equipamentos eletrônicos', 3, 150.00),
('2026-03-02 15:00:00', 'Ricardo Mendes', '777.777.777-77', 'Rua G', 89, 'Barra', 'Teresópolis', 'RJ',
103, 'Geladeira Brastemp', 'Eletrodomésticos', 2, 'Aparelhos para residência', 1, 2800.00),
('2026-03-03 08:30:00', 'Juliana Costa', '888.888.888-88', 'Rua H', 500, 'Alto', 'Teresópolis', 'RJ',
106, 'Mesa de Jantar', 'Móveis', 3, 'Móveis residenciais', 1, 1200.00),
('2026-03-03 09:40:00', 'Paulo Henrique', '999.999.999-99', 'Rua I', 45, 'Centro', 'Teresópolis', 'RJ',
105, 'Smart TV 50"', 'Eletrônicos', 1, 'Equipamentos eletrônicos', 2, 2500.00);

insert into telefone (id_cliente, telefone)
values(1, '21999999999'),
(1, '21988888888'),
(2, '21977777777'),
(3, '21966666666'),
(3, '21955555555'),
(4, '21944444444'),
(5, '21933333333'),
(6, '21922222222'),
(6, '21911111111'),
(7, '21900000000'),
(8, '21888888888'),
(9, '21777777777');



-- 2. Script de criação das tabelas após normalizar para a 2FN

CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100),
    cpf_cliente VARCHAR(14) UNIQUE,
    rua VARCHAR(100),
    numero INT,
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2)
);

CREATE TABLE telefone (
    id_telefone SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES cliente(id_cliente),
    telefone CHAR(11)
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY,
    categoria_produto VARCHAR(80),
    descricao_categoria TEXT
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    id_categoria INT REFERENCES categoria(id_categoria),
    valor_unitario NUMERIC(10,2)
);

CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,
    data_pedido TIMESTAMP,
    id_cliente INT REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedido(id_pedido),
    id_produto INT REFERENCES produto(id_produto),
    quantidade INT
);

INSERT INTO cliente (nome_cliente, cpf_cliente, rua, numero, bairro, cidade, estado) VALUES
('João Silva','111.111.111-11','Rua A',123,'Centro','Teresópolis','RJ'),
('Maria Souza','222.222.222-22','Rua B',45,'Várzea','Teresópolis','RJ'),
('Carlos Pereira','333.333.333-33','Rua C',78,'Alto','Teresópolis','RJ'),
('Ana Lima','444.444.444-44','Rua D',200,'São Pedro','Teresópolis','RJ'),
('Bruno Alves','555.555.555-55','Rua E',300,'Centro','Teresópolis','RJ'),
('Fernanda Rocha','666.666.666-66','Rua F',12,'Meudon','Teresópolis','RJ'),
('Ricardo Mendes','777.777.777-77','Rua G',89,'Barra','Teresópolis','RJ'),
('Juliana Costa','888.888.888-88','Rua H',500,'Alto','Teresópolis','RJ'),
('Paulo Henrique','999.999.999-99','Rua I',45,'Centro','Teresópolis','RJ');

INSERT INTO telefone (id_cliente,telefone) VALUES
(1,'21999999999'),
(1,'21988888888'),
(2,'21977777777'),
(3,'21966666666'),
(3,'21955555555'),
(4,'21944444444'),
(5,'21933333333'),
(6,'21922222222'),
(6,'21911111111'),
(7,'21900000000'),
(8,'21888888888'),
(9,'21777777777');

INSERT INTO categoria (id_categoria,categoria_produto,descricao_categoria) VALUES
(1,'Informática','Equipamentos eletrônicos'),
(2,'Eletrodomésticos','Aparelhos para residência'),
(3,'Móveis','Móveis residenciais'),
(4, 'Eletrônicos', 'Equipamentos Eletrônicos');

INSERT INTO produto (id_produto,nome_produto,id_categoria,valor_unitario) VALUES
(101,'Notebook Dell',1,3500.00),
(102,'Mouse Gamer',1,150.00),
(103,'Geladeira Brastemp',2,2800.00),
(104,'Sofá 3 Lugares',3,1800.00),
(105,'Smart TV 50',1,2500.00),
(106,'Mesa de Jantar',3,1200.00);

INSERT INTO pedido (data_pedido,id_cliente) VALUES
('2026-03-01 10:15:00',1),
('2026-03-01 11:30:00',2),
('2026-03-01 14:10:00',3),
('2026-03-02 09:00:00',4),
('2026-03-02 10:20:00',5),
('2026-03-02 13:45:00',6),
('2026-03-02 15:00:00',7),
('2026-03-03 08:30:00',8),
('2026-03-03 09:40:00',9);

INSERT INTO item_pedido (id_pedido,id_produto,quantidade) VALUES
(1,102,2),
(2,103,1),
(3,101,1),
(4,104,1),
(5,105,1),
(6,102,3),
(7,103,1),
(8,106,1),
(9,105,2);


 
