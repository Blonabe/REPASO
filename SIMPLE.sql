-- 1. Paquetes con descuento mayor al 20%
SELECT * FROM PaqueteTuristico WHERE descuento > 20;

-- 2. Reservas realizadas en el último mes
SELECT * 
FROM Reserva 
WHERE fecha_reserva >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 3. Vuelos con asientos disponibles
SELECT * 
FROM Vuelo 
WHERE asientos_disponibles > 0;

-- 4. Hoteles con valoración mayor a 4 estrellas
SELECT * 
FROM Hotel 
WHERE estrellas > 4;

-- 5. Clientes con más de 5 reservas
SELECT c.nombre, COUNT(r.id_reserva) AS total_reservas
FROM Cliente c
JOIN Reserva r ON c.id_cliente = r.id_cliente
GROUP BY c.id_cliente
HAVING total_reservas > 5;
