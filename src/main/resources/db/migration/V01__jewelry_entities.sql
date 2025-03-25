CREATE DATABASE jewelry_db;
USE jewelry_db;

-- Tabla de Usuarios
CREATE TABLE USERS (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    direccion TEXT,
    contraseña VARCHAR(255) NOT NULL,
    rol ENUM('cliente', 'admin', 'empleado') NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Productos
CREATE TABLE PRODUCTS (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    main_image VARCHAR(255),
    category_id BIGINT,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by BIGINT,
    updated_by BIGINT,
    deleted_by BIGINT,
    updated_date TIMESTAMP DEFAULT ON UPDATE CURRENT_TIMESTAMP,
    deleted_date TIMESTAMP DEFAULT ON DELETE CURRENT_TIMESTAMP,
    status_id BIGINT,
    materials varchar (255)
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(id),
    FOREIGN KEY (status_id) REFERENCES STATUS(id)
);

CREATE TABLE VIEWS(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    user_id BIGINT,
    view_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Pedidos
--CREATE TABLE ORDERS (
--    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
--    id_usuario INT,
--    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    estado ENUM('pendiente', 'procesando', 'enviado', 'entregado', 'cancelado') DEFAULT 'pendiente',
--    total DECIMAL(10,2) NOT NULL,
--    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
--);
--
---- Tabla de Detalles de Pedido
--CREATE TABLE DetallesPedido (
--    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
--    id_pedido INT,
--    id_producto INT,
--    cantidad INT NOT NULL,
--    precio_unitario DECIMAL(10,2) NOT NULL,
--    subtotal DECIMAL(10,2) NOT NULL,
--    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE CASCADE,
--    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
--);
--
---- Tabla de Pagos
--CREATE TABLE Pagos (
--    id_pago INT AUTO_INCREMENT PRIMARY KEY,
--    id_pedido INT,
--    metodo_pago ENUM('tarjeta', 'transferencia', 'paypal') NOT NULL,
--    estado_pago ENUM('pendiente', 'completado', 'fallido') DEFAULT 'pendiente',
--    monto DECIMAL(10,2) NOT NULL,
--    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
--);
--
-- Tabla de Envíos
CREATE TABLE Envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    direccion_envio TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_envio ENUM('preparando', 'en camino', 'entregado') DEFAULT 'preparando',
    tracking_number VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

---- Tabla de Seguimiento en tiempo real
--CREATE TABLE Seguimiento (
--    id_seguimiento INT AUTO_INCREMENT PRIMARY KEY,
--    id_pedido INT,
--    estado ENUM('pendiente', 'procesando', 'enviado', 'entregado', 'cancelado') NOT NULL,
--    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
--);
--