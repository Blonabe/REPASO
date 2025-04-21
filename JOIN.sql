-- 1. Paquetes con su hotel y vuelo incluido
SELECT 
    p.id_paquete,
    p.destino,
    h.nombre AS hotel,
    v.aerolinea AS vuelo
FROM PaqueteTuristico p
JOIN Hotel h ON p.id_hotel = h.id_hotel
JOIN Vuelo v ON p.id_vuelo = v.id_vuelo;

-- 2. Reservas completas con información de cliente y paquete
SELECT 
    r.id_reserva,
    c.nombre AS cliente,
    p.destino,
    r.fecha_reserva,
    r.total_pago,
    r.estado
FROM Reserva r
JOIN Cliente c ON r.id_cliente = c.id_cliente
JOIN PaqueteTuristico p ON r.id_paquete = p.id_paquete;

-- 3. Vuelos con información de aerolínea y aeropuertos
SELECT 
    v.id_vuelo,
    v.aerolinea,
    v.origen,
    v.destino,
    v.fecha_salida,
    pr.nombre AS proveedor
FROM Vuelo v
JOIN Proveedor pr ON v.id_proveedor = pr.id_proveedor;

-- 4. Promociones aplicables a paquetes específicos
SELECT 
    pr.descripcion,
    pr.descuento,
    pr.temporada,
    pt.destino
FROM Promocion pr
JOIN PaqueteTuristico pt ON pr.id_paquete = pt.id_paquete;

-- 5. Habitaciones reservadas con información de hotel y cliente (adaptado: paquetes reservados)
SELECT 
    r.id_reserva,
    c.nombre AS cliente,
    h.nombre AS hotel,
    p.destino,
    r.fecha_reserva
FROM Reserva r
JOIN Cliente c ON r.id_cliente = c.id_cliente
JOIN PaqueteTuristico p ON r.id_paquete = p.id_paquete
JOIN Hotel h ON p.id_hotel = h.id_hotel;
