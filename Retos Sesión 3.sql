### RETO 1 ###
# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
USE tienda;
SELECT nombre
FROM empleado
WHERE id_puesto in
(SELECT id_puesto
FROM puesto
WHERE salario > 10000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total), max(total)
	FROM (SELECT clave, id_empleado, COUNT(*) AS total
		FROM venta
        GROUP BY clave, id_empleado) AS subconsulta
	GROUP BY id_empleado;
    
SELECT clave, id_empleado, COUNT(*) AS total
		FROM venta
        GROUP BY clave, id_empleado;
        
#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave
	FROM venta
	WHERE id_articulo in
		(SELECT id_articulo
		FROM articulo
		WHERE precio > 5000);
        
### RETO 2 ###
#¿Cuál es el nombre de los empleados que realizaron cada venta?
DESCRIBE venta;
SHOW KEYS FROM venta;
SELECT clave, nombre, apellido_paterno
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado;

#¿Cuál es el nombre de los artículos que se han vendido?
SELECT nombre, id_venta, clave
FROM venta as v
JOIN articulo as a
ON v.id_articulo = a.id_articulo;

#¿Cuál es el total de cada venta?
SELECT clave, sum(precio) as TotalVenta
FROM articulo as a
JOIN venta as v
ON a.id_articulo = v.id_articulo
GROUP BY clave;

### RETO 3 ###

# Obtener el puesto de un empleado.
CREATE VIEW puestoEmpleado AS
(SELECT concat(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) AS Empleado, p.nombre
FROM empleado AS e
JOIN puesto AS p
ON e.id_puesto = p.id_puesto);

SELECT *
FROM puestoEmpleado;

# Saber qué artículos ha vendido cada empleado.
CREATE VIEW articuloEmpleado AS
(SELECT concat(e.nombre,' ',e.apellido_paterno,' ',e.apellido_materno) AS Empleado, a.nombre AS Artículo
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado
JOIN articulo AS a
ON v.id_articulo = v.id_articulo
ORDER BY v.clave);

SELECT *
FROM articuloEmpleado;

#Saber qué puesto ha tenido más ventas.
CREATE VIEW ventasPuesto AS
(SELECT p.nombre AS Puesto, count(*) AS Ventas
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado
JOIN puesto AS p
ON e.id_puesto = p.id_puesto
GROUP BY p.nombre
ORDER BY Ventas DESC);

SELECT *
FROM ventasPuesto
LIMIT 1;
