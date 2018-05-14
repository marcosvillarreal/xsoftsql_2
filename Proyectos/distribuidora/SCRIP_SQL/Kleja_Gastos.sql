USE [kleja]
GO
/****** Objeto:  Table [dbo].[movpub_temp]    Fecha de la secuencia de comandos: 05/14/2018 09:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[movpub_temp](
	[terminal_del] [numeric](3, 0) NOT NULL,
	[fecha_del] [datetime] NOT NULL,
	[id] [numeric](12) NOT NULL,
	[idorigen] [numeric](12) NOT NULL,
	[origen] [char](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fechasis] [datetime] NOT NULL,
	[programa] [char](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[terminal] [numeric](3, 0) NOT NULL,
	[idoperador] [int] NOT NULL,
	[iddetanrocaja] [int] NOT NULL,
	[sucursal] [numeric](3, 0) NOT NULL,
	[idcotizadolar] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[neto] [numeric](11, 2) NOT NULL,
	[debe] [numeric](11, 2) NOT NULL,
	[haber] [numeric](11, 2) NOT NULL,
	[gastos] [numeric](11, 2) NOT NULL,
	[impuestos] [numeric](11, 2) NOT NULL,
	[sueldos] [numeric](11, 2) NOT NULL,
	[comisiones] [numeric](11, 2) NOT NULL,
	[concepto] [char](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[detalle] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[periodo] [char](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[switch] [char](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[idctacte] [int] NOT NULL,
	[idcuenta] [int] NOT NULL,
	[pendiente] [numeric](11, 2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF