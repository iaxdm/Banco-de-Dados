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

create table produtos(
	id_produto serial primary key,
	nome varchar(100) not null,
	valor numeric (7,2),
	estoque int default (5),
	
);

create table fornecedores(
	id_fornecedor serial primary key,
	nome varchar(100) not null,
	cnpj char(14) unique,
	local varchar (50),
	
);

create table vendas