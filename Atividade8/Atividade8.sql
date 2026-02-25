--1--

create type setores as enum ('producao', 'rh', 'gerencia');

create table endereco(
	id_endereco serial primary key,
	rua varchar (100) not null,
	numero varchar(10) default 'S/N',
	bairro varchar(100),
	cidade varchar (100),
	estado char (2)
);

create table setor(
	id_setor serial primary key,
	nome setores not null
);

create table funcionarios(
	ID serial primary key,
	nome varchar (100) not null,
	matricula int not null unique,
	fk_endereco int references endereco (id_endereco),
	fk_setor int references setor (id_setor)
);

--2--

insert into endereco (rua, numero, bairro, cidade, estado)
values ('rua A', '123', 'Mosela', 'Petrópolis', 'RJ'),
('rua B', '321', 'Paraíso', 'Rio de Janeiro', 'RJ'),
('rua C', '456', 'Centro', 'São Paulo', 'SP');

insert into setor (nome)
values('producao'),('rh'),('gerencia');

insert into funcionarios (nome, matricula, fk_endereco, fk_setor)
values('Maria', 12345, 2, 3),
('Marcos', 45678, 1, 2),
('Joaquim', 78315, 3, 1);

--3--

create view relatorio_funcionarios as
select f.nome as nome_funcionario, bairro, s.nome
from endereco e join funcionarios f on id_endereco = fk_endereco
join setor s on fk_setor = id_setor;

select *from relatorio_funcionarios;

--4--

create view setor_funcionarios as
select f.nome as "Nome do funcioários", s.nome as "Nome do setor" from funcionarios f join setor s on fk_setor = id_setor;

select * from setor_funcionarios;

--5--

create user estagiario with password 'es123';
grant select on setor to estagiario;
create user gerente with password 'ge123';
grant select, update on funcionarios to gerente;

--7--

select * from endereco e;
select * from setor s; 
select * from funcionarios f ;

--8--

update funcionarios set matricula = 53265 where matricula = 12345;
grant create on schema public to gerente;
create table produtos (
id_produto serial primary key
);
drop table if exists produtos;