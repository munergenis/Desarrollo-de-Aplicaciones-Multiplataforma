use jardineria;
select * from clientes;
select * from oficinas;
select nombre, apellido1, apellido2 from empleados;
select fechapago, cantidad from pagos;
select concat(nombre, ' ', apellido1, ' ', apellido2) from empleados;
select nombre, precioventa from productos;
select nombre from empleados where apellido1 like '%LOPEZ%';
select * from empleados where concat(nombre, ' ', apellido1, ' ', apellido1) like '%CARLOS SORIA BALE%';
select * from clientes where nombrecontacto like 'LUIS' and apellidocontacto <>'JIMENEZ';
select nombre, precioventa from productos where cantidadenstock < 100;
select * from productos where precioventa = 5;
select * from productos where gama = 'HERRAMIENTAS' and precioventa < 2.5 and proveedor like 'C%';
select * from productos where precioventa % 2 = 0;
select * from productos where precioventa < 1 or precioventa > 2;
select * from productos where gama in ('HERRAMIENTAS', 'ORNAMENTALES', 'FRUTALES');
select * from pedidos where fechapedido between '2008-04-03' and '2009-05-20';
select * from productos where descripcion like '%vulgar%';
select * from productos where descripcion like '%vulgar%' and precioventa < 2;
select * from productos where precioventa between 1 and 4.34;
select * from productos where round(precioventa) < 2;
select * from productos where nombre like '%E%E%';
select * from productos where length(nombre) = 7;
select * from empleados where nombre like '%A' and apellido1 like '%A';
select * from clientes where nombrecliente not like '%A%';
select * from productos where precioventa not in (3, 4); # 25 y 26
select * from pagos where day(fechapago) = 1;
select year(fechapago), cantidad from pagos where cantidad < 300; 
select * from pagos where fechapago between '2005-08-01' and '2005-08-31';
select * from pagos where not (fechapago < '2005-08-01' or not fechapago < '2005-09-01');
select * from empleados where codigojefe is null;
select * from empleados where codigojefe is not null;
select * from clientes where region is null;
select distinct ciudad from clientes where lineadireccion2 is null;
select * from clientes where region like 'Madrid';
select * from clientes where ciudad like 'Madrid';
select * from clientes order by nombrecliente;
select * from clientes where ciudad like 'Madrid' order by telefono;
select * from clientes where region like 'Madrid' and limitecredito > 1000 order by telefono;
select * from clientes order by codigopostal, limitecredito desc;
select * from empleados order by extension;
select * from oficinas where lineadireccion2 is null;
select * from oficinas where length(lineadireccion2) = 0;
select * from productos where cantidadenstock = 0;
-- 45: Conozco el stock de todos ya que el campo cantidad stock está marcado como not null constraint que indica que no se puede insertar un producto sin conocer su stock
select * from productos order by cantidadenstock desc limit 10;
select * from productos order by (Precioventa - precioproveedor) desc limit 20;
select * from pedidos where fechaentrega is null and estado like 'pendiente';
select * from pedidos where fechaentrega = fechaesperada;
select * from pedidos where fechaentrega is not null and fechaentrega < fechaesperada;
select * from pedidos where fechaentrega is not null and  fechaesperada > adddate(fechapedido, 3);
select * from  pedidos order by fechapedido desc limit 5;
select * from  pedidos where year(fechapedido) = 2009 order by fechapedido limit 20;