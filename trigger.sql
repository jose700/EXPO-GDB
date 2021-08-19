--TRIGGER QUE NO PERMITA AÑADIR MAS CLIENTES CUANDO EL MANTENIMIENTO YA ESTA LLENO;
CREATE OR REPLACE FUNCTION RESULTADO() RETURNS TRIGGER
AS 
$RESULTADO$
	DECLARE
		cantidad int;
		ful int;
BEGIN 
select count (*) into cantidad  from cliente where id_cliente = new.id_cliente;
select mantenimiento.id_cliente into ful from mantenimiento;
	if (cantidad >= ful) then
	RAISE EXCEPTION 'NO SE PUEDE AGREGAR MAS CLIENTES PORQUE ESTA COMPLETO';
	END if;
	RETURN new;
END;
$RESULTADO$
LANGUAGE plpgsql;

create trigger RESULTADO before insert
on cliente for EACH ROW
execute procedure RESULTADO();

--INSERTAMOS DATOS PARA VERIFICAR EN EL TRIGGER
insert into CLIENTE values (20, 'JOSE','CAMPUZANO','Porvenir calle 297 av. 207',0996399073);




















