DROP TABLE IF EXISTS pedido_completo CASCADE;

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

CREATE TABLE pedido (
    id_pedido           INTEGER,
    data_pedido         TIMESTAMP,
    nome_cliente        VARCHAR(100),
    cpf_cliente         VARCHAR(14) unique,
    rua,
    complemento,
    bairro,
    cidade,
    estado
    id_produto          INTEGER,
    nome_produto        VARCHAR(100),
    categoria_produto   VARCHAR(80),
    id_categoria        INTEGER,
    descricao_categoria TEXT,
    quantidade          INTEGER,
    valor_unitario      NUMERIC(10,2),
    
    PRIMARY KEY (id_pedido, id_produto)
);


create table telefone (
	id_telefone serial primary key,
	telefone1 char(11)
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
 105, 'Smart TV 50"', 'Eletrônicos', 1, 'Equipamentos eletrônicos', 2, 2500.00);
 
/*create table pedido(
 

	id_pedido serial primary key,
	data_pedido timestamp,
	quantidade int check (quantidade >0)
	fk_cliente int references cliente(id_cliente)
);

create table cliente (
	id_cliente serial primary key,
	nome_cliente varchar (100) not null ,
	cpf_cliente varchar (14) unique,
	telefone_cliente varchar (100),
	fk_endereco int references endereco(id_endereco)
);

create table endereco(
	id_endereco serial primary key
	rua text not null,
	numero int not null,
	complemento varchar(5) default 'Sem complemento',
	bairro varchar(100),
	cidade varchar (100) not null,
	estado char (2) not null
);

create table produto(
	id_produto serial primary key,
	nome_produto varchar (100),
	categoria_produto varchar (80),
	valor_unitario numeric(10,2),
	fk_pedido int references pedido (id_pedido)
);

*/