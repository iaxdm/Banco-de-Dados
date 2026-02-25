create table produtos(
	id serial primary key,
	nome varchar (50) not null,
	estoque int not null default 0,
	preco numeric (10,2) not null check (preco >=0)
);

create table vendas (
	id serial primary key,
	data_venda timestamp not null default now(),
	produto_vendido int not null references produtos(id),
	quantidade int not null check (quantidade>0)
);


create table historico_produtos(
	id serial primary key,
	data_mudanca timestamp default now(),
	preco_antigo numeric (10,2) not null,
	preco_novo numeric (10,2) not null,
	id_produto int not null
);

insert into produtos (nome, estoque, preco)
values('Mouse', 10, 69.90);

-- Automatizar historico de mudança do preço dos produtos

create or replace trigger trg_mudnaca_preco
after update on produtos
for each row
execute function inserir_historico_preco();

create or replace function inserir_historico_preco()
returns trigger as $$
begin
	if (old.preco != new.preco) then 
		insert into historico_produtos(preco_antigo, preco_novo, id_produto)
		values(old.preco , new.preco, new.id);
	end if;
	return new;
end
$$ language plpgsql;

update produtos
set preco = 89.90
where id = 1;

update produtos
set nome = 'Mouse Gamer Boladão'
where id = 1;