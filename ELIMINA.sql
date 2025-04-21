-- 1. Eliminar una reserva cancelada
DELETE FROM Reserva
WHERE estado = 'cancelada';

-- 2. Eliminar un voucher (por error en emisión)
DELETE FROM Voucher
WHERE id_voucher = 2;

-- 3. Eliminar un usuario (cliente que eliminó su cuenta)
DELETE FROM Usuario
WHERE email = 'laura@gmail.com';

-- 4. Eliminar una promoción vencida (ejemplo: Abril)
DELETE FROM Promocion
WHERE temporada = 'Abril';

-- 5. Eliminar un vuelo con 0 asientos disponibles (si existiera)
DELETE FROM Vuelo
WHERE asientos_disponibles = 0;
