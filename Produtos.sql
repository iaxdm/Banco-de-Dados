create table produtos(
	id_produto serial primary key,
	nome varchar(100) not null,
	descricao text,
	codigo_barras varchar(30) unique not null,
	preco numeric (4,2) not null check(preco>=5),
	estoque int default 0 not null check (estoque >=0),
	ativo bool default true not null,
	criado_em timestamp default now() not null
);
	 
alter table produtos alter column "criado_em" type timestamp;

insert into produtos (nome, descricao, codigo_barras, preco, estoque) 
values('Arroz', 'alimentício', 13649758583, 17.50, 50),
	  ('Cimento', 'construção', 45678932167, 36.70, 100),
	  ('Martelo', 'ferramentas', 1239873675, 25.00, 4),
	  ('Tênis', 'calçado', 45635715932, 99.90, 50),
	  ('Feijão', 'alimentício', 3693541279, 19.00, 60);