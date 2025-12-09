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
