-- Clientes
INSERT INTO Cliente (nombre, email, telefono) VALUES
('Juan Pérez', 'juan@gmail.com', '3111234567'),
('Laura Gómez', 'laura@gmail.com', '3129876543'),
('Carlos Ruiz', 'carlos@gmail.com', '3134567890'),
('Marta Díaz', 'marta@gmail.com', '3141122334');

-- Proveedores
INSERT INTO Proveedor (nombre, tipo) VALUES
('Hotel Sol Caribe', 'hotel'),
('Hotel Montaña Azul', 'hotel'),
('Avianca', 'aerolinea'),
('LATAM Airlines', 'aerolinea');

-- Hoteles
INSERT INTO Hotel (nombre, ubicacion, estrellas, id_proveedor) VALUES
('Sol Caribe', 'Cartagena', 4.5, 1),
('Montaña Azul', 'Medellín', 4.0, 2);

-- Vuelos
INSERT INTO Vuelo (aerolinea, origen, destino, fecha_salida, asientos_disponibles, id_proveedor) VALUES
('Avianca', 'Bogotá', 'Cartagena', '2025-05-01 09:00:00', 50, 3),
('LATAM Airlines', 'Medellín', 'Santa Marta', '2025-05-02 15:30:00', 40, 4),
('Avianca', 'Cali', 'Cartagena', '2025-05-03 07:00:00', 60, 3);

-- Paquetes turísticos
INSERT INTO PaqueteTuristico (destino, precio_base, descuento, id_hotel, id_vuelo) VALUES
('Cartagena', 1500000, 10.00, 1, 1),
('Santa Marta', 1200000, 15.00, 2, 2),
('Cartagena', 1300000, 5.00, 1, 3);

-- Promociones
INSERT INTO Promocion (descripcion, descuento, temporada, id_paquete) VALUES
('Descuento verano', 20.00, 'Verano', 1),
('Oferta Semana Santa', 15.00, 'Semana Santa', 2),
('Promo Abril', 10.00, 'Abril', 3);

-- Reservas
INSERT INTO Reserva (id_cliente, id_paquete, fecha_reserva, total_pago, estado) VALUES
(1, 1, '2025-04-01', 1350000, 'confirmada'),
(2, 2, '2025-04-05', 1020000, 'pendiente'),
(3, 3, '2025-03-28', 1235000, 'confirmada'),
(1, 2, '2025-03-20', 1020000, 'cancelada'),
(4, 1, '2025-04-10', 1350000, 'confirmada');

-- Vouchers
INSERT INTO Voucher (id_reserva, fecha_emision) VALUES
(1, '2025-04-01'),
(3, '2025-03-28'),
(5, '2025-04-10');

-- Usuarios
INSERT INTO Usuario (email, clave, rol) VALUES
('juan@gmail.com', '1234', 'cliente'),
('laura@gmail.com', '1234', 'cliente'),
('agente1@viajes.com', 'agente123', 'agente'),
('admin@viajes.com', 'admin123', 'admin');

