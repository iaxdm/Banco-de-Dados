create table pessoas(
	id_pessoa serial primary key,
	nome varchar(100) not null,
	idade integer check (idade >= 16),
	ativo bool default true,
	cpf char(11),
	altura numeric(3,2)
);

insert into pessoas(nome) values('Igor');
insert into pessoas(nome, idade, ativo, cpf, altura) values ('Maria', 19, false, 12345678911, 9.99);

create table funcionarios(
	id_funcionario serial primary key,
	matricula int not null,
	cod_pessoa int not null references pessoas (id_pessoa)
);
