USE ferretti
GO

----Archivos de Ganacias
/****** Objeto:  Table [dbo].[PadronAfip]    Fecha de la secuencia de comandos: 02/08/2018 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PadronAfip](
	[id] [int] NOT NULL,
	[idctacte] [int] NOT NULL,
	[cuit] [char](13) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[idcategoria] [int] NOT NULL,
	[idconcepto] [int] NOT NULL,
	[fechaauto] [datetime] NOT NULL,
	[fechamanu] [datetime] NOT NULL,
	[automatico] [numeric](1, 0) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[excluido] [numeric](1, 0) NOT NULL,
	[leyenda] [char](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[fecdesde] [datetime] NOT NULL,
	[fechasta] [datetime] NOT NULL,
 CONSTRAINT [PK_PadronAfip_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

/****** Objeto:  Table [dbo].[CateGan]    Fecha de la secuencia de comandos: 02/08/2018 15:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CateGan](
	[id] [int] NOT NULL,
	[abrevia] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nombre] [char](40) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[cnumsicore] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_CateGan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****** Objeto:  Table [dbo].[ConceptoGan]    Fecha de la secuencia de comandos: 02/08/2018 16:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConceptoGan](
	[ID] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](130) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_ConceptoGan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****** Objeto:  Table [dbo].[EscalaGan]    Fecha de la secuencia de comandos: 02/08/2018 16:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscalaGan](
	[id] [int] NOT NULL,
	[idconcepto] [int] NOT NULL,
	[impmin] [numeric](11, 2) NOT NULL,
	[impmax] [numeric](11, 2) NOT NULL,
	[baserete] [numeric](11, 2) NOT NULL,
	[porceri] [numeric](6, 2) NOT NULL,
	[porcerni] [numeric](6, 2) NOT NULL,
	[excedente] [numeric](11, 2) NOT NULL,
	[minimo] [numeric](11, 2) NOT NULL,
	[basenorete] [numeric](11, 2) NOT NULL,
 CONSTRAINT [PK_EscalaGan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Objeto:  Table [dbo].[tablagan]    Fecha de la secuencia de comandos: 02/09/2018 08:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablagan](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idconcepto] [int] NULL,
	[impmin] [numeric](11, 2) NOT NULL,
	[impmax] [numeric](11, 2) NOT NULL,
	[baserete] [numeric](11, 2) NOT NULL,
	[porce] [numeric](6, 2) NOT NULL,
	[excede] [numeric](11, 2) NOT NULL,
	[min] [numeric](11, 2) NOT NULL,
	[neto] [numeric](11, 2) NOT NULL,
	[netoant] [numeric](11, 2) NOT NULL,
	[rete] [numeric](11, 2) NOT NULL,
	[reteant] [numeric](11, 2) NOT NULL,
	[topenorete] [numeric](11, 2) NOT NULL
) ON [PRIMARY]
