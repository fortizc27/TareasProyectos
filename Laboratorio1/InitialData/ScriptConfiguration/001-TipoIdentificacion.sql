DROP TABLE IF EXISTS #TipoIdentificacionTemp

SELECT
IdTipoIdentificacion, Descripcion INTO #TipoIdentificacionTemp
FROM (
VALUES
(1, 'CEDULA'),
(2, 'PASAPORTE'),
(3, 'CEDULA JURIDICA')
)AS TEMP (IdTipoIdentificacion, Descripcion)

----ACTUALIZAR DATOS----
UPDATE TI SET
TI.Descripcion = TM.Descripcion
FROM dbo.TipoIdentificacion TI
INNER JOIN #TipoIdentificacionTempp TM
ON TI.IdTipoIdentificacion = TM.IdTipoIdentificacion

----INSERTAR DATOS----
SET IDENTITY_INSERT dbo.TipoIdentificacion ON

INSERT INTO dbo.TipoIdentificacion(
  IdTipoIdentificacion
, Descripcion
)
SELECT
  IdTipoIdentificacion
, Descripcion
FROM #TipoIdentificacionTemp

EXCEPT
SELECT
  IdTipoIdentificacion
, Descripcion
FROM dbo.TipoIdentificacion

SET IDENTITY_INSERT dbo.TipoIdentificacion OFF

GO