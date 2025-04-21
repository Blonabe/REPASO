-- 1. Paquetes con precio superior al promedio
SELECT * 
FROM PaqueteTuristico 
WHERE precio_base > (
    SELECT AVG(precio_base) FROM PaqueteTuristico
);

-- 2. Clientes que no han viajado en el último año
SELECT * 
FROM Cliente 
WHERE id_cliente NOT IN (
    SELECT id_cliente 
    FROM Reserva 
    WHERE fecha_reserva >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

-- 3. Vuelos con ocupación superior al 80% (suponiendo 100 asientos)
SELECT * 
FROM Vuelo 
WHERE asientos_disponibles < 20;

-- 4. Hoteles con todas sus habitaciones reservadas en una fecha (adaptado: hoteles con 0 disponibilidad = no aplicable sin habitaciones)
-- Adaptado a paquetes sin disponibilidad de vuelos
SELECT h.*
FROM Hotel h
WHERE h.id_hotel IN (
    SELECT p.id_hotel
    FROM PaqueteTuristico p
    JOIN Vuelo v ON p.id_vuelo = v.id_vuelo
    WHERE v.asientos_disponibles = 0
);

-- 5. Promociones que no han sido aplicadas (paquetes sin reservas)
SELECT * 
FROM Promocion 
WHERE id_paquete NOT IN (
    SELECT id_paquete 
    FROM Reserva
);
