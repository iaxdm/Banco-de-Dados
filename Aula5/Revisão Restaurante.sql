-- Restaurante

-- Pratos
-- Cliente
-- Funcionários
-- Entregas
-- Pedidos

CREATE TYPE cargos AS ENUM ('garçom', 'chef', 'atendente', 'cozinheiro', 'gerente')
-- Cria tipos de dados personalizados, na tabela só serão aceitos dados iguais aos sugeridos

CREATE TABLE pratos(
	id_prato serial PRIMARY KEY,
	nome varchar (50) NOT NULL UNIQUE,
	preço NUMERIC (7,2) CHECK (preço > 0 AND preço < 5000) NOT NULL,
	descrição text DEFAULT 'Sem informações'      -- Aspas simples servem para inserir valores textuais
);

CREATE table clientes(
	id_cliente serial primary KEY,
	nome varchar (80) NOT NULL,
	cpf char (11) unique,
	fk_endereco int REFERENCES enderecos (id_endereco)
);

CREATE TABLE enderecos (
	id_endereco serial primary KEY,
	rua varchar (100) NOT NULL DEFAULT 'Sem nome',
	numero varchar(20) NOT NULL DEFAULT 'S/N',
	bairro varchar (50) NOT null,
	cidade varchar (50) NOT null,
	estado char (2) NOT null,
	cep varchar (9),
	complemento varchar (80)
);

CREATE TABLE funcionarios (
	id_funcionarios serial PRIMARY KEY,
	endereco int REFERENCES enderecos (id_endereco),
	nome varchar (50) NOT NULL,
	cargo cargos NOT NULL,
	ativo bool NOT null
);

CREATE TABLE mesas (
	id_mesa serial PRIMARY KEY,
	lugares int
);

CREATE TABLE pedidos (
	id_pedido serial PRIMARY KEY,
	fk_cliente int REFERENCES clientes (id_cliente),
	fk_prato int REFERENCES pratos (id_prato),
	mesa int REFERENCES mesas (id_mesa),
	data_pedido timestamp DEFAULT now(),
	comanda int NOT NULL
);

CREATE TABLE entregas (
	id_entrega serial PRIMARY KEY,
	comanda int NOT NULL,
	fk_endereco int REFERENCES enderecos (id_endereco),
	entregue bool DEFAULT FALSE
);

drop table pratos;
drop table funcionarios;
drop table mesas;
drop table entregas;
drop table pedidos;
drop table enderecos;
drop table clientes;
drop type if exists cargos;
create type cargos AS enum ('Garçom', 'Gerente', 'Chefe Cozinha', 'Cozinheiro', 'Recepcionista', 'Entregador');

INSERT INTO enderecos (rua, numero, bairro, cidade, estado, cep, complemento) VALUES
('Rua das Flores', '120', 'Centro', 'São Paulo', 'SP', '01001-000', 'Apto 12'),
('Av. Paulista', '1578', 'Bela Vista', 'São Paulo', 'SP', '01310-200', 'Sala 45'),
('Rua Bahia', '55', 'Funcionários', 'Belo Horizonte', 'MG', '30160-010', NULL),
('Rua XV de Novembro', '890', 'Centro', 'Curitiba', 'PR', '80020-310', 'Fundos'),
('Av. Atlântica', '2200', 'Copacabana', 'Rio de Janeiro', 'RJ', '22041-001', NULL),
('Rua das Acácias', '45', 'Jardim Europa', 'Porto Alegre', 'RS', '90450-010', NULL),
('Rua do Comércio', '300', 'Centro', 'Campinas', 'SP', '13010-110', 'Loja 2'),
('Av. Brasil', '1500', 'Jardim América', 'Goiânia', 'GO', '74230-010', NULL),
('Rua Amazonas', '999', 'Centro', 'Manaus', 'AM', '69010-060', NULL),
('Rua São João', '77', 'Centro', 'Florianópolis', 'SC', '88010-250', 'Casa');


INSERT INTO pratos (nome, preço, descrição) VALUES
('Feijoada Completa', 45.90, 'Feijoada tradicional com acompanhamentos'),
('Filé à Parmegiana', 52.00, 'Filé empanado com molho e queijo'),
('Lasanha Bolonhesa', 39.50, 'Massa fresca com molho bolonhesa'),
('Moqueca de Peixe', 68.00, 'Peixe cozido com leite de coco'),
('Hambúrguer Artesanal', 32.90, 'Carne artesanal e pão brioche'),
('Pizza Margherita', 42.00, 'Molho de tomate, mussarela e manjericão'),
('Risoto de Cogumelos', 47.80, 'Risoto cremoso com cogumelos frescos'),
('Strogonoff de Frango', 36.00, 'Acompanha arroz e batata palha'),
('Salmão Grelhado', 74.90, 'Salmão com legumes salteados'),
('Espaguete Carbonara', 44.00, 'Clássico italiano');

insert into pratos(nome, preço)
values ('Brioche', 7.00);

INSERT INTO clientes (nome, cpf, fk_endereco) VALUES
('João Silva', '12345678901', 1),
('Maria Oliveira', '23456789012', 2),
('Carlos Pereira', '34567890123', 3),
('Ana Souza', '45678901234', 4),
('Lucas Lima', '56789012345', 5),
('Fernanda Rocha', '67890123456', 6),
('Rafael Martins', '78901234567', 7),
('Juliana Costa', '89012345678', 8),
('Bruno Azevedo', '90123456789', 9),
('Patrícia Gomes', '01234567890', 10);


INSERT INTO funcionarios (nome, cargo, endereco, ativo) VALUES
('Marcos Almeida', 'Gerente', 1, true),
('Pedro Santos', 'Garçom', 2, true),
('Luciana Freitas', 'Recepcionista', 3, true),
('André Costa', 'Chefe Cozinha', 4, true),
('Roberto Nunes', 'Cozinheiro', 5, true),
('Camila Pires', 'Garçom', 6, true),
('Daniel Rocha', 'Entregador', 7, true),
('Paula Mendes', 'Garçom', 8, false),
('Fábio Teixeira', 'Cozinheiro', 9, true),
('Renata Lopes', 'Entregador', 10, true);


INSERT INTO mesas (lugares) VALUES
(2), (4), (4), (6), (2),
(8), (4), (6), (2), (10);


INSERT INTO pedidos (fk_cliente, fk_prato, mesa, comanda) VALUES
(1, 1, 1, 1001),
(2, 3, 2, 1002),
(3, 5, 3, 1003),
(4, 2, 4, 1004),
(5, 6, 5, 1005),
(6, 4, 6, 1006),
(7, 7, 7, 1007),
(8, 8, 8, 1008),
(9, 9, 9, 1009),
(10, 10, 10, 1010),
(1, 4, 2, 1011),
(2, 7, 3, 1012),
(3, 2, 1, 1013),
(4, 9, 5, 1014),
(5, 1, 4, 1015),
(6, 10, 6, 1016),
(7, 6, 7, 1017),
(8, 3, 8, 1018),
(9, 8, 9, 1019),
(10, 5, 10, 1020);


INSERT INTO entregas (comanda, fk_endereco, entregue) VALUES
(1001, 1, true),
(1002, 2, true),
(1003, 3, false),
(1004, 4, true),
(1005, 5, false),
(1006, 6, true),
(1007, 7, false),
(1008, 8, true),
(1009, 9, false),
(1010, 10, true);

insert into clientes(nome)
values ('Ariel');

insert into enderecos (rua, numero, bairro, cidade, estado, cep, complemento) values ('Rua Imperador', '45', 'Centro', 'Petrópolis', 'RJ', '25987042', 'A');


select * from clientes;
select nome from clientes;

select nome, bairro, cidade from enderecos left join clientes  on
id_endereco = fk_endereco;
-- Ao não se especificar se usa o inner join, só mostra os resultados que tem a conexão digitada no join
-- Right join irá mostrar o inner join mais o nome da cliente que não tem endereço nesse caso

select nome, bairro, cidade, comanda from clientes left join enderecos on
id_endereco = fk_endereco join entregas on entregas.fk_endereco = id_endereco;

select clientes.nome, data_pedido, comanda, pratos.nome, preço from clientes join pedidos on
id_cliente = id_pedido join pratos on id_prato = fk_prato
-- where preço between 30 and 60
-- where preço >=50
-- where preço not in (36,52,42)
-- where clientes.nome like 'Carlos Pereira'
-- where clientes.nome like 'Carlos%'
-- where clientes.nome like '%Pereira'
-- where clientes.nome like '%ereir%'
-- where lower(clientes.nome) like 'carlos%'
where clientes.nome not like '%a';

--Faturamento total do restaurante
select sum(preço) from pratos join pedidos on fk_prato = id_prato;
select avg(preço) from pratos join pedidos on fk_prato = id_prato;
select min(preço) from pratos join pedidos on fk_prato = id_prato;

-- Quantidade de pedidos por cliente (cliente mais assíduo)
select nome from clientes join pedidos  on id_cliente = fk_cliente;

select nome, count(fk_prato) from clientes join pedidos  on id_cliente = fk_cliente group by nome;

select clientes.nome, max (pratos.preço) from clientes join pedidos on id_cliente = fk_cliente join pratos on fk_prato = id_prato group by clientes.nome;

select clientes.nome, sum (pratos.preço) from clientes join pedidos on id_cliente = fk_cliente join pratos on fk_prato = id_prato group by clientes.nome order by clientes.nome; 

select clientes.nome, sum (pratos.preço) from clientes join pedidos on id_cliente = fk_cliente join pratos on fk_prato = id_prato group by clientes.nome order by sum;

select clientes.nome, sum (pratos.preço) from clientes join pedidos on id_cliente = fk_cliente join pratos on fk_prato = id_prato group by clientes.nome order by sum desc;

select clientes.nome, sum (pratos.preço) as Total_Gasto from clientes
join pedidos on id_cliente = fk_cliente join pratos on fk_prato = id_prato group by clientes.nome order by Total_Gasto desc;

-- Pratos mais vendidos

select nome, count(preço) from pratos join pedidos on fk_prato = id_prato
group by nome, preço order by nome;

create view vw_pratos_mais_vendidos as
select nome, count(preço) from pratos join pedidos on fk_prato = id_prato
group by nome, preço order by nome;

select * from vw_pratos_mais_vendidos;