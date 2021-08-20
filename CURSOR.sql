--CURSOR PARA SABER EL TOTAL DE LOS CLIENTES
--DE FORMA ORDENADA
do $$
declare 
contar int =0;
total Record;
--INICIO DEL CURSOR
totalclientes Cursor for select * from "cliente" order by "id_cliente";
begin
for total in totalclientes loop
contar = contar+count(total.id_cliente);
Raise Notice 'id_cliente: %, cliente_nombres: %, clientes_apellidos: %,',
total.id_cliente,total.cliente_nombres, total.clientes_apellidos;
end loop;
end $$


Language 'plpgsql';

