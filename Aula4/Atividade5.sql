create type plano as enum ('Mensal', 'Trimestral' , 'Anual');

create table matriculas(
	id_matricula serial primary key,
	nome_aluno varchar(100) not null,
	plano plano not null,
	valor_plano numeric (6,2) not null check(valor_plano >0),
	instrutor varchar (100) not null
);

insert into matriculas(nome_aluno, plano, valor_plano, instrutor)
values('Igor', 'Anual', 950.00, 'Arnaldo'),
('Maria', 'Anual', 950.00, 'Aderbal'),
('Jorge', 'Mensal', 100.00, 'Monique'),
('Carlos', 'Trimestral', 85.00, 'Monique'),
('Jaqueline', 'Mensal', 100.00, 'Diogo');

select count(id_matricula) from matriculas;
select sum(valor_plano) from matriculas;
select avg (valor_plano) from matriculas;
select plano, count(plano) as total from matriculas group by plano;
select concat('O aluno ',nome_aluno, ' contratou o plano ', plano, ' com o instrutor ', instrutor) from matriculas;
select instrutor, sum(valor_plano) as total_arrecadado from matriculas group by instrutor; 
