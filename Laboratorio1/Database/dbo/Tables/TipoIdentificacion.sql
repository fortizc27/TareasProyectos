CREATE TABLE [dbo].[TipoIdentificacion]
(
	  [IdTipoidentificacion] INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TipoIdentificacion PRIMARY KEY CLUSTERED(IdTipoidentificacion)
	, [Descripcion] VARCHAR(50) NOT NULL
)
