
CREATE TABLE Clientes (
    ClienteID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Contratos (
    ContratoID SERIAL PRIMARY KEY,
    ClienteID INT,
    CodigoContrato VARCHAR(7) UNIQUE CHECK (CodigoContrato ~ '^CK-\d{4}$'),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Facturas (
    FacturaID SERIAL PRIMARY KEY,
    ContratoID INT,
    CodigoFactura VARCHAR(6) UNIQUE CHECK (CodigoFactura ~ '^FH-\d{3}$'),
    FOREIGN KEY (ContratoID) REFERENCES Contratos(ContratoID)
);

CREATE TABLE Productos (
    ProductoID SERIAL PRIMARY KEY,
    FacturaID INT,
    CodigoProducto VARCHAR(9) UNIQUE CHECK (CodigoProducto ~ '^PD-\d{6}$'),
    FOREIGN KEY (FacturaID) REFERENCES Facturas(FacturaID),
    Stock INT CHECK (Stock >= 0)
);


