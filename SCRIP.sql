drop database AgenciaViajesSimplificada;
CREATE DATABASE AgenciaViajesSimplificada;
USE AgenciaViajesSimplificada;

-- Tabla de Clientes
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

-- Tabla de Proveedores (hoteles o aerolíneas)
CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    tipo ENUM('hotel', 'aerolinea') NOT NULL
);

-- Tabla de Hoteles
CREATE TABLE Hotel (
    id_hotel INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    ubicacion VARCHAR(100),
    estrellas FLOAT,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

-- Tabla de Vuelos
CREATE TABLE Vuelo (
    id_vuelo INT PRIMARY KEY AUTO_INCREMENT,
    aerolinea VARCHAR(100),
    origen VARCHAR(100),
    destino VARCHAR(100),
    fecha_salida DATETIME,
    asientos_disponibles INT,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

-- Tabla de Paquetes Turísticos (asocia 1 hotel y 1 vuelo)
CREATE TABLE PaqueteTuristico (
    id_paquete INT PRIMARY KEY AUTO_INCREMENT,
    destino VARCHAR(100),
    precio_base DECIMAL(10,2),
    descuento DECIMAL(5,2),
    id_hotel INT,
    id_vuelo INT,
    FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel),
    FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo)
);

-- Tabla de Promociones aplicables a paquetes
CREATE TABLE Promocion (
    id_promocion INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    descuento DECIMAL(5,2),
    temporada VARCHAR(50),
    id_paquete INT,
    FOREIGN KEY (id_paquete) REFERENCES PaqueteTuristico(id_paquete)
);

-- Tabla de Reservas
CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_paquete INT,
    fecha_reserva DATE,
    total_pago DECIMAL(10,2),
    estado ENUM('pendiente', 'confirmada', 'cancelada'),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_paquete) REFERENCES PaqueteTuristico(id_paquete)
);

-- Tabla de Vouchers
CREATE TABLE Voucher (
    id_voucher INT PRIMARY KEY AUTO_INCREMENT,
    id_reserva INT,
    fecha_emision DATE,
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva)
);

-- Tabla de Usuarios para login y control de roles
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE,
    clave VARCHAR(100),
    rol ENUM('cliente', 'agente', 'admin')
);


