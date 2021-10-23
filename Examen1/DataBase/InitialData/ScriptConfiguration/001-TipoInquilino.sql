DROP TABLE IF EXISTS #TipoInquilinoTemp

SELECT
Id_TipoInquilino, Descripcion, Estado INTO #TipoInquilinoTemp
FROM (
VALUES
(1, 'FISICO', 1),
(2, 'JURIDICO', 1)
)AS TEMP (Id_TipoInquilino, Descripcion, Estado)

----ACTUALIZAR DATOS----
UPDATE TI SET
TI.Descripcion = TM.Descripcion,
TI.Estado = TM.Estado
FROM dbo.TipoInquilino TI
INNER JOIN #TipoInquilinoTemp TM
ON TI.Id_TipoInquilino = TM.Id_TipoInquilino

----INSERTAR DATOS----
SET IDENTITY_INSERT dbo.TipoInquilino ON

INSERT INTO dbo.TipoInquilino(
  Id_TipoInquilino
, Descripcion
, Estado
)
SELECT
  Id_TipoInquilino
, Descripcion
, Estado
FROM #TipoInquilinoTemp

EXCEPT
SELECT
  Id_TipoInquilino
, Descripcion
, Estado
FROM dbo.TipoInquilino

SET IDENTITY_INSERT dbo.TipoInquilino OFF

GO