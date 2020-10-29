USE tienda;

### RETO 1 ###
DESCRIBE articulo;

#qué artículos incluyen Pasta?
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';

#qué artículos incluyen Cannelloni?
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';

#nombres separados por un guión
SELECT * FROM articulo WHERE nombre LIKE '%-%';

#puestos que incluyen Designer
DESCRIBE puesto;
SELECT * FROM puesto WHERE nombre LIKE '%Designer%';

#puestos que incluyan Developer
SELECT * FROM puesto WHERE nombre LIKE '%Developer%';

### RETO 2 ###
#¿Cuál es el promedio de salario de los puestos?
SELECT round(avg(salario),2) AS promedio_salarios FROM puesto;

#¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(nombre) AS articulos_Pasta FROM articulo WHERE nombre LIKE '%Pasta%';

#¿Cuál es el salario mínimo y máximo?
SELECT min(salario) AS menor_salario, max(salario) AS mayor_salario FROM puesto;

#¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT sum(salario) AS ultimios_puestos FROM puesto WHERE id_puesto > 995;

### RETO 3 ###
#¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) AS 'Conteo' FROM puesto GROUP BY nombre;

#¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) AS 'Suma Salario' FROM puesto GROUP BY nombre;

#¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(*) FROM venta GROUP BY id_empleado;

#¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) FROM venta GROUP BY id_articulo;