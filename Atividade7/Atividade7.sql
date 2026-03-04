
CREATE TYPE setores AS enum ('Administrativo', 'Produção', 'Limpeza', 'Informática',
'Aliemntação', 'Logística','Marketing','Segurança');





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
	valor NUMERIC(10,2) check(valor > 0),
	data_compra timestamp NOT NULL,
	fk_setor INT REFERENCES setor(id_setor)
);


CREATE TABLE gastos(
	id_gastos serial PRIMARY KEY,
	fk_setor int REFERENCES setor(id_setor),
	descricao text,
	fk_compra INT REFERENCES compras(id_compras)
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
('Quadros', 8, '2027-04-12', 100.90, '1234567890137');

insert into setor (nome, orcamento,setor_ativo)
values ('Administrativo', 20000.00, true), ('Produção', 100000.00, true),
('Limpeza', 7000.00, true), ('Informática', 30000.00, true), ('Alimentação', 15000.00, true),
('Logística', 17000.00, true), ('Marketing', 25000.00, true), ('Segurança', 7000, true)

INSERT INTO compras (fk_compras, valor, data_compra, fk_setor) VALUES
(1, 15050.00, '2026-01-10 10:00:00', 2), 
(2, 150.00, '2026-01-12 09:30:00', 1),    
(3, 7800.00, '2026-01-15 11:00:00', 6),   
(4, 13200.00, '2026-01-18 14:20:00', 2),  
(5, 50000.00, '2026-01-20 08:45:00', 6),  
(6, 7700.00, '2026-01-22 10:15:00', 2),   
(7, 10500.00, '2026-01-25 13:00:00', 2),  
(8, 2700.00, '2026-01-28 15:30:00', 4),   
(9, 3000.00, '2026-02-01 09:10:00', 1),   
(10, 2424.00, '2026-02-03 12:00:00', 1),  
(11, 3330.00, '2026-02-05 08:30:00', 5),  
(12, 216.30, '2026-02-07 10:50:00', 3),   
(13, 2400.00, '2026-02-10 14:00:00', 4),  
(14, 35350.00, '2026-02-12 16:20:00', 7), 
(15, 27012.00, '2026-02-15 11:40:00', 4);

INSERT INTO gastos (fk_setor, descricao, fk_compra) VALUES
(1, 'Pagamento de contas de água e luz', NULL),            
(1, 'Compra de canetas', 2),                               
(2, 'Manutenção de máquinas', NULL),                       
(2, 'Compra de Aço', 1),                                   
(2, 'Compra de Alumínio', 4),                              
(3, 'Serviço de limpeza predial', NULL),                   
(3, 'Compra de Vassoura', 12),                             
(4, 'Atualização de software', NULL),                      
(4, 'Compra de Computadores', 15),                          
(4, 'Compra de Comunicadores', 13),                         
(5, 'Serviço de fornecimento de alimentação', NULL),       
(5, 'Compra de Uniformes', 11),                             
(6, 'Transporte de materiais', NULL),                      
(6, 'Compra de Vidro', 3),                                 
(6, 'Compra de Veículos', 5),                              
(7, 'Campanha de Marketing digital', NULL);               



