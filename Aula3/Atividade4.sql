*/
1. Crie as tabelas:
* Produtos
* Fornecedores
* Vendas
* Usuários

2. Insira alguns dados para cada tabela, pelo menos 5 dados em cada tabela.

3. Crie as seguintes consultas:
a) Listar todos os dados de todos os produtos;
b) Listar produtos de um determinado fornecedor;
c) Listar produtos entre uma intervalo de preços;
d) Listar o nome do produto e o nome do fornecedor de cada produto;
e) Listar o nome do usuário, o nome do produto e a data que esse usuário  comprou o produto;
f) Listar o nome do usuário  e as datas em que ele comprou algo e filtrar por um usuário específico;
g) Listar o nome dos usuários que não tiveram nenhuma compra;
h) Listar o identificador e as datas das vendas que não tiveram um usuário;


drop table produtos;
drop table fornecedores ;
drop table vendas;
drop table usuarios;

create table produtos(
	id_produto serial primary key,
	nome varchar(100) not null,
	valor numeric (7,2) not null,
	estoque int default (5),
	fk_fornecedor int not null references fornecedores (id_fornecedor) --Chave estrangeira sempre tem a relação 1 para N ou N para 1, nesse caso 1 produto tem 1 fornecedor
																			  --e uma fornecedor pode ter vários produtos
);

create table fornecedores(
	id_fornecedor serial primary key,
	nome varchar(100) not null,
	local varchar (50),
	categoria varchar(50)
);

create table vendas(
	id_venda serial primary key,
	codigo_produto int not null references produtos(id_produto),
	data_venda timestamp default now(),
	tipo_pagamento varchar(20),
	fk_usuario int not null references usuarios(id_usuario)
);

create table usuarios(
	id_usuario serial primary key,
	nome varchar(100) not null,
	cpf char (11) unique not null,
	idade int check(idade >18)
);

insert into fornecedores (nome, local, categoria)
values('fornecedor A', 'Rio de Janeiro', 'madeira'),
('fornecedor B', 'Manaus', 'borracha'),
('fornecedor C', 'São Paulo', 'calçados'),
('fornecedor D', 'Porto Alegre' , 'veículos'),
('fornecedor E', 'Belo Horizonte' , 'carne');

insert into produtos (nome, valor, fk_fornecedor)
values('Tábua de madeira', 12.50, 1),
('pneu' , 150.90 , 2),
('tênis', 185.90, 3),
('fusca', 49999.00, 4),
('picanha', 79.90, 5);

insert into vendas (codigo_produto , tipo_pagamento, fk_usuario)
values(5, 'pix', 3),
(1, 'cartão de crédito', 5),
(4, 'parcelamento', 2),
(3, 'dinheiro', 5),
(2, 'pix', 1);

insert into usuarios (nome, cpf, idade)
values('Marinalva', '55588899944', 20),
('Ana', '99988877744', 30),
('Jorge', '22233311155' , 19),
('Berenice', '99911133322', 21),
('Manoel', '22233366611', 45);

insert into produtos (nome, valor, fk_fornecedor)
values('chinelo', 30.50, 3);

insert into produtos (nome, valor, fk_fornecedor)
values('frango assado', 22.50, 5);

SELECT categoria, count(categoria), sum(valor), avg(valor),
concat('O valor total é ', sum(valor)),
max(valor), min(valor), trim(' teste '), rtrim(' teste '), ltrim(' teste teste ')
FROM fornecedores
GROUP BY categoria
;

select * from produtos;
select * from fornecedores where nome = 'fornecedor E';
select * from produtos where valor between 60.00 and 200.00;
select produtos.nome, fornecedores.nome from produtos join fornecedores on fk_fornecedor = id_fornecedor;
select u.nome, p.nome, v.data_venda from usuarios u join vendas v on id_usuario = fk_usuario join produtos p on id_produto = codigo_produto;
select u.nome, v.data_venda from usuarios u join vendas v on id_usuario = fk_usuario where nome = 'Jorge';
select nome from usuarios left join vendas on id_usuario = fk_usuario where id_venda is null;
select vendas.id_venda, vendas.data_venda from vendas right join usuarios u on id_usuario = fk_usuario where nome is null;