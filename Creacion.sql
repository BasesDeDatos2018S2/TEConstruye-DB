CREATE DATABASE TeConstruye
GO

USE TeConstruye;


CREATE TABLE Client(
	identification	varchar(9)		Not null,
	name			varchar(20)		Not null,
	lastname1		varchar(20)		Not null,
	lastname2		varchar(20)		Not null		default '',
	phone			varchar(15)		Not null		default '',
	email			varchar(40)		Not null		default '',
	Primary Key (identification),
);


CREATE TABLE Project(
	id				int				Not null		IDENTITY(1,1),
	name			varchar(30)		Not null		default '',
	ubication		varchar(60)		Not null,		
	id_client		varchar(9)		Not null,
	Primary Key (id),
);


CREATE TABLE Anotations(
	id				int				Not null		IDENTITY(1,1),
	id_project		int				Not null,
	anotation		varchar(40)		Not null,
	date			date			Not null,
	Primary Key (id),
);


CREATE TABLE Stage(
	id				int				Not null		IDENTITY(1,1),
	id_project		int				Not null,
	name			varchar(40)		Not null,
	description		varchar(60)		Not null,
	status			bit				Not null		default 0,
	start_date		date			Not null,
	end_date		date		Not null,
	Primary Key (id),
);


CREATE TABLE Employee(
	id				int				Not null		IDENTITY(1,1),
	identification	varchar(9)		Not null		unique,
	name			varchar(20)		Not null,
	lastname1		varchar(20)		Not null,
	lastname2		varchar(20)		Not null		default '',
	phone			varchar(15)		Not null		default '',
	Primary Key (id),
);


CREATE TABLE Roles(
	id_role				int			Not null		IDENTITY(1,1),
	id_employee			int			Not null,
	role				varchar(15)	Not null,
	Primary Key (id_role, id_employee),
);



CREATE TABLE Worked_hours(
	id				int				Not null		IDENTITY(1,1),
	id_project		int				Not null,
	id_employee		int				Not null,
	date			date			Not null		default '',
	hours			int				Not null		default 0,
	hour_cost		int				Not null		default 0,
	Primary Key (id),
);


CREATE TABLE Materials(
	id				int				Not null		IDENTITY(1,1),
	name			varchar(60)		Not null,
	description		varchar(60)		Not null,
	price			int				Not null,
	Primary Key (id),
);


CREATE TABLE MaterialsxStage(
	id_stage		int				Not null,
	id_material		int				Not null,
	quantity		int				Not null,
	price			int				Not null,
	Primary Key(id_stage, id_material)

);


/**CREATE TABLE Detalle(
	id				int				Not null		IDENTITY(1,1),
	nombre_material	varchar(20)		Not null,
	cantidad		int				Not null,
	precio			int				Not null,
	id_factura		int				Not null		unique,
	Primary Key(id)
);**/


CREATE TABLE Provider(
	id				int				Not null		IDENTITY(1,1),
	name			varchar(40)		Not null,
	Primary Key(id)

);


CREATE TABLE Bill(
	id				int				Not null		IDENTITY(1,1),
	date			date			Not null,
	serial			varchar(30)		Not null		unique,
	price			int				Not null,
	id_stage		int				Not null,
	id_material		int				Not null,
	id_provider		int				Not null,
	Primary Key(id)
);







ALTER TABLE Project
ADD Foreign Key (id_client) References Client(identification);


ALTER TABLE Anotations
ADD Foreign Key (id_project) References Project(id);


ALTER TABLE Stage
ADD Foreign Key (id_project) References Project(id);


ALTER TABLE Roles
ADD Foreign Key (id_employee) References Employee(id);


ALTER TABLE Worked_hours
ADD Foreign Key (id_project) References Project(id),
	Foreign Key (id_employee) References Employee(id),
	constraint positive_hours check (hours>=0),
	constraint positive_cost check (hour_cost>=0),
	constraint unique_values UNIQUE NONCLUSTERED (id_project, id_employee, date);

ALTER TABLE Materials
Add constraint positive_price check (price>=0);


ALTER TABLE MaterialsxStage
ADD Foreign Key (id_stage) References Stage(id),
	Foreign Key (id_material) References Materials(id),
	constraint price_positive check (price>=0);


ALTER TABLE Bill
ADD Foreign Key (id_stage) References Stage(id),
	Foreign Key (id_provider) References Provider(id),
	Foreign Key (id_material) References Materials(id),
	constraint bill_positive check (price>=0);


