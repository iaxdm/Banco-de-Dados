create table alunos(
	id_alunos serial primary key,
	nome text not null,
	serie varchar(30) not null,
	data_nascimento date check (data_nascimento < current_date)
);

create table livros(
	id_livros serial primary key,
	titulo varchar(100) not null,
	nome_autor text,
	ano_publicacao int,
	tema_livro varchar(100)
);

create table emprestimos(
	id_emprestimo serial primary key,
	emprestado_para int not null references alunos (id_alunos),
	livro_emprestado int not null references livros (id_livros),
	data_emprestimo date not null,
	previsao_devolucao date,
	data_devolucao date
);


insert into alunos (nome, serie, data_nascimento)
values('João', 'Primeiro ano Ensino médio', '23-11-2010'), ('Maria', 'Oitavo ano', '01-04-2013'), ('Pedro', 'Nono ano', '01-07-2011'),
('Vanessa', 'Primeiro ano Ensino médio', '18-10-2015'), ('Felipe', 'Quarto ano', '17-07-2015');

insert into livros (titulo, tema_livro)
values('A Bela e a Fera' , 'infantil'), ('Geografia' , 'Escolar'), ('O monstro', 'Terror'), ('O vale encantado', 'Ficção Científica'),
('Vilões do mundo', 'Ação');

insert into emprestimos (emprestado_para, livro_emprestado, data_emprestimo)
values(1, 3, '9-12-2025'), (1, 4, '8-12-2025'), (2, 4, '7-12-2025'), (2, 5, '7-12-2025'), (3, 3, '2-12-2025'), (3, 1, '1-12-2025'),
(4, 2, '9-12-2025'), (4, 1, '29-11-2025'), (5, 5, '30-11-2025'), (5, 4, '03-12-2025');

select * from alunos;
select * from livros;
select * from emprestimos;

select * from emprestimos where emprestado_para = 3;
select * from livros where tema_livro = 'Terror';

alter table emprestimos drop column data_devolucao;
alter table emprestimos add column data_devolucao date default '31-12-2025';

select * from alunos where data_nascimento between '01-01-2010' and '12-12-2012';
select * from livros where tema_livro = 'Terror' or tema_livro = 'infantil';
select * from livros where titulo like '%ra%';
select * from livros where id_livros in (1, 3, 5);
select * from livros where id_livros not in (1, 3, 5);

alter table livros add column editora varchar(50) not null default '';
alter table livros alter column editora type varchar(100);

update livros set titulo = 'infantil' where titulo = 'Ficção Científica';

drop table livros;
drop table emprestimos;
drop table alunos;

