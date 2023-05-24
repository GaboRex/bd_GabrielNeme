USE master_db;

CREATE TABLE Clientes (
  IDCliente INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Contrasena VARCHAR(50),
  Rol VARCHAR(50)
);

CREATE TABLE Proveedores (
  IDProveedor INT PRIMARY KEY,
  NombreProveedor VARCHAR(100),
  Direccion VARCHAR(100),
  NumeroTelefono VARCHAR(20),
  CorreoElectronico VARCHAR(100)
);

CREATE TABLE Medicamentos (
  IDMedicamento INT PRIMARY KEY,
  IDProveedor INT,
  Nombre VARCHAR(100),
  Descripcion VARCHAR(255),
  CantidadStock INT,
  FechaCaducidad DATE,
  FOREIGN KEY (IDProveedor) REFERENCES Proveedores(IDProveedor)
);



CREATE TABLE Compras (
  IDCompra INT PRIMARY KEY,
  IDProveedor INT,
  FechaCompra DATE,
  TotalCompra DECIMAL(10, 2),
  FOREIGN KEY (IDProveedor) REFERENCES Proveedores(IDProveedor)
);



CREATE TABLE DetalleCompra (
  IDDetalleCompra INT PRIMARY KEY,
  IDCompra INT,
  IDMedicamento INT,
  CantidadComprada INT,
  PrecioUnitario DECIMAL(10, 2),
  FOREIGN KEY (IDCompra) REFERENCES Compras(IDCompra),
  FOREIGN KEY (IDMedicamento) REFERENCES Medicamentos(IDMedicamento)
);


CREATE TABLE Ventas (
  IDVenta INT PRIMARY KEY,
  IDCliente INT,
  FechaVenta DATE,
  TotalVenta DECIMAL(10, 2),
  FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);


CREATE TABLE DetalleVenta (
  IDDetalleVenta INT PRIMARY KEY,
  IDVenta INT,
  IDMedicamento INT,
  CantidadVendida INT,
  PrecioUnitario DECIMAL(10, 2),
  FOREIGN KEY (IDVenta) REFERENCES Ventas(IDVenta),
  FOREIGN KEY (IDMedicamento) REFERENCES Medicamentos(IDMedicamento)
);



CREATE TABLE MovimientosInventario (
  IDMovimiento INT PRIMARY KEY,
  TipoMovimiento VARCHAR(20),
  IDMedicamento INT,
  Cantidad INT,
  FechaMovimiento DATE,
  FOREIGN KEY (IDMedicamento) REFERENCES Medicamentos(IDMedicamento)
);

INSERT INTO Clientes(IDCliente, Nombre, Contrasena, Rol)
VALUES (1, 'CristianoRonaldo', '123456', 'Administrador');

INSERT INTO Proveedores (IDProveedor, NombreProveedor, Direccion, NumeroTelefono, CorreoElectronico)
VALUES (1, 'Bago', 'Calle de la felicidad', '123456789', 'rico@gmail.com');

INSERT INTO Medicamentos (IDMedicamento, IDProveedor, Nombre, Descripcion, CantidadStock, FechaCaducidad)
VALUES (1, 1, 'Bill 13', 'Para el dolor de pancita', 50, '2023-12-31');

INSERT INTO Compras (IDCompra, IDProveedor, FechaCompra, TotalCompra)
VALUES (1, 1, '2023-05-15', 500.00);

INSERT INTO DetalleCompra (IDDetalleCompra, IDCompra, IDMedicamento, CantidadComprada, PrecioUnitario)
VALUES (1, 1, 1, 100, 5.00);

INSERT INTO Ventas (IDVenta, IDCliente, FechaVenta, TotalVenta)
VALUES (1, 1, '2023-05-20', 200.00);

INSERT INTO DetalleVenta (IDDetalleVenta, IDVenta, IDMedicamento, CantidadVendida, PrecioUnitario)
VALUES (1, 1, 1, 20, 10.00);

INSERT INTO MovimientosInventario (IDMovimiento, TipoMovimiento, IDMedicamento, Cantidad, FechaMovimiento)
VALUES (1, 'entrada', 1, 50, '2023-05-22');






