USE TeConstruye
GO

--Stored Procedure para generar PRESUPUESTO segun ID del Proyecto

CREATE PROCEDURE usp_budget
	@idProject INT
AS
	Select S.name as Etapa, M.name as Material, M.description as Detalle, MS.quantity as Cantidad, MS.price as Costo, (MS.quantity * MS.price) as Total, C.name as Nombre, C.lastname1 as Apellido
	From Stage as S
	Inner Join MaterialsxStage as MS ON S.id = MS.id_stage 
	Inner Join Materials as M on M.id = MS.id_material
	Inner Join Project as P on P.id = @idProject
	Inner Join Client as C on C.identification = P.id_client
	Where S.id_project = @idProject
GO

--Stored Procedure para obtener los proyectos de los clientes

CREATE PROCEDURE usp_project_client
AS
	Select C.name as Nombre, C.lastname1 as Apellido, P.id as ProyectoID
	From Client as C
	Inner Join Project as P on P.id_client = C.identification
GO

--Stored Procedure para obtener la PLANILLA Segun Fecha
CREATE PROCEDURE usp_employee_payment
	@first_date		date,
	@second_date	date

AS
	Select P.name, E.name as Nombre, E.lastname1 as Apellido, WH.hours as Horas, WH.hour_cost as Costo, (WH.hours * WH.hour_cost) as Total
	From Worked_hours as WH
	Inner Join Employee as E on E.id = WH.id_project
	Inner Join Project as P on  P.id = WH.id_project
	Where WH.date >= @first_date AND Wh.date <= @second_date
GO

/**--Stored Procedure para obtener el informe de Gastos Segun Fecha
CREATE PROCEDURE usp_expenses
	@first_date		date,
	@second_date	date

AS
	Select**/
	






--EXECUTE DE PRUEBA
EXECUTE usp_budget @idProject = 5 
GO
EXECUTE usp_project_client
GO
EXECUTE usp_employee_payment @first_date = '2014-01-03', @second_date = '2014-01-10'
GO


--DROP DE PRUEBA
DROP PROCEDURE usp_budget
Go
DROP PROCEDURE usp_project_client
Go
DROP PROCEDURE usp_employee_payment
GO