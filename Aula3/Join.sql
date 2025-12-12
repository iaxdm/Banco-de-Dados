create table clientes(
	id_cliente serial primary key,
	nome varchar(100) not null,
	data_nascimento date,
	cpf char(11) not null unique,
	ativo boolean default true
);

create type status as enum ('PAGO', 'PENDENTE', 'ENTREGUE', 'A CAMINHO', 'EM PREPARO');

create table pedidos(
	id_pedido serial primary key,
	data_pedido timestamp not null default current_timestamp,
	valor numeric(7,2) not null check(valor>0),
	status status default 'PENDENTE',
	fk_cliente int references clientes(id_cliente)
);

insert into clientes (nome, cpf, ativo)
values('Marinaldo', '11122233310', true),
('Rosicleide', '22233344411', true),
('Amarildo', '66677788891', false);

insert into clientes (nome, cpf, data_nascimento)
values('Ciclano', '12345678915', current_timestamp);

insert into pedidos (data_pedido, valor, status, fk_cliente)
values (current_timestamp, 425.39, 'PAGO', 1),
('01/12/2025', 34.98, 'EM PREPARO', 3);

insert into pedidos (valor)
values (789.45);

create table produtos(
	id_produto serial primary key,
	nome varchar(50) not null,
	estoque int not null
);

alter table pedidos add column id_produto int references produtos(id_produto);

insert into produtos (nome, estoque)
values ('Produto X', 10), ('Produto Z', 25);

update pedidos set id_produto = 1 where fk_cliente =1;
update pedidos set id_produto = 2 where fk_cliente =3;

select fk_cliente, c.nome, data_pedido, pr.nome from clientes c
join pedidos pe on fk_cliente = id_cliente
join produtos pr on pe.id_produto = pr.id_produto;

select fk_cliente, nome, data_pedido from pedidos
join clientes on fk_cliente = id_cliente;  --inner join (join padrão, mostra apenas as colunas que estão associadas.  fk_cliente = id_cliente)

select * from pedidos join clientes on fk_cliente = id_cliente ; --(inner join com
-- todas as colunas das tabelas pedidos e clientes que estão associadas.  fk_cliente = id_cliente)

select fk_cliente, nome, data_pedido from pedidos
left join clientes on fk_cliente = id_cliente; --left join (prioriza o que está na tabela da esquerda, nesse caso itens da tabela pedidos mesmo que não tenham clientes)

select fk_cliente, nome, data_pedido from pedidos
right join clientes on fk_cliente = id_cliente;--right join (prioriza o que está na tabela da direita, nesse caso todos os clientes mesmo que não tenham pedidos)

select fk_cliente, nome, data_pedido from pedidos full join clientes on fk_cliente = id_cliente; --full join

