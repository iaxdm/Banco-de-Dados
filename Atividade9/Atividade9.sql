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

create or replace trigger trg_produto_vendido
after insert on vendas
for each row
execute function diminuir_estoque ();

create or replace function diminuir_estoque ()
returns  trigger as $$
declare
	estoque_produto int := (select estoque from produtos
	where id = new.produto_vendido);
begin
	if(new.quantidade <= estoque_produto) then
		update produtos
		set estoque = estoque - new.quantidade
		where id = new.produto_vendido;
	else
		raise Exception 'Estoque insuficiente';
	end if;
	return new;
end
$$ language plpgsql

insert into vendas(produto_vendido, quantidade)
values(1,6);

-- Cancelando a venda e retornando a quantidade do produto ao estoque

create or replace trigger trg_cancelar_venda
after delete on vendas
for each row
execute function cancelar_venda();

create or replace function cancelar_venda()
returns trigger as $$
begin
	update produtos
	set estoque = estoque + old.quantidade
	where id = old.produto_vendido;
	return new;
end
$$ language plpgsql

delete from vendas where id = 2;