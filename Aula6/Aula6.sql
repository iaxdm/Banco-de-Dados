drop user estagiario; --deletar um usuário

create user estagiario with password 'senha123'; -- adicionar um usuário

grant select on produtos to estagiario; -- dá permissão ao usuário para certos comandos

select * from produtos;
select * from clientes;