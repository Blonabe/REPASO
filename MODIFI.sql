-- 1. Actualizar el número de asientos disponibles en un vuelo
UPDATE Vuelo
SET asientos_disponibles = 35
WHERE id_vuelo = 1;

-- 2. Actualizar el estado de una reserva a 'confirmada'
UPDATE Reserva
SET estado = 'confirmada'
WHERE id_reserva = 2;

-- 3. Aumentar el descuento de un paquete turístico
UPDATE PaqueteTuristico
SET descuento = 20.00
WHERE id_paquete = 3;

-- 4. Cambiar el rol de un usuario de agente a admin
UPDATE Usuario
SET rol = 'admin'
WHERE email = 'agente1@viajes.com';

-- 5. Cambiar la ubicación de un hotel
UPDATE Hotel
SET ubicacion = 'Barranquilla'
WHERE id_hotel = 2;
