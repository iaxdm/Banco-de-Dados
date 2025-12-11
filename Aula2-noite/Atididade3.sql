drop table if exists livros;
create table livros (
id SERIAL primary key,
titulo varchar(100) not null,
autor varchar(80),
ano_publicacao integer,
preco numeric(4,2),
estoque integer default 0
);

insert into livros (titulo, autor, ano_publicacao, preco, estoque) values
('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 45.90, 12),
('1984', 'George Orwell', 1949, 35.50, 8),
('Dom Casmurro', 'Machado de Assis', 1899, 28.00, 15),
('Harry Potter', 'J.K. Rowling', 1997, 42.00, 20),
('A Revolução dos Bichos', 'George Orwell', 1945, 30.00, 10);

 1. Adicione uma coluna chamada editora que aceita até 50 caracteres.
 2. Adicione uma coluna chamada categoria que aceita até 25 caracteres.
 3. Modifique a coluna preco para aceitar até 10 dígitos no total, mantendo 2 casas decimais.
 4. Adicione uma coluna chamada isbn que aceita até 20 caracteres.
 5. Remova a coluna isbn (descobrimos que não vamos usar).
 6. Renomeie a coluna ano_publicacao para ano.
 7. Adicione uma coluna desconto do tipo NUMERIC(5,2) com valor padrão 0.00.
 8. Atualize o livro "1984" definindo a editora como "Companhia das Letras" e a categoria como "Ficção Científica".
 9. Atualize todos os livros do autor "George Orwell" para ter um desconto de 10.00.
 10. Atualize o preço do livro "Dom Casmurro" para 32.50.
 11. Defina a categoria "Fantasia" para os livros "O Senhor dos Anéis" e "Harry Potter".
 12. Aumente o estoque de todos os livros em 5 unidades.
 13. Atualize a editora de "Dom Casmurro" para "Nova Fronteira" e a categoria para "Romance".
 14. Delete o livro com id = 3 (Dom Casmurro).
 15. Delete todos os livros que têm estoque menor que 10 unidades.
 16. Delete o livro "A Revolução dos Bichos".
 
alter table livros add column editora varchar(50);
alter table livros add column categoria varchar(25);
alter table livros alter column preco type numeric(8,2);
alter table livros add column isbn varchar(20);
alter table livros drop column isbn;
alter table livros rename ano_publicacao to ano;
alter table livros add column desconto numeric (5,2) default '0.00';
update livros set editora = 'Companhia das Letras', categoria = 'Ficção científica' where titulo ='1984';
update livros set desconto ='10.00' where autor = 'George Orwell';
update livros set preco ='32.50' where titulo = 'Dom Casmurro';
update livros set categoria = 'Fantasia' where titulo = 'O Senhor dos Anéis' or titulo = 'Harry Potter';
update livros set estoque = estoque+5;
update livros set editora = 'Nova Fronteira', categoria = 'Romance' where titulo = 'Dom Casmurro';
delete from livros where id = 3;
delete from livros where estoque < 10;
delete from livros where titulo = 'A Revolução dos Bichos';


