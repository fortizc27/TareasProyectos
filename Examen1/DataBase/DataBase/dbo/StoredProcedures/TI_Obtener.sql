CREATE PROCEDURE [dbo].[TI_Obtener]
	@Id_TipoInquilino int = NULL

AS BEGIN
SET NOCOUNT ON

	SELECT
		TI.Id_TipoInquilino,
		TI.Descripcion,
		TI.Estado
	FROM dbo.TipoInquilino TI
	WHERE
	(@Id_TipoInquilino IS NULL OR Id_TipoInquilino=@Id_TipoInquilino)
END

GO