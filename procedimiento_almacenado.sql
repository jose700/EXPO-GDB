--PROCEDIMIENTO ALMACENADO QUE MUESTRE LA CANTIDAD DE CLIENTES
--POR MEDIO DE SU ID
create or replace function cantidad_total(
IN clientesnombre varchar,
	OUT total_cliente varchar

)
as $BODY$
begin 
	select count(distinct venta.id_cliente) into total_cliente
	from venta
	inner join cliente on cliente.id_cliente = venta.id_cliente
	where cliente_nombres = clientesnombre;
	
end
$BODY$
language plpgsql;
select * from cantidad_total('Alexander Jared');




