CREATE PROCEDURE [dbo].[TI_Obtener]
	@IdTipoIdentificacion int = NULL

AS BEGIN
SET NOCOUNT ON

	SELECT
		TI.IdTipoidentificacion,
		TI.Descripcion
	FROM dbo.TipoIdentificacion TI
	WHERE
	(@IdTipoIdentificacion IS NULL OR IdTipoidentificacion=@IdTipoIdentificacion)
END

GO