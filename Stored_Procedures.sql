USE TeConstruye
GO

CREATE PROCEDURE usp_budget
	@idProject INT
AS
	Select S.name as Etapa, M.name as Material, M.description as Detalle, MS.quantity as Cantidad, MS.price as Costo, (MS.quantity * MS.price) as Total, C.name as Nombre, C.lastname1 as Apellido
	From Stage as S
	Inner Join MaterialsxStage as MS ON S.id = MS.id_stage AND S.id_project = @idProject
	Inner Join Materials as M on M.id = MS.id_material
	Inner Join Project as P on P.id = @idProject
	Inner Join Client as C on C.identification = P.id_client
GO

CREATE PROCEDURE usp_project_client

AS
	Select C.name as Nombre, C.lastname1 as Apellido, P.id as ProyectoID
	From Client as C
	Inner Join Project as P on P.id_client = C.identification
GO



EXECUTE usp_budget @idProject = 5
Go
EXECUTE usp_project_client
Go


DROP PROCEDURE usp_budget
Go
DROP PROCEDURE usp_project_client
Go