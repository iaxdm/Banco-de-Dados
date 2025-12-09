create table pessoas2(
	id_pessoa serial primary key,
	nome varchar(100) not null,
	email varchar(100) unique,
	data_nascimento date,
	altura int check (altura >0),
	id_endereco int references enderecos2(id_endereco),
	criado_em timestamp default now()
);

create table enderecos2(
	id_endereco serial primary key,
	cep char(8) not null,
	rua varchar(100),
	numero varchar(10) default 'S/N',
	bairo varchar (100),
	complemento text,
	cidade text not null,
	estado text not null
);

alter table enderecos2 drop column bairo;
alter table enderecos2 add column bairro varchar(100);

insert into enderecos2 (cep, rua, bairro, cidade, estado)
values ('25675042', 'Vila São Judas Tadeu', 'Mosela', 'Petrópolis' , 'RJ');

insert into enderecos2 (cep, rua, bairro, cidade, estado, numero, complemento)
values ('25074987', 'Rua Flamengo', 'Bairro do Urubu', 'Urubulândia', 'Marte', '324', 'perto do céu');

insert into pessoas2 (nome, id_endereco)
values('Igor', '1');

select * from pessoas2;
select nome, criado_em from pessoas2;