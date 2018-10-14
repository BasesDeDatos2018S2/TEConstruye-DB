CREATE DATABASE TeConstruye
GO

USE TeConstruye;


CREATE TABLE Cliente(
	cedula			varchar(9)		Not null,
	nombre			varchar(20)		Not null,
	apellido1		varchar(20)		Not null,
	apellido2		varchar(20)		Not null		default '',
	telefono		varchar(15)		Not null		default '',
	correo			varchar(40)		Not null		default '',
	Primary Key (cedula),
);


CREATE TABLE Proyecto(
	id				int				Not null		IDENTITY(1,1),
	ubicacion		varchar(60)		Not null,		
	id_cliente		varchar(9)		Not null,
	Primary Key (id),
);


CREATE TABLE Anotaciones(
	id				int				Not null		IDENTITY(1,1),
	id_proyecto		int				Not null,
	fecha			date			Not null,
	Primary Key (id),
);


CREATE TABLE Etapas(
	id				int				Not null		IDENTITY(1,1),
	id_proyecto		int				Not null,
	nombre			varchar(40)		Not null,
	descripcion		varchar(60)		Not null,
	estado			bit				Not null		default 0,
	fecha_inicio	date			Not null,
	fecha_fin		date		Not null,
	Primary Key (id),
);


CREATE TABLE Empleado(
	id				int				Not null		IDENTITY(1,1),
	cedula			varchar(9)		Not null		unique,
	nombre			varchar(20)		Not null,
	apellido1		varchar(20)		Not null,
	apellido2		varchar(20)		Not null		default '',
	telefono		varchar(15)		Not null		default '',
	Primary Key (id),
);


CREATE TABLE Roles(
	id				int				Not null,
	cedula_empleado	varchar(9)				Not null,
	Primary Key (id, cedula_empleado),
);


CREATE TABLE Horas_laboradas(
	id_proyecto		int				Not null,
	id_empleado		int				Not null,
	fecha			date			Not null		default '',
	horas			int				Not null		default 0,
	Primary Key (id_proyecto, id_empleado),
);


CREATE TABLE Materiales(
	id				int				Not null		IDENTITY(1,1),
	nombre			varchar(40)		Not null,
	detalle			varchar(40)		Not null,
	precio			int				Not null,
	Primary Key (id),
);


CREATE TABLE MaterialesxEtapa(
	id_etapa		int				Not null,
	id_material		int				Not null,
	cantidad		int				Not null,
	costo			int				Not null,
	Primary Key(id_etapa, id_material)

);


CREATE TABLE Detalle(
	id				int				Not null		IDENTITY(1,1),
	nombre_material	varchar(20)		Not null,
	cantidad		int				Not null,
	precio			int				Not null,
	id_factura		int				Not null		unique,
	Primary Key(id)
);


CREATE TABLE Proveedor(
	id				int				Not null,
	nombre			varchar(40)		Not null,
	Primary Key(id)

);


CREATE TABLE Factura(
	id				int				Not null		IDENTITY(1,1),
	fecha			date			Not null,
	serial			int				Not null		unique,
	id_etapa		int				Not null,
	id_proveedor	int				Not null,
	Primary Key(id)
);




ALTER TABLE Proyecto
ADD Foreign Key (id_cliente) References Cliente(cedula);


ALTER TABLE Proyecto
ADD Foreign Key (id_cliente) References Cliente(cedula);


ALTER TABLE Anotaciones
ADD Foreign Key (id_proyecto) References Proyecto(id);


ALTER TABLE Etapas
ADD Foreign Key (id_proyecto) References Proyecto(id);


ALTER TABLE Roles
ADD Foreign Key (cedula_empleado) References Empleado(id);


ALTER TABLE Horas_laboradas
ADD Foreign Key (id_proyecto) References Proyecto(id),
	Foreign Key (id_empleado) References Empleado(id),
	constraint horas_positivo check (horas>=0);

ALTER TABLE Materiales
Add constraint m_precio_positivo check (precio>=0);

ALTER TABLE Detalle
Add constraint d_precio_positivo check (precio>=0);

ALTER TABLE MaterialesxEtapa
ADD Foreign Key (id_etapa) References Etapas(id),
	Foreign Key (id_material) References Materiales(id),
	constraint costo_positivo check (costo>=0);


ALTER TABLE Factura
ADD Foreign Key (id_etapa) References Etapas(id),
	Foreign Key (id_proveedor) References Proveedor(id),
	constraint serial_positivo check (serial>0);


