
drop type setores cascade;
drop table if exists setor;
drop table if exists compras;
drop table if exists historico_materia_prima;
drop table if exists materia_prima;

CREATE TYPE setores AS enum ('Administrativo', 'Produção', 'Limpeza', 'Informática',
'Alimentação', 'Logística','Marketing','Segurança');


CREATE TABLE materia_prima (
	id_materia serial PRIMARY KEY,
	nome varchar(100) NOT NULL,
	estoque int DEFAULT 0 CHECK (estoque >= 0),
	validade date,
	preco NUMERIC(10,2) check(preco > 0),
	codigo_barras char (13)
);



CREATE TABLE setor(
	id_setor serial PRIMARY key,
	nome setores NOT NULL UNIQUE,
	orcamento numeric(10,2),
	setor_ativo boolean DEFAULT TRUE
);


CREATE TABLE compras(
	id_compras serial PRIMARY KEY,
	fk_compras int references materia_prima(id_materia),
	descricao text,
	data_compra timestamp NOT NULL,
	fk_setor INT REFERENCES setor(id_setor),
	quantidade int
);



INSERT INTO materia_prima (nome, estoque, validade, preco, codigo_barras) VALUES
('Aço', 500, '2090-12-31', 150.50, '1234567890123'),
('Canetas', 100, '2026-08-15', 1.50, '1234567890124'),
('Vidro', 300, '2028-01-10', 78.30, '1234567890125'),
('Alumínio', 450, '2027-05-20', 132.00, '1234567890126'),
('Veículos', 4, '2040-11-11', 25000.00, '1234567890127'),
('Cimento', 200, '2027-09-09', 38.50, '1234567890128'),
('Madeira', 300, '2032-03-18', 35.00, '1234567890129'),
('Tinta', 30, '2025-07-22', 89.99, '1234567890130'),
('Parafuso', 2000, '2030-01-01', 1.50, '1234567890131'),
('Papel', 80, '2026-06-06', 30.30, '1234567890132'),
('Uniformes', 60, '2027-10-10', 55.55, '1234567890133'),
('Vassoura', 7, '2028-02-14', 30.90, '1234567890134'),
('Comunicadores', 20, '2027-04-25', 120.00, '1234567890135'),
('Cerâmica', 500, '2029-09-09', 70.70, '1234567890136'),
('Computadores', 15, '2027-12-12', 1800.80, '1234567890137'),
('Sabão', 20, '2027-04-12', 18.80, '1234567890137'),
('Projetor', 5, '2027-04-12', 250.90, '1234567890137'),
('Quadros', 8, '2027-04-12', 100.90, '1234567890137')
;

INSERT INTO setor (nome, orcamento, setor_ativo)
VALUES 
('Administrativo', 40000.00, true),
('Produção', 1000000.00, true),
('Limpeza', 10000.00, true),
('Informática', 40000.00, true),
('Alimentação', 15000.00, true),
('Logística', 170000.00, true),
('Marketing', 35000.00, true),
('Segurança', 20000.00, true);

INSERT INTO compras (fk_compras, descricao, data_compra, fk_setor, quantidade) VALUES
(1,'Compra de Aço' , '2026-01-10 10:00:00', 2, 200), 
(2,'Compra de canetas','2026-01-12 09:30:00', 1, 10),    
(3,'Compra de vidro' , '2026-01-15 11:00:00', 2, 50),   
(4, 'Compra de alumínio' , '2026-01-18 14:20:00', 2, 40),  
(5, 'Compra de veículos' , '2026-01-20 08:45:00', 6, 6),  
(6, 'Compra de cimento' , '2026-01-22 10:15:00', 2, 200),   
(7, 'Compra de madeira' , '2026-01-25 13:00:00', 2, 500),  
(8, 'Compra de tinta' , '2026-01-28 15:30:00', 2, 40),   
(9,  'Compra de parafuso' , '2026-02-01 09:10:00', 2, 1000),   
(10, 'Compra de papel' , '2026-02-03 12:00:00', 1, 20),  
(11, 'Compra de uniformes' ,  '2026-02-05 08:30:00', 8, 100),  
(12,  'Compra de vassoura' , '2026-02-07 10:50:00', 3, 8),   
(13, 'Compra de Comunicadores' ,  '2026-02-10 14:00:00', 8, 7),  
(14, 'Compra de cerâmica' ,  '2026-02-12 16:20:00', 2, 70), 
(15, 'Compra de computadores' ,  '2026-02-15 11:40:00', 4, 10),
(16 , 'Compra de sabão', '2026-02-18 12:50:00', 3, 20),
(17, 'Compra de projetores' , '2026-01-10 14:20:00' , 7, 4),
(18, 'Compra de quadros', '2026-01-05 15:30:00', 7, 6)
;

create table historico_materia_prima(
	id_historico serial primary key,
	estoque_antigo int,
	novo_estoque int,
	fk_historico int references materia_prima(id_materia)
);


CREATE OR REPLACE TRIGGER trg_estoque
AFTER UPDATE ON materia_prima
FOR EACH ROW
EXECUTE FUNCTION historico_estoque();


CREATE OR REPLACE FUNCTION historico_estoque()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO historico_materia_prima
	(estoque_antigo, novo_estoque, fk_historico)
	VALUES
	(OLD.estoque, NEW.estoque, NEW.id_materia);

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

update materia_prima set estoque = 550 where nome = 'Alumínio';



create or replace trigger trg_abastecimento
after insert on compras
for each row
execute function controle_estoque();


create or replace function controle_estoque ()
RETURNS TRIGGER AS $$
BEGIN
	UPDATE materia_prima set estoque = estoque + NEW.quantidade
	WHERE id_materia = NEW.fk_compras;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


INSERT INTO compras (fk_compras, descricao, data_compra, fk_setor, quantidade)
VALUES (7, 'Compra de madeira', '2026-03-04 12:00:00', 2, 20);

select descricao, s.nome from compras c join setor s
on fk_setor = id_setor;

select h.estoque_antigo, h.novo_estoque, m.nome
from historico_materia_prima h join materia_prima m
on fk_historico = id_materia;

select sum((mp.preco) * (mp.estoque)) as "Valor total de insumos em estoque", s.nome from materia_prima mp 
join compras c on fk_compras = id_materia join
setor s on fk_setor = id_setor group by s.nome order by s.nome;

select s.nome, count(c.fk_setor) as "Nº de compras por setor" from setor s join compras c 
on id_setor = fk_setor group by s.nome order by s.nome;

create view compras_X_orçamento as
select sum((c.quantidade) * (mp.preco)) as "Valor total de compras", s.nome, s.orcamento from setor s join compras c
on fk_setor = id_setor join materia_prima mp on fk_compras = id_materia
group by s.nome, s.orcamento order by s.nome;

select * from compras_X_orçamento;

create user administrador with password '1234';
create user almoxarife with password '4321';

grant select on materia_prima to almoxarife;
grant select on setor, compras to administrador;

select * from materia_prima;
select * from setor;
select * from compras;

