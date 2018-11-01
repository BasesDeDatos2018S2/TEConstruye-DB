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
	manager			int				Not null,	
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
	description		varchar(500)		Not null,
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
	hour_cost		int				Not null		default 0,
	Primary Key (id),
);

CREATE TABLE Passwords(
	id_employee		int				Not null,
	password		varchar(12)		Not null,
	Primary Key (id_employee)
);


CREATE TABLE Role_specification(
	id					int			Not null		IDENTITY(1,1),
	specification		varchar(20)	Not null,
	Primary Key (id),
);
	

CREATE TABLE Roles(
	id					int			Not null		IDENTITY(1,1),
	id_role				int			Not null,
	id_employee			int			Not null,
	start_date			date		Not null,
	Primary Key (id),
);


CREATE TABLE Worked_hours(
	id				int				Not null		IDENTITY(1,1),
	id_project		int				Not null,
	id_employee		int				Not null,
	date			date			Not null		default '',
	hours			int				Not null		default 0,
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




Alter Table Client
ADD constraint identification_checkC check(DATALENGTH(identification) = 9);


ALTER TABLE Project
ADD Foreign Key (id_client) References Client(identification),
	Foreign Key (manager) References Employee(id);


ALTER TABLE Anotations
ADD Foreign Key (id_project) References Project(id);


ALTER TABLE Stage
ADD Foreign Key (id_project) References Project(id);
GO

ALTER TABLE Employee
ADD constraint positive_cost check (hour_cost>=0),
	constraint identification_checkE check(DATALENGTH(identification) = 9);
GO

ALTER TABLE Passwords
ADD Foreign Key (id_employee) References Employee(id),
	constraint password check(DATALENGTH(password) = 12);
GO

ALTER TABLE Roles
ADD Foreign Key (id_employee) References Employee(id),
	Foreign Key (id_role) References Role_specification(id);
GO

ALTER TABLE Worked_hours
ADD Foreign Key (id_project) References Project(id),
	Foreign Key (id_employee) References Employee(id),
	constraint positive_hours check (hours>=0),
	constraint unique_values UNIQUE NONCLUSTERED (id_project, id_employee, date);
GO

ALTER TABLE Materials
Add constraint positive_price check (price>=0);
GO

ALTER TABLE MaterialsxStage
ADD Foreign Key (id_stage) References Stage(id),
	Foreign Key (id_material) References Materials(id),
	constraint price_positive check (price>=0);
GO

ALTER TABLE Bill
ADD Foreign Key (id_stage) References Stage(id),
	Foreign Key (id_provider) References Provider(id),
	Foreign Key (id_material) References Materials(id),
	constraint bill_positive check (price>=0);
GO





------Trigger para no poder disminuir el precio de las horas a los trabajadores
CREATE TRIGGER ut_validate_hours_price
 ON Employee
 For Update
 AS

 Begin
	If Update (hour_cost)
	Declare @inserted int, @deleted int
	Select @inserted = hour_cost from inserted
	Select @deleted  = hour_cost from deleted

	If (@inserted < @deleted)
	Begin
	RAISERROR (15600, -1, -1, 'Dado políticas de la empresa, no se puede disminuir el sueldo')
	ROLLBACK TRANSACTION;
	END
 END
 GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------Trigger para no poder editar el numero de cedula de los empleados
CREATE TRIGGER ut_employee_identification_not_editable
 ON Employee
 For Update
 AS

 Begin
	If Update (identification)
	Declare @inserted varchar(9), @deleted varchar(9)
	Select @inserted = identification from inserted
	Select @deleted  = identification from deleted

	If (@inserted < > @deleted)
	Begin
	RAISERROR (15600, -1, -1, 'No es posible modificar la cedula del empleado')
	ROLLBACK TRANSACTION;
	END
 END
 GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------Trigger para no poder editar el numero de cedula de los empleados
CREATE TRIGGER ut_client_identification_not_editable
 ON Client
 For Update
 AS

 Begin
	If Update (identification)
	Declare @inserted varchar(9), @deleted varchar(9)
	Select @inserted = identification from inserted
	Select @deleted  = identification from deleted

	If (@inserted < > @deleted)
	Begin
	RAISERROR (15600, -1, -1, 'No es posible modificar la cedula del cliente')
	ROLLBACK TRANSACTION;
	END
 END
 GO

 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------Trigger para manager que no sea un albañil
CREATE TRIGGER ut_manager_verification_update
 ON Project
 For Update
 AS

 Begin
	If Update (manager)
	Declare @inserted int;
	Select @inserted = manager from inserted
	

	If (@inserted > 2)
	Begin
	RAISERROR (15600, -1, -1, 'Un albañil no puede ser Manager de un proyecto')
	ROLLBACK TRANSACTION;
	END
 END
 GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------Trigger para manager que no sea un albañil
CREATE TRIGGER ut_manager_verification_insert
 ON Project
 For Insert
 AS

 Begin
	Declare @inserted int;
	Select @inserted = manager from inserted
	

	If (@inserted = 1)
	Begin
	RAISERROR (15600, -1, -1, 'Un albañil no puede ser Manager de un proyecto')
	ROLLBACK TRANSACTION;
	END
 END
 GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Stored Procedure para generar PRESUPUESTO segun ID del Proyecto
CREATE PROCEDURE usp_budget
	@idProject INT
AS
	Select S.name as Etapa, M.name as Material, M.description as Detalle, MS.quantity as Cantidad, MS.price as Costo, (MS.quantity * MS.price) as Total, (C.name + ' ' + C.lastname1) as Nombre, P.name as ProyectoNombre
	From Stage as S
	Inner Join MaterialsxStage as MS ON S.id = MS.id_stage 
	Inner Join Materials as M on M.id = MS.id_material
	Inner Join Project as P on P.id = @idProject
	Inner Join Client as C on C.identification = P.id_client
	Where S.id_project = @idProject
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Stored Procedure para obtener los proyectos de los clientes

CREATE PROCEDURE usp_project_client
AS
	Select C.name as Nombre, C.lastname1 as Apellido, P.id as ProyectoID, P.name as NombreProyecto
	From Client as C
	Inner Join Project as P on P.id_client = C.identification
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Stored Procedure para obtener la PLANILLA Segun Fecha
CREATE PROCEDURE usp_employee_payment
	@first_date		date,
	@second_date	date

AS
	Select P.name as Proyecto, (E.name + ' ' + E.lastname1) as Nombre, WH.hours as Horas, E.hour_cost as Costo, (WH.hours * E.hour_cost) as Total
	From Worked_hours as WH
	Inner Join Employee as E on E.id = WH.id_employee
	Inner Join Project as P on  P.id = WH.id_project
	Where WH.date >= @first_date AND Wh.date <= @second_date
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Stored Procedure para obtener el informe de Gastos Segun Fecha y Proyecto
CREATE PROCEDURE usp_expenses
	@first_date		date,
	@second_date	date,
	@id_proj		int

AS
	Select B.serial as Factura, Prv.name as Proveedor, B.date as Fecha, S.name as Etapa, B.price as Precio, Prj.name as Proyecto
	From Provider as Prv
	Inner Join Bill as B on B.id_provider = Prv.id
	Inner Join Stage as S on S.id = B.id_stage
	Inner Join Project as Prj on Prj.id = S.id_project
	Where Prj.id = @id_proj AND B.date >= @first_date AND B.date <= @second_date
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Stored Procedure para obtener el Estado del Proyecto

CREATE PROCEDURE usp_status
	@id_proj	int
AS
	Select	S.name as Etapa, (MS.quantity * MS.price) as TotalPresupuesto, (MS.quantity * B.price) as TotalReal, ((MS.quantity * MS.price) - (MS.quantity * B.price)) as Diferencia, P.name as Proyecto
	From Bill as B
	Inner Join MaterialsxStage as MS on MS.id_stage = B.id_stage and MS.id_material = B.id_material
	Inner Join Stage as S on S.id = MS.id_stage
	Inner Join Project as P on P.id = S.id_project 
	Where S.id_project = @id_proj
	
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Stored Procedure para obtener total en facturas por proyecto

CREATE PROCEDURE usp_total_bills
	@id_proj	int
AS
	Select	SUM(MS.quantity * MS.price) as TotalPresupuesto, SUM(MS.quantity * B.price) as TotalReal
	From Bill as B
	Inner Join MaterialsxStage as MS on MS.id_stage = B.id_stage and MS.id_material = B.id_material
	Inner Join Stage as S on S.id = MS.id_stage
	Inner Join Project as P on P.id = S.id_project 
	Where S.id_project = @id_proj
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Stored Procedure para obtener totales por etapa
CREATE PROCEDURE usp_total_stage
	@id_stage	int
AS
	Select SUM(MS.quantity * MS.price) as TotalPresupuesto, SUM(MS.quantity * B.price) as TotalReal
	From Bill as B
	Inner Join MaterialsxStage as MS on MS.id_stage = B.id_stage and MS.id_material = B.id_material
	Inner Join Stage as S on S.id = MS.id_stage
	Inner Join Project as P on P.id = S.id_project 
	Where MS.id_stage = @id_stage
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Stored Procedure para obtener ID material x Etapa
CREATE PROCEDURE usp_material_stage
	@id_stage	int
AS
	Select MS.id_material
	From MaterialsxStage as MS
	Where MS.id_stage = @id_stage
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Stored Procedure para obtener empleados que pueden ser ING o Arquitecto

CREATE PROCEDURE usp_posible_manager
AS
	Select E.id as Id_Employee, E.identification as Identification, E.name as Name, E.lastname1 as Lastname1, E.lastname2 as Lastname2, E.phone as Phone, E.hour_cost as hour_cost
	From Employee as E
	Inner Join Roles as R on R.id_employee = E.id
	Inner Join Role_specification as RS on RS.id = R.id_role
	Where RS. id <> 1 AND RS. id <> 2
GO

Select * from stage