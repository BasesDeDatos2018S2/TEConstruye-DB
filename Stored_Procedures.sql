USE TeConstruye
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
	Where Prj.id = @id_proj
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



/**

--EXECUTE DE PRUEBA
EXECUTE usp_budget @idProject = 2
GO
EXECUTE usp_project_client
GO
EXECUTE usp_employee_payment @first_date = '01/03/2014', @second_date = '01/10/2014'
GO
EXECUTE usp_expenses @first_date = '02/02/2014', @second_date = '02/10/2014', @id_proj = 1
GO
EXECUTE usp_status @id_proj = 1
GO
EXECUTE usp_total_bills @id_proj = 5
GO
EXECUTE usp_total_stage @id_stage = 1
GO
EXECUTE usp_material_stage @id_stage = 1
GO

--DROP DE PRUEBA
DROP PROCEDURE usp_budget
Go
DROP PROCEDURE usp_project_client
Go
DROP PROCEDURE usp_employee_payment
GO
DROP PROCEDURE usp_expenses
Go
DROP PROCEDURE usp_status
Go
DROP PROCEDURE usp_total_bills
GO
DROP PROCEDURE usp_total_stage
GO
DROP PROCEDURE usp_material_stage
GO

DROP TRIGGER ut_validate_hours_price
GO
DROP TRIGGER ut_employee_identification_not_editable
GO
DROP TRIGGER ut_client_identification_not_editable
GO


**/
