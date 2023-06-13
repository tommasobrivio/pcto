USE [master]
GO
/****** Object:  Database [GMES_V2]    Script Date: 12/06/2023 08:48:04 ******/
CREATE DATABASE [GMES_V2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GMES_V2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GMES_V2.mdf' , SIZE = 270336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GMES_V2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GMES_V2_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GMES_V2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GMES_V2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GMES_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GMES_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GMES_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GMES_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GMES_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [GMES_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GMES_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GMES_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GMES_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GMES_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GMES_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GMES_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GMES_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GMES_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GMES_V2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GMES_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GMES_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GMES_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GMES_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GMES_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GMES_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GMES_V2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GMES_V2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GMES_V2] SET  MULTI_USER 
GO
ALTER DATABASE [GMES_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GMES_V2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GMES_V2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GMES_V2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GMES_V2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GMES_V2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GMES_V2] SET QUERY_STORE = OFF
GO
USE [GMES_V2]
GO
/****** Object:  Table [dbo].[_Log]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Log](
	[IdLog] [bigint] IDENTITY(1,1) NOT NULL,
	[DataOra] [datetime] NULL,
	[StatusCode] [int] NULL,
	[NomeFunzione] [nvarchar](max) NULL,
	[Dettagli] [nvarchar](max) NULL,
 CONSTRAINT [PK__Log] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiKey]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiKey](
	[IdApiKey] [bigint] IDENTITY(1,1) NOT NULL,
	[IdAuthUser] [bigint] NULL,
	[ApiKey] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ApiKey] PRIMARY KEY CLUSTERED 
(
	[IdApiKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articoli]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articoli](
	[IdArticolo] [bigint] IDENTITY(1,1) NOT NULL,
	[CodProdotto] [nvarchar](50) NOT NULL,
	[IndiceRevisione] [smallint] NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[IdUm] [nvarchar](50) NULL,
	[CodProdottoErp] [nvarchar](50) NULL,
	[Lunghezza] [float] NULL,
	[Larghezza] [float] NULL,
	[Altezza] [float] NULL,
	[Spessore] [float] NULL,
	[Diametro] [float] NULL,
	[DiametroEsterno] [float] NULL,
	[PesoNetto] [float] NULL,
	[PesoLordo] [float] NULL,
	[PesoSpecifico] [float] NULL,
	[IdTipoProdotto] [nvarchar](25) NULL,
	[Note] [nvarchar](max) NULL,
	[DataRevisione] [datetime] NULL,
	[DataModifica] [datetime] NULL,
	[FlObsoleto] [smallint] NULL,
	[PrezzoVendita] [float] NULL,
	[PercRicarico] [float] NULL,
	[FlGestioneLotti] [smallint] NULL,
	[FlUltimaRevisione] [smallint] NULL,
	[IdUmLunghezza] [nvarchar](50) NULL,
	[IdUmLarghezza] [nvarchar](50) NULL,
	[IdUmAltezza] [nvarchar](50) NULL,
	[IdUmSpessore] [nvarchar](50) NULL,
	[IdUmDiametro] [nvarchar](50) NULL,
	[IdUmDiametroEsterno] [nvarchar](50) NULL,
	[IdUmPesoNetto] [nvarchar](50) NULL,
	[IdUmPesoLordo] [nvarchar](50) NULL,
	[IdUmPesoSpecifico] [nvarchar](50) NULL,
 CONSTRAINT [PK_Articoli] PRIMARY KEY CLUSTERED 
(
	[IdArticolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Articoli] UNIQUE NONCLUSTERED 
(
	[CodProdotto] ASC,
	[IndiceRevisione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticoliAllegati]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticoliAllegati](
	[IdArticoloAllegato] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticolo] [bigint] NOT NULL,
	[TipoAllegato] [nvarchar](15) NULL,
	[PathAllegato] [nvarchar](max) NULL,
	[IdArticoloFase] [bigint] NULL,
 CONSTRAINT [PK_ArticoliAllegati] PRIMARY KEY CLUSTERED 
(
	[IdArticoloAllegato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticoliEstensioni]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticoliEstensioni](
	[IdArticoloEstensione] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticolo] [bigint] NOT NULL,
	[Campo] [nvarchar](max) NULL,
	[Valore] [nvarchar](max) NULL,
 CONSTRAINT [PK_ArticoliEstensioni] PRIMARY KEY CLUSTERED 
(
	[IdArticoloEstensione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticoliFasi]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticoliFasi](
	[IdArticoloFase] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticolo] [bigint] NOT NULL,
	[IdFase] [nvarchar](50) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[IdMacchina] [bigint] NOT NULL,
	[TPLHH] [int] NULL,
	[TPLMM] [int] NULL,
	[TPLSS] [int] NULL,
	[TPLMS] [int] NULL,
	[TPAHH] [int] NULL,
	[TPAMM] [int] NULL,
	[TPASS] [int] NULL,
	[PartProgram1] [nvarchar](max) NULL,
	[PartProgram2] [nvarchar](max) NULL,
	[PartProgram3] [nvarchar](max) NULL,
	[PartProgram4] [nvarchar](max) NULL,
	[PartProgram5] [nvarchar](max) NULL,
	[Ordinamento] [smallint] NULL,
	[FlUltimaFase] [smallint] NULL,
	[Moltiplicatore] [float] NULL,
	[FlFaseEsterna] [smallint] NULL,
	[IdUm] [nvarchar](50) NULL,
	[ConversioneUm] [float] NULL,
	[NoteFase] [nvarchar](max) NULL,
	[ValoreIncDec] [float] NULL,
	[FlPercentualeIncDec] [smallint] NULL,
 CONSTRAINT [PK_ArticoliFasi] PRIMARY KEY CLUSTERED 
(
	[IdArticoloFase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticoliFasiAttrezzi]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticoliFasiAttrezzi](
	[IdArticoloFaseAttrezzo] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticoloFase] [bigint] NOT NULL,
	[IdAttrezzo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ArticoliFasiAttrezzi] PRIMARY KEY CLUSTERED 
(
	[IdArticoloFaseAttrezzo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticoliFasiLinea]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticoliFasiLinea](
	[IdArticoloFaseLinea] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticoloFase] [bigint] NULL,
	[IdMacchina] [bigint] NULL,
	[IdUm] [nvarchar](50) NULL,
	[ConversioneUm] [float] NULL,
	[NoteFaseLinea] [nvarchar](max) NULL,
	[PartProgram1] [nvarchar](max) NULL,
	[PartProgram2] [nvarchar](max) NULL,
	[PartProgram3] [nvarchar](max) NULL,
	[PartProgram4] [nvarchar](max) NULL,
	[PartProgram5] [nvarchar](max) NULL,
	[OrdinamentoLinea] [smallint] NULL,
	[FlAutoInvioInMacchina] [smallint] NULL,
	[Moltiplicatore] [float] NULL,
 CONSTRAINT [PK_ArticoliFasiLinea] PRIMARY KEY CLUSTERED 
(
	[IdArticoloFaseLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticoliFasiMacchine]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticoliFasiMacchine](
	[IdArticoloFaseMacchina] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticoloFase] [bigint] NOT NULL,
	[IdMacchina] [bigint] NOT NULL,
	[PartProgram1] [nvarchar](max) NULL,
	[PartProgram2] [nvarchar](max) NULL,
	[PartProgram3] [nvarchar](max) NULL,
	[PartProgram4] [nvarchar](max) NULL,
	[PartProgram5] [nvarchar](max) NULL,
 CONSTRAINT [PK_ArticoliFasiMacchine] PRIMARY KEY CLUSTERED 
(
	[IdArticoloFaseMacchina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ArticoliFasiMacchine] UNIQUE NONCLUSTERED 
(
	[IdArticoloFase] ASC,
	[IdMacchina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticoliMateriali]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticoliMateriali](
	[IdArticoloMateriale] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticoloFase] [bigint] NOT NULL,
	[IdMateriale] [bigint] NOT NULL,
	[IdUm] [nvarchar](50) NULL,
	[QuantitaMateriale] [float] NULL,
	[CostoMateriale] [float] NULL,
	[IdFornitore] [bigint] NULL,
	[CostoFornitore] [float] NULL,
 CONSTRAINT [PK_ArticoliMateriali] PRIMARY KEY CLUSTERED 
(
	[IdArticoloMateriale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attrezzi]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attrezzi](
	[IdAttrezzo] [nvarchar](50) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
 CONSTRAINT [PK_Attrezzi] PRIMARY KEY CLUSTERED 
(
	[IdAttrezzo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](150) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Azienda]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Azienda](
	[IdAzienda] [nvarchar](15) NOT NULL,
	[RagioneSociale] [nvarchar](255) NULL,
	[PartitaIva] [nvarchar](25) NULL,
 CONSTRAINT [PK_Azienda] PRIMARY KEY CLUSTERED 
(
	[IdAzienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clienti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clienti](
	[IdCliente] [bigint] IDENTITY(1,1) NOT NULL,
	[RagioneSociale] [nvarchar](255) NULL,
	[CodClienteErp] [nvarchar](50) NULL,
	[FlObsoleto] [smallint] NULL,
 CONSTRAINT [PK_Clienti] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commesse]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commesse](
	[IdCommessa] [bigint] IDENTITY(1,1) NOT NULL,
	[CodCommessa] [nvarchar](50) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
 CONSTRAINT [PK_Commesse] PRIMARY KEY CLUSTERED 
(
	[IdCommessa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Commesse] UNIQUE NONCLUSTERED 
(
	[CodCommessa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configurazioni]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurazioni](
	[IdConfigurazione] [smallint] NOT NULL,
	[PathLogo] [nvarchar](max) NULL,
	[FlVisualizzaCliente] [smallint] NULL,
	[FlGruppiMacchine] [smallint] NULL,
	[FlControlloFasi] [smallint] NULL,
	[FlGenerazioneLotti] [smallint] NULL,
	[FormatoGenerazioneLotti] [nvarchar](max) NULL,
	[LunghezzaProgrLotti] [smallint] NULL,
 CONSTRAINT [PK_Configurazioni] PRIMARY KEY CLUSTERED 
(
	[IdConfigurazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime2](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExecRegistri]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExecRegistri](
	[IdExecRegistri] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMacchina] [bigint] NULL,
	[CodMacchina] [nvarchar](50) NULL,
	[Registro] [nvarchar](max) NULL,
	[Valore] [nvarchar](max) NULL,
 CONSTRAINT [PK_ExecRegistri] PRIMARY KEY CLUSTERED 
(
	[IdExecRegistri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fasi]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fasi](
	[IdFase] [nvarchar](50) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[CodFaseErp] [nvarchar](50) NULL,
 CONSTRAINT [PK_Fasi] PRIMARY KEY CLUSTERED 
(
	[IdFase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornitori]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornitori](
	[IdFornitore] [bigint] IDENTITY(1,1) NOT NULL,
	[RagioneSociale] [nvarchar](255) NULL,
	[CodFornitoreErp] [nvarchar](50) NULL,
	[FlObsoleto] [smallint] NULL,
 CONSTRAINT [PK_Fornitori] PRIMARY KEY CLUSTERED 
(
	[IdFornitore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GruppiMacchine]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GruppiMacchine](
	[IdGruppoMacchine] [nvarchar](25) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
 CONSTRAINT [PK_GruppiMacchine] PRIMARY KEY CLUSTERED 
(
	[IdGruppoMacchine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GruppiRegistri]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GruppiRegistri](
	[IdGruppoRegistri] [nvarchar](25) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[Ordinamento] [smallint] NULL,
 CONSTRAINT [PK_GruppiRegistri] PRIMARY KEY CLUSTERED 
(
	[IdGruppoRegistri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listini]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listini](
	[IdListino] [bigint] IDENTITY(1,1) NOT NULL,
	[TipoCodice] [nvarchar](15) NULL,
	[IdTabella] [nvarchar](255) NULL,
	[DataInizioValidita] [datetime] NULL,
	[DataFineValidita] [datetime] NULL,
	[Prezzo] [float] NULL,
	[IdFornitore] [bigint] NULL,
	[FlPreferenziale] [smallint] NULL,
 CONSTRAINT [PK_Listini] PRIMARY KEY CLUSTERED 
(
	[IdListino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lotti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lotti](
	[IdLotto] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticolo] [bigint] NULL,
	[NumeroLotto] [nvarchar](255) NOT NULL,
	[Quantita] [float] NULL,
	[DataRicezione] [datetime] NULL,
	[IdFornitore] [bigint] NULL,
	[DdtFornitore] [nvarchar](50) NULL,
	[DataScadenza] [datetime] NULL,
	[Colli] [int] NULL,
	[IdAuthUser] [bigint] NULL,
 CONSTRAINT [PK_Lotti] PRIMARY KEY CLUSTERED 
(
	[IdLotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Lotti] UNIQUE NONCLUSTERED 
(
	[NumeroLotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Macchine]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Macchine](
	[IdMacchina] [bigint] IDENTITY(1,1) NOT NULL,
	[CodMacchina] [nvarchar](50) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[IndirizzoMacchina] [nvarchar](50) NULL,
	[Porta] [nvarchar](8) NULL,
	[Note] [nvarchar](max) NULL,
	[NumeroSeriale] [nvarchar](255) NULL,
	[Matricola] [nvarchar](255) NULL,
	[IdTipoComunicazione] [nvarchar](25) NULL,
	[IdGruppoMacchine] [nvarchar](25) NULL,
	[IdReparto] [nvarchar](25) NULL,
	[IdStabilimento] [nvarchar](25) NULL,
	[FlObsoleto] [smallint] NULL,
	[CodMacchinaErp] [nvarchar](50) NULL,
	[FlAttrezzaggio] [smallint] NULL,
	[FlConsuntivazioneMan] [smallint] NULL,
	[FlMultiordine] [smallint] NULL,
	[FlPresidioOper] [smallint] NULL,
	[NumOperPresidio] [smallint] NULL,
	[FlSolaLettura] [smallint] NULL,
	[FlFornitoreTerzista] [smallint] NULL,
	[FlGestSemplificata] [smallint] NULL,
	[FlMacchinaLinea] [smallint] NULL,
	[ConsumoElettricoKwh] [float] NULL,
	[ConsumoGas] [float] NULL,
 CONSTRAINT [PK_Macchine] PRIMARY KEY CLUSTERED 
(
	[IdMacchina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Macchine] UNIQUE NONCLUSTERED 
(
	[CodMacchina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MacchineReg]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MacchineReg](
	[IdMacchina] [bigint] NOT NULL,
	[IdRegistro] [nvarchar](50) NOT NULL,
	[Registro] [nvarchar](max) NULL,
	[Descrizione] [nvarchar](255) NULL,
	[FlTipoConteggio] [smallint] NULL,
	[Formato] [nvarchar](25) NULL,
	[IdUm] [nvarchar](50) NULL,
	[FlWeb] [smallint] NULL,
	[Conversione] [nvarchar](max) NULL,
	[FlInizioLavoro] [smallint] NULL,
	[ValoreInizio] [nvarchar](max) NULL,
	[FlFineLavoro] [smallint] NULL,
	[ValoreFine] [nvarchar](max) NULL,
	[FlEditabile] [smallint] NULL,
	[ValoreByte] [smallint] NULL,
	[Precisione] [smallint] NULL,
	[FlAllarme] [smallint] NULL,
	[ValoreAllarme] [nvarchar](20) NULL,
	[FlStato] [smallint] NULL,
	[ValoreStato] [nvarchar](20) NULL,
	[FlFermoMacchina] [smallint] NULL,
	[ValoreFermoMacchina] [nvarchar](20) NULL,
	[FlScarto] [smallint] NULL,
	[IdGruppoRegistri] [nvarchar](25) NULL,
	[Ordinamento] [smallint] NULL,
	[OrdinamentoInvio] [smallint] NULL,
 CONSTRAINT [PK_MacchineReg] PRIMARY KEY CLUSTERED 
(
	[IdMacchina] ASC,
	[IdRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MacchineTrc]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MacchineTrc](
	[IdMacchinaTrc] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMacchina] [bigint] NOT NULL,
	[IdRegistro] [nvarchar](50) NOT NULL,
	[IndirizzoMacchina] [nvarchar](50) NULL,
	[OldValore] [nvarchar](max) NULL,
	[Valore] [nvarchar](max) NULL,
	[DataValore] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[IdOdl] [bigint] NULL,
	[IdAuthUser] [bigint] NULL,
	[IdRegistroScarto] [nvarchar](50) NULL,
	[IdUm] [nvarchar](50) NULL,
 CONSTRAINT [PK_MacchineTrc] PRIMARY KEY CLUSTERED 
(
	[IdMacchinaTrc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [bigint] NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[Icona] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[Parametri] [nvarchar](max) NULL,
	[VoceAttiva] [nvarchar](255) NULL,
	[IdMenuPadre] [bigint] NULL,
	[Ordinamento] [smallint] NULL,
 CONSTRAINT [PK_Menu_1] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuUtenti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuUtenti](
	[IdMenu] [bigint] NOT NULL,
	[IdAuthUser] [int] NOT NULL,
 CONSTRAINT [PK_MenuUtenti] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC,
	[IdAuthUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdiniDiLavoro]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdiniDiLavoro](
	[IdOdl] [bigint] IDENTITY(1,1) NOT NULL,
	[Esercizio] [int] NULL,
	[NumeroOdl] [bigint] NULL,
	[NumeroOdp] [bigint] NULL,
	[NumeroOdlErp] [nvarchar](255) NULL,
	[NumeroOdlErpView] [nvarchar](255) NULL,
	[Rilavorazione] [nvarchar](50) NULL,
	[Sequenza] [int] NULL,
	[IdArticolo] [bigint] NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[IdUm] [nvarchar](50) NULL,
	[QuantitaLav] [float] NULL,
	[PartProgram1] [nvarchar](max) NULL,
	[PartProgram2] [nvarchar](max) NULL,
	[PartProgram3] [nvarchar](max) NULL,
	[PartProgram4] [nvarchar](max) NULL,
	[PartProgram5] [nvarchar](max) NULL,
	[Lunghezza] [float] NULL,
	[Larghezza] [float] NULL,
	[Altezza] [float] NULL,
	[Spessore] [float] NULL,
	[Diametro] [float] NULL,
	[DiametroEsterno] [float] NULL,
	[PesoNetto] [float] NULL,
	[PesoLordo] [float] NULL,
	[PesoSpecifico] [float] NULL,
	[DataOraInserimento] [datetime] NULL,
	[DataOraInvioProduzione] [datetime] NULL,
	[DataOraFineProduzione] [datetime] NULL,
	[DataOraInizioPrevista] [datetime] NULL,
	[DataOraFinePrevista] [datetime] NULL,
	[DataConsegna] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[IdCliente] [bigint] NULL,
	[IdMacchina] [bigint] NULL,
	[IdCommessa] [bigint] NULL,
	[IdArticoloFase] [bigint] NULL,
	[IdFase] [nvarchar](50) NULL,
	[DescrizioneFase] [nvarchar](255) NULL,
	[FlStato] [smallint] NULL,
	[FlDefinitivo] [smallint] NULL,
	[IdOrigineOrdini] [nvarchar](25) NULL,
	[TPLHH] [int] NULL,
	[TPLMM] [int] NULL,
	[TPLSS] [int] NULL,
	[TPLMS] [int] NULL,
	[TPAHH] [int] NULL,
	[TPAMM] [int] NULL,
	[TPASS] [int] NULL,
	[TPLTGG] [int] NULL,
	[TPLTHH] [int] NULL,
	[TPLTMM] [int] NULL,
	[TPLTSS] [int] NULL,
	[TPLTMS] [int] NULL,
	[FlFaseEsterna] [smallint] NULL,
	[Costo] [float] NULL,
	[ImportoNetto] [float] NULL,
	[IdOdlRif] [bigint] NULL,
	[IdUmBase] [nvarchar](50) NULL,
	[QuantitaLavBase] [float] NULL,
	[ConversioneUm] [float] NULL,
	[FlLavorazioneAgg] [smallint] NULL,
	[Moltiplicatore] [float] NULL,
	[IdUmLunghezza] [nvarchar](50) NULL,
	[IdUmLarghezza] [nvarchar](50) NULL,
	[IdUmAltezza] [nvarchar](50) NULL,
	[IdUmSpessore] [nvarchar](50) NULL,
	[IdUmDiametro] [nvarchar](50) NULL,
	[IdUmDiametroEsterno] [nvarchar](50) NULL,
	[IdUmPesoNetto] [nvarchar](50) NULL,
	[IdUmPesoLordo] [nvarchar](50) NULL,
	[IdUmPesoSpecifico] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrdiniDiLavoro] PRIMARY KEY CLUSTERED 
(
	[IdOdl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdiniDiLavoroLinea]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdiniDiLavoroLinea](
	[IdOdlLinea] [bigint] IDENTITY(1,1) NOT NULL,
	[IdOdl] [bigint] NOT NULL,
	[IdMacchina] [bigint] NULL,
	[IdUm] [nvarchar](50) NULL,
	[ConversioneUm] [float] NULL,
	[NoteFaseLinea] [nvarchar](max) NULL,
	[PartProgram1] [nvarchar](max) NULL,
	[PartProgram2] [nvarchar](max) NULL,
	[PartProgram3] [nvarchar](max) NULL,
	[PartProgram4] [nvarchar](max) NULL,
	[PartProgram5] [nvarchar](max) NULL,
	[OrdinamentoLinea] [smallint] NULL,
	[FlAutoInvioInMacchina] [smallint] NULL,
	[Moltiplicatore] [float] NULL,
 CONSTRAINT [PK_OrdiniDiLavoroLinea] PRIMARY KEY CLUSTERED 
(
	[IdOdlLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdiniDiLavoroLotti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdiniDiLavoroLotti](
	[IdOdlLotto] [bigint] IDENTITY(1,1) NOT NULL,
	[IdArticolo] [bigint] NULL,
	[IdOdl] [bigint] NULL,
	[IdOdlMateriale] [bigint] NULL,
	[NumeroLotto] [nvarchar](255) NOT NULL,
	[Quantita] [float] NULL,
	[DataRegistrazione] [datetime] NULL,
	[DataScadenza] [datetime] NULL,
	[IdAuthUser] [bigint] NULL,
 CONSTRAINT [PK_OrdiniDiLavoroLotti] PRIMARY KEY CLUSTERED 
(
	[IdOdlLotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdiniDiLavoroMateriali]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdiniDiLavoroMateriali](
	[IdOdlMateriale] [bigint] IDENTITY(1,1) NOT NULL,
	[IdOdl] [bigint] NOT NULL,
	[IdArticoloMateriale] [bigint] NULL,
	[IdMateriale] [bigint] NULL,
	[DescrizioneMateriale] [nvarchar](255) NULL,
	[IdUm] [nvarchar](50) NULL,
	[QuantitaSingola] [float] NULL,
	[QuantitaTotale] [float] NULL,
	[IdFornitore] [bigint] NULL,
	[Costo] [float] NULL,
	[QuantitaTotalePrev] [float] NULL,
 CONSTRAINT [PK_OrdiniDiLavoroMateriali] PRIMARY KEY CLUSTERED 
(
	[IdOdlMateriale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OriginiOrdini]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OriginiOrdini](
	[IdOrigineOrdini] [nvarchar](25) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[FlTipoOrigine] [smallint] NULL,
 CONSTRAINT [PK_OriginiOrdini] PRIMARY KEY CLUSTERED 
(
	[IdOrigineOrdini] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protocolli]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protocolli](
	[IdProtocollo] [bigint] IDENTITY(1,1) NOT NULL,
	[TipoProtocollo] [nvarchar](15) NULL,
	[Esercizio] [int] NULL,
	[Numero] [bigint] NULL,
 CONSTRAINT [PK_Protocolli] PRIMARY KEY CLUSTERED 
(
	[IdProtocollo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistriDefault]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistriDefault](
	[IdRegistroDefault] [nvarchar](50) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
 CONSTRAINT [PK_RegistriDefault] PRIMARY KEY CLUSTERED 
(
	[IdRegistroDefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparti](
	[IdReparto] [nvarchar](25) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
 CONSTRAINT [PK_Reparti] PRIMARY KEY CLUSTERED 
(
	[IdReparto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stabilimenti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stabilimenti](
	[IdStabilimento] [nvarchar](25) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
 CONSTRAINT [PK_Stabilimenti] PRIMARY KEY CLUSTERED 
(
	[IdStabilimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipiComunicazione]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipiComunicazione](
	[IdTipoComunicazione] [nvarchar](25) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
	[FlTipoGestione] [smallint] NULL,
 CONSTRAINT [PK_TipoComunicazione] PRIMARY KEY CLUSTERED 
(
	[IdTipoComunicazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipiProdotto]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipiProdotto](
	[IdTipoProdotto] [nvarchar](25) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
 CONSTRAINT [PK_TipiProdotto] PRIMARY KEY CLUSTERED 
(
	[IdTipoProdotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitaMisura]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitaMisura](
	[IdUm] [nvarchar](50) NOT NULL,
	[Descrizione] [nvarchar](255) NULL,
 CONSTRAINT [PK_UnitaMisura] PRIMARY KEY CLUSTERED 
(
	[IdUm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utenti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utenti](
	[IdUtente] [bigint] IDENTITY(1,1) NOT NULL,
	[IdAuthUser] [int] NOT NULL,
	[FlOperatore] [smallint] NULL,
	[FlInvioEmail] [smallint] NULL,
	[CodUtenteErp] [nvarchar](50) NULL,
	[ConfigPortale] [nvarchar](max) NULL,
 CONSTRAINT [PK_Utenti] PRIMARY KEY CLUSTERED 
(
	[IdUtente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtentiReparti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtentiReparti](
	[IdUtenteReparto] [bigint] IDENTITY(1,1) NOT NULL,
	[IdAuthUser] [int] NULL,
	[IdReparto] [nvarchar](25) NULL,
 CONSTRAINT [PK_UtentiReparti] PRIMARY KEY CLUSTERED 
(
	[IdUtenteReparto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_UtentiReparti] UNIQUE NONCLUSTERED 
(
	[IdAuthUser] ASC,
	[IdReparto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtentiStabilimenti]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtentiStabilimenti](
	[IdUtenteStabilimento] [bigint] IDENTITY(1,1) NOT NULL,
	[IdAuthUser] [int] NULL,
	[IdStabilimento] [nvarchar](25) NULL,
 CONSTRAINT [PK_UtentiStabilimenti] PRIMARY KEY CLUSTERED 
(
	[IdUtenteStabilimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_UtentiStabilimenti] UNIQUE NONCLUSTERED 
(
	[IdAuthUser] ASC,
	[IdStabilimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Versione]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Versione](
	[IdVersione] [nvarchar](25) NOT NULL,
	[Versione] [nvarchar](255) NULL,
 CONSTRAINT [PK_Versione] PRIMARY KEY CLUSTERED 
(
	[IdVersione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 12/06/2023 08:48:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 12/06/2023 08:48:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 12/06/2023 08:48:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 12/06/2023 08:48:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 12/06/2023 08:48:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 12/06/2023 08:48:04 ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_CodProdottoErp]  DEFAULT (N'') FOR [CodProdottoErp]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_Lunghezza]  DEFAULT ((0)) FOR [Lunghezza]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_Larghezza]  DEFAULT ((0)) FOR [Larghezza]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_Altezza]  DEFAULT ((0)) FOR [Altezza]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_Spessore]  DEFAULT ((0)) FOR [Spessore]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_Diametro]  DEFAULT ((0)) FOR [Diametro]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_DiametroEsterno]  DEFAULT ((0)) FOR [DiametroEsterno]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_PesoNetto]  DEFAULT ((0)) FOR [PesoNetto]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_PesoLordo]  DEFAULT ((0)) FOR [PesoLordo]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_PesoSpecifico]  DEFAULT ((0)) FOR [PesoSpecifico]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_FlObsoleto]  DEFAULT ((0)) FOR [FlObsoleto]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_PrezzoVendita]  DEFAULT ((0)) FOR [PrezzoVendita]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_PercRicarico]  DEFAULT ((0)) FOR [PercRicarico]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_FlGestioneLotti]  DEFAULT ((0)) FOR [FlGestioneLotti]
GO
ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_FlUltimaRevisione]  DEFAULT ((0)) FOR [FlUltimaRevisione]
GO
ALTER TABLE [dbo].[ArticoliAllegati] ADD  CONSTRAINT [DF_ArticoliAllegati_TipoAllegato]  DEFAULT (N'') FOR [TipoAllegato]
GO
ALTER TABLE [dbo].[ArticoliEstensioni] ADD  CONSTRAINT [DF_ArticoliEstensioni_Campo]  DEFAULT (N'') FOR [Campo]
GO
ALTER TABLE [dbo].[ArticoliEstensioni] ADD  CONSTRAINT [DF_ArticoliEstensioni_Valore]  DEFAULT (N'') FOR [Valore]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_TPLHH]  DEFAULT ((0)) FOR [TPLHH]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_TPLMM]  DEFAULT ((0)) FOR [TPLMM]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_TPLSS]  DEFAULT ((0)) FOR [TPLSS]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_TPLMS]  DEFAULT ((0)) FOR [TPLMS]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_TPAHH]  DEFAULT ((0)) FOR [TPAHH]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_TPAMM]  DEFAULT ((0)) FOR [TPAMM]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_TPASS]  DEFAULT ((0)) FOR [TPASS]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_Ordinamento]  DEFAULT ((0)) FOR [Ordinamento]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_FlUltimaFase]  DEFAULT ((0)) FOR [FlUltimaFase]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_Moltiplicatore]  DEFAULT ((0)) FOR [Moltiplicatore]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_FlFaseEsterna]  DEFAULT ((0)) FOR [FlFaseEsterna]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_ConversioneUm]  DEFAULT ((1)) FOR [ConversioneUm]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_ValoreIncDec]  DEFAULT ((0)) FOR [ValoreIncDec]
GO
ALTER TABLE [dbo].[ArticoliFasi] ADD  CONSTRAINT [DF_ArticoliFasi_FlPercentualeIncDec]  DEFAULT ((0)) FOR [FlPercentualeIncDec]
GO
ALTER TABLE [dbo].[ArticoliFasiLinea] ADD  CONSTRAINT [DF_ArticoliFasiLinea_ConversioneUm]  DEFAULT ((1)) FOR [ConversioneUm]
GO
ALTER TABLE [dbo].[ArticoliFasiLinea] ADD  CONSTRAINT [DF_ArticoliFasiLinea_OrdinamentoLinea]  DEFAULT ((0)) FOR [OrdinamentoLinea]
GO
ALTER TABLE [dbo].[ArticoliFasiLinea] ADD  CONSTRAINT [DF_ArticoliFasiLinea_FlAutoInvioInMacchina]  DEFAULT ((0)) FOR [FlAutoInvioInMacchina]
GO
ALTER TABLE [dbo].[ArticoliFasiLinea] ADD  CONSTRAINT [DF_ArticoliFasiLinea_Moltiplicatore]  DEFAULT ((0)) FOR [Moltiplicatore]
GO
ALTER TABLE [dbo].[ArticoliMateriali] ADD  CONSTRAINT [DF_ArticoliMateriali_QuantitaMateriale]  DEFAULT ((0)) FOR [QuantitaMateriale]
GO
ALTER TABLE [dbo].[ArticoliMateriali] ADD  CONSTRAINT [DF_ArticoliMateriali_CostoMateriale]  DEFAULT ((0)) FOR [CostoMateriale]
GO
ALTER TABLE [dbo].[ArticoliMateriali] ADD  CONSTRAINT [DF_ArticoliMateriali_CostoFornitore]  DEFAULT ((0)) FOR [CostoFornitore]
GO
ALTER TABLE [dbo].[Attrezzi] ADD  CONSTRAINT [DF_Attrezzi_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Azienda] ADD  CONSTRAINT [DF_Azienda_RagioneSociale]  DEFAULT (N'') FOR [RagioneSociale]
GO
ALTER TABLE [dbo].[Azienda] ADD  CONSTRAINT [DF_Azienda_PartitaIva]  DEFAULT (N'') FOR [PartitaIva]
GO
ALTER TABLE [dbo].[Clienti] ADD  CONSTRAINT [DF_Clienti_RagioneSociale]  DEFAULT (N'') FOR [RagioneSociale]
GO
ALTER TABLE [dbo].[Clienti] ADD  CONSTRAINT [DF_Clienti_CodClienteErp]  DEFAULT (N'') FOR [CodClienteErp]
GO
ALTER TABLE [dbo].[Clienti] ADD  CONSTRAINT [DF_Clienti_FlObsoleto]  DEFAULT ((0)) FOR [FlObsoleto]
GO
ALTER TABLE [dbo].[Commesse] ADD  CONSTRAINT [DF_Commesse_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_PathLogo]  DEFAULT (N'') FOR [PathLogo]
GO
ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_FlVisualizzaCliente]  DEFAULT ((0)) FOR [FlVisualizzaCliente]
GO
ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_FlGruppiMacchine]  DEFAULT ((0)) FOR [FlGruppiMacchine]
GO
ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_FlControlloFasi]  DEFAULT ((0)) FOR [FlControlloFasi]
GO
ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_FlGenerazioneLotti]  DEFAULT ((0)) FOR [FlGenerazioneLotti]
GO
ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_FormatoGenerazioneLotti]  DEFAULT (N'') FOR [FormatoGenerazioneLotti]
GO
ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_LunghezzaProgrLotti]  DEFAULT ((0)) FOR [LunghezzaProgrLotti]
GO
ALTER TABLE [dbo].[ExecRegistri] ADD  CONSTRAINT [DF_ExecRegistri_Registro]  DEFAULT (N'') FOR [Registro]
GO
ALTER TABLE [dbo].[ExecRegistri] ADD  CONSTRAINT [DF_ExecRegistri_Valore]  DEFAULT (N'') FOR [Valore]
GO
ALTER TABLE [dbo].[Fasi] ADD  CONSTRAINT [DF_Fasi_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Fasi] ADD  CONSTRAINT [DF_Fasi_CodFaseErp]  DEFAULT (N'') FOR [CodFaseErp]
GO
ALTER TABLE [dbo].[Fornitori] ADD  CONSTRAINT [DF_Fornitori_RagioneSociale]  DEFAULT (N'') FOR [RagioneSociale]
GO
ALTER TABLE [dbo].[Fornitori] ADD  CONSTRAINT [DF_Fornitori_CodFornitoreErp]  DEFAULT (N'') FOR [CodFornitoreErp]
GO
ALTER TABLE [dbo].[Fornitori] ADD  CONSTRAINT [DF_Fornitori_FlObsoleto]  DEFAULT ((0)) FOR [FlObsoleto]
GO
ALTER TABLE [dbo].[GruppiMacchine] ADD  CONSTRAINT [DF_GruppiMacchine_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[GruppiRegistri] ADD  CONSTRAINT [DF_GruppoRegistri_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[GruppiRegistri] ADD  CONSTRAINT [DF_GruppoRegistri_Ordinamento]  DEFAULT ((0)) FOR [Ordinamento]
GO
ALTER TABLE [dbo].[Listini] ADD  CONSTRAINT [DF_Listini_TipoCodice]  DEFAULT (N'') FOR [TipoCodice]
GO
ALTER TABLE [dbo].[Listini] ADD  CONSTRAINT [DF_Listini_IdTabella]  DEFAULT (N'') FOR [IdTabella]
GO
ALTER TABLE [dbo].[Listini] ADD  CONSTRAINT [DF_Listini_Prezzo]  DEFAULT ((0)) FOR [Prezzo]
GO
ALTER TABLE [dbo].[Listini] ADD  CONSTRAINT [DF_Listini_FlPreferenziale]  DEFAULT ((0)) FOR [FlPreferenziale]
GO
ALTER TABLE [dbo].[Lotti] ADD  CONSTRAINT [DF_Lotti_Quantita]  DEFAULT ((0)) FOR [Quantita]
GO
ALTER TABLE [dbo].[Lotti] ADD  CONSTRAINT [DF_Lotti_DdtFornitore]  DEFAULT (N'') FOR [DdtFornitore]
GO
ALTER TABLE [dbo].[Lotti] ADD  CONSTRAINT [DF_Lotti_Colli]  DEFAULT ((0)) FOR [Colli]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_IndirizzoMacchina]  DEFAULT (N'') FOR [IndirizzoMacchina]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_Porta]  DEFAULT (N'') FOR [Porta]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_NumeroSeriale]  DEFAULT (N'') FOR [NumeroSeriale]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_Matricola]  DEFAULT (N'') FOR [Matricola]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlObsoleto]  DEFAULT ((0)) FOR [FlObsoleto]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_CodMacchinaErp]  DEFAULT (N'') FOR [CodMacchinaErp]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlAttrezzaggio]  DEFAULT ((0)) FOR [FlAttrezzaggio]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlConsuntivazioneMan]  DEFAULT ((0)) FOR [FlConsuntivazioneMan]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlMultiordine]  DEFAULT ((0)) FOR [FlMultiordine]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlPresidioOper]  DEFAULT ((0)) FOR [FlPresidioOper]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_NumOperPresidio]  DEFAULT ((0)) FOR [NumOperPresidio]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlSolaLettura]  DEFAULT ((0)) FOR [FlSolaLettura]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlFornitoreTerzista]  DEFAULT ((0)) FOR [FlFornitoreTerzista]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlGestSemplificata]  DEFAULT ((0)) FOR [FlGestSemplificata]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_FlMacchinaLinea]  DEFAULT ((0)) FOR [FlMacchinaLinea]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_ConsumoElettricoKwh]  DEFAULT ((0)) FOR [ConsumoElettricoKwh]
GO
ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_ConsumoGas]  DEFAULT ((0)) FOR [ConsumoGas]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlTipoConteggio]  DEFAULT ((0)) FOR [FlTipoConteggio]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_Formato]  DEFAULT (N'') FOR [Formato]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlWeb]  DEFAULT ((0)) FOR [FlWeb]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlInizioLavoro]  DEFAULT ((0)) FOR [FlInizioLavoro]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlFineLavoro]  DEFAULT ((0)) FOR [FlFineLavoro]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlEditabile]  DEFAULT ((0)) FOR [FlEditabile]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_ValoreByte]  DEFAULT ((0)) FOR [ValoreByte]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_Precisione]  DEFAULT ((0)) FOR [Precisione]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlAllarme]  DEFAULT ((0)) FOR [FlAllarme]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_ValoreAllarme]  DEFAULT (N'') FOR [ValoreAllarme]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlStato]  DEFAULT ((0)) FOR [FlStato]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_ValoreStato]  DEFAULT (N'') FOR [ValoreStato]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlFermoMacchina]  DEFAULT ((0)) FOR [FlFermoMacchina]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_ValoreFermoMacchina]  DEFAULT (N'') FOR [ValoreFermoMacchina]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_FlScarto]  DEFAULT ((0)) FOR [FlScarto]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_IdGruppoRegistri]  DEFAULT (N'') FOR [IdGruppoRegistri]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_Ordinamento]  DEFAULT ((0)) FOR [Ordinamento]
GO
ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_OrdinamentoInvio]  DEFAULT ((0)) FOR [OrdinamentoInvio]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Icona]  DEFAULT (N'') FOR [Icona]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Url]  DEFAULT (N'') FOR [Url]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Parametri]  DEFAULT (N'') FOR [Parametri]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_VoceAttiva]  DEFAULT (N'') FOR [VoceAttiva]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Ordinamento]  DEFAULT ((0)) FOR [Ordinamento]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_NumeroOdlErp]  DEFAULT (N'') FOR [NumeroOdlErp]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_NumeroOdlErpView]  DEFAULT (N'') FOR [NumeroOdlErpView]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Rilavorazione]  DEFAULT (N'') FOR [Rilavorazione]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Sequenza]  DEFAULT ((0)) FOR [Sequenza]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_QuantitaLav]  DEFAULT ((0)) FOR [QuantitaLav]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Lunghezza]  DEFAULT ((0)) FOR [Lunghezza]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Larghezza]  DEFAULT ((0)) FOR [Larghezza]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Altezza]  DEFAULT ((0)) FOR [Altezza]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Spessore]  DEFAULT ((0)) FOR [Spessore]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Diametro]  DEFAULT ((0)) FOR [Diametro]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_DiametroEsterno]  DEFAULT ((0)) FOR [DiametroEsterno]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_PesoNetto]  DEFAULT ((0)) FOR [PesoNetto]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_PesoLordo]  DEFAULT ((0)) FOR [PesoLordo]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_PesoSpecifico]  DEFAULT ((0)) FOR [PesoSpecifico]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_DescrizioneFase]  DEFAULT (N'') FOR [DescrizioneFase]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_FlStato]  DEFAULT ((0)) FOR [FlStato]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_FlDefinitivo]  DEFAULT ((0)) FOR [FlDefinitivo]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLHH]  DEFAULT ((0)) FOR [TPLHH]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLMM]  DEFAULT ((0)) FOR [TPLMM]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLSS]  DEFAULT ((0)) FOR [TPLSS]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLMS]  DEFAULT ((0)) FOR [TPLMS]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPAHH]  DEFAULT ((0)) FOR [TPAHH]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPAMM]  DEFAULT ((0)) FOR [TPAMM]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPASS]  DEFAULT ((0)) FOR [TPASS]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLTGG]  DEFAULT ((0)) FOR [TPLTGG]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLTHH]  DEFAULT ((0)) FOR [TPLTHH]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLTMM]  DEFAULT ((0)) FOR [TPLTMM]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLTSS]  DEFAULT ((0)) FOR [TPLTSS]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_TPLTMS]  DEFAULT ((0)) FOR [TPLTMS]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_FlFaseEsterna]  DEFAULT ((0)) FOR [FlFaseEsterna]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Costo]  DEFAULT ((0)) FOR [Costo]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_ImportoNetto]  DEFAULT ((0)) FOR [ImportoNetto]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_FlLavorazioneAgg]  DEFAULT ((0)) FOR [FlLavorazioneAgg]
GO
ALTER TABLE [dbo].[OrdiniDiLavoro] ADD  CONSTRAINT [DF_OrdiniDiLavoro_Moltiplicatore]  DEFAULT ((0)) FOR [Moltiplicatore]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroLinea] ADD  CONSTRAINT [DF_OrdiniDiLavoroLinea_ConversioneUm]  DEFAULT ((1)) FOR [ConversioneUm]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroLinea] ADD  CONSTRAINT [DF_OrdiniDiLavoroLinea_OrdinamentoLinea]  DEFAULT ((0)) FOR [OrdinamentoLinea]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroLinea] ADD  CONSTRAINT [DF_OrdiniDiLavoroLinea_FlAutoInvioInMacchina]  DEFAULT ((0)) FOR [FlAutoInvioInMacchina]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroLinea] ADD  CONSTRAINT [DF_OrdiniDiLavoroLinea_Moltiplicatore]  DEFAULT ((0)) FOR [Moltiplicatore]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroLotti] ADD  CONSTRAINT [DF_OrdiniDiLavoroLotti_Quantita]  DEFAULT ((0)) FOR [Quantita]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroMateriali] ADD  CONSTRAINT [DF_OrdiniDiLavoroMateriali_DescrizioneMateriale]  DEFAULT (N'') FOR [DescrizioneMateriale]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroMateriali] ADD  CONSTRAINT [DF_OrdiniDiLavoroMateriali_QuantitaSingola]  DEFAULT ((0)) FOR [QuantitaSingola]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroMateriali] ADD  CONSTRAINT [DF_OrdiniDiLavoroMateriali_QuantitaTotale]  DEFAULT ((0)) FOR [QuantitaTotale]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroMateriali] ADD  CONSTRAINT [DF_OrdiniDiLavoroMateriali_Costo]  DEFAULT ((0)) FOR [Costo]
GO
ALTER TABLE [dbo].[OrdiniDiLavoroMateriali] ADD  CONSTRAINT [DF_OrdiniDiLavoroMateriali_QuantitaTotalePrev]  DEFAULT ((0)) FOR [QuantitaTotalePrev]
GO
ALTER TABLE [dbo].[OriginiOrdini] ADD  CONSTRAINT [DF_OriginiOrdini_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[OriginiOrdini] ADD  CONSTRAINT [DF_OriginiOrdini_FlTipoOrigine]  DEFAULT ((0)) FOR [FlTipoOrigine]
GO
ALTER TABLE [dbo].[Protocolli] ADD  CONSTRAINT [DF_Protocolli_Numero]  DEFAULT ((0)) FOR [Numero]
GO
ALTER TABLE [dbo].[RegistriDefault] ADD  CONSTRAINT [DF_RegistriDefault_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Reparti] ADD  CONSTRAINT [DF_Reparti_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Stabilimenti] ADD  CONSTRAINT [DF_Stabilimenti_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[TipiComunicazione] ADD  CONSTRAINT [DF_TipoComunicazione_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[TipiComunicazione] ADD  CONSTRAINT [DF_TipoComunicazione_FlTipoGestione]  DEFAULT ((0)) FOR [FlTipoGestione]
GO
ALTER TABLE [dbo].[TipiProdotto] ADD  CONSTRAINT [DF_TipiProdotto_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[UnitaMisura] ADD  CONSTRAINT [DF_UnitaMisura_Descrizione]  DEFAULT (N'') FOR [Descrizione]
GO
ALTER TABLE [dbo].[Utenti] ADD  CONSTRAINT [DF_Utenti_FlOperatore]  DEFAULT ((0)) FOR [FlOperatore]
GO
ALTER TABLE [dbo].[Utenti] ADD  CONSTRAINT [DF_Utenti_FlInvioEmail]  DEFAULT ((0)) FOR [FlInvioEmail]
GO
ALTER TABLE [dbo].[Utenti] ADD  CONSTRAINT [DF_Utenti_CodUtenteErp]  DEFAULT (N'') FOR [CodUtenteErp]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
/****** Object:  StoredProcedure [dbo].[spGetTracciatureOdl]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetTracciatureOdl]
	@IdOdl bigint
AS
BEGIN
	SET NOCOUNT ON;

	/************************************************************
	** Dichiarazione variabili temporanee e valori di ritorno **
	************************************************************/

	-- Variabili temporanee

	DECLARE @IdMacchina bigint
	DECLARE @IdArticoloFase bigint
	DECLARE @QuantitaLav float
	DECLARE @DataOdl datetime
	DECLARE @TPLTGG int
	DECLARE @TPLTHH int
	DECLARE @TPLTMM int
	DECLARE @TPLTSS int
	DECLARE @TPLTGGSec int
	DECLARE @TPLTHHSec int
	DECLARE @TPLTMMSec int
	DECLARE @TPLTTotale int
	DECLARE @TPLHH int
	DECLARE @TPLMM int
	DECLARE @TPLSS int
	DECLARE @TPLHHSec int
	DECLARE @TPLMMSec int
	DECLARE @TPLTotale int
	DECLARE @TPAHH int
	DECLARE @TPAMM int
	DECLARE @TPASS int
	DECLARE @TPAHHSec int
	DECLARE @TPAMMSec int
	DECLARE @TPATotale int

	-- Variabili di ritorno

	DECLARE @QuantitaProd float = 0
	DECLARE @QuantitaRes float = 0
	DECLARE @QuantitaResN float = 0
	DECLARE @QuantitaScarto float = 0
	DECLARE @TempoFermoMacchina float = 0
	DECLARE @TempoSospensione float = 0
	DECLARE @TempoAttrezzaggio int = 0
	DECLARE @OperatoreAttrezzaggio int = 0
	DECLARE @CostoOperAttrezzaggio float = 0
	DECLARE @TempoTotale float = 0
	DECLARE @TempoMedia float = 0
	DECLARE @TempoMin float = 0
	DECLARE @TempoMax float = 0
	DECLARE @TempoUnitario float = 0
	DECLARE @OperAttivo bigint = -1
	DECLARE @TempoTotaleMac float = 0
	DECLARE @TempoMediaMac float = 0
	DECLARE @TempoMinMac float = 0
	DECLARE @TempoMaxMac float = 0
	DECLARE @DifferenzaTempiPE float = 0
	DECLARE @DifferenzaTempiPEMac float = 0
	DECLARE @DifferenzaTempiAttrezzaggio float = 0
	DECLARE @CostoFase float = 0
	DECLARE @CostoMacchina float = 0
	DECLARE @CostoElettricita float = 0
	DECLARE @CostoGas float = 0

	-- Campi cursori

	DECLARE @IdMacchinaTrcC bigint
	DECLARE @IdMacchinaC bigint
	DECLARE @IdRegistroC nvarchar(50)
	DECLARE @ValoreC nvarchar(MAX)
	DECLARE @DataValoreC datetime
	DECLARE @IdOdlC bigint
	DECLARE @FlTipoConteggioC smallint
	DECLARE @TempValore float
	DECLARE @IdUtenteC bigint
	DECLARE @IdRegistroFineC nvarchar(50)
	DECLARE @DataValoreFineC datetime
	DECLARE @DifferenzaC int

	-- Valori da ODL

	SELECT @IdMacchina = IdMacchina, @QuantitaLav = QuantitaLav, @IdArticoloFase = IdArticoloFase, @DataOdl = DataOraInserimento,
		@TPLTGG = TPLTGG, @TPLTHH = TPLTHH, @TPLTMM = TPLTMM, @TPLTSS = TPLTSS, @TPLHH = TPLHH, @TPLMM = TPLMM, @TPLSS = TPLSS,
		@TPAHH = TPAHH, @TPAMM = TPAMM, @TPASS = TPASS
	FROM OrdiniDiLavoro
	WHERE IdOdl = @IdOdl

	/**********************
	** Quantità prodotta **
	**********************/

	DECLARE cur_qta_prod CURSOR FOR
	SELECT T.IdMacchinaTrc, T.IdMacchina, T.IdRegistro, T.Valore, T.DataValore, T.IdOdl, R.FlTipoConteggio
    FROM MacchineTrc T
    LEFT JOIN MacchineReg R ON R.IdRegistro = T.IdRegistro AND R.IdMacchina = T.IdMacchina
    WHERE T.IdRegistro = '99' AND T.IdOdl = @IdOdl AND T.IdMacchina = @IdMacchina

	OPEN cur_qta_prod
	FETCH NEXT FROM cur_qta_prod INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @FlTipoConteggioC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @TempValore = (SELECT CONVERT(float, @ValoreC))
		
		IF @FlTipoConteggioC = 0
		BEGIN
			SET @QuantitaProd = @QuantitaProd + @TempValore
		END
		ELSE IF @FlTipoConteggioC = 1 OR @FlTipoConteggioC = 2
		BEGIN
			IF @QuantitaProd < @TempValore
				SET @QuantitaProd = @TempValore
		END
		ELSE
		BEGIN
			SET @QuantitaProd = @TempValore
		END

		FETCH NEXT FROM cur_qta_prod INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @FlTipoConteggioC
	END

	CLOSE cur_qta_prod
	DEALLOCATE cur_qta_prod

	/**********************
	** Quantità scartata **
	**********************/

	DECLARE cur_qta_scarto CURSOR FOR
	SELECT T.IdMacchinaTrc, T.IdMacchina, T.IdRegistro, T.Valore, T.DataValore, T.IdOdl, R.FlTipoConteggio
    FROM MacchineTrc T
    LEFT JOIN MacchineReg R ON R.IdRegistro = T.IdRegistro AND R.IdMacchina = T.IdMacchina
    WHERE T.IdRegistro = '91' AND T.IdOdl = @IdOdl AND T.IdMacchina = @IdMacchina

	OPEN cur_qta_scarto
	FETCH NEXT FROM cur_qta_scarto INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @FlTipoConteggioC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @TempValore = (SELECT CONVERT(float, @ValoreC))
		
		IF @FlTipoConteggioC = 0
		BEGIN
			SET @QuantitaScarto = @QuantitaScarto + @TempValore
		END
		ELSE IF @FlTipoConteggioC = 1 OR @FlTipoConteggioC = 2
		BEGIN
			IF @QuantitaScarto < @TempValore
				SET @QuantitaScarto = @TempValore
		END
		ELSE
		BEGIN
			SET @QuantitaScarto = @TempValore
		END

		FETCH NEXT FROM cur_qta_scarto INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @FlTipoConteggioC
	END

	CLOSE cur_qta_scarto
	DEALLOCATE cur_qta_scarto

	/*************************
	** Tempi fermo macchina **
	*************************/

	DECLARE cur_tempi_fm CURSOR FOR
	SELECT *, DATEDIFF(SECOND, X.DataValore, X.DataValoreFine) AS Differenza
    FROM (
        SELECT IdMacchinaTrc, IdMacchina, IdRegistro, Valore, DataValore, IdOdl, IdAuthUser,
        LEAD(IdRegistro, 1, NULL) OVER (ORDER BY IdMacchinaTrc) AS IdRegistroFine,
        CASE
            WHEN IdRegistro = '24' AND LEAD(IdRegistro, 1, NULL) OVER (ORDER BY IdMacchinaTrc) = '25'
            THEN LEAD(DataValore, 1, NULL) OVER (ORDER BY IdMacchinaTrc)
            ELSE NULL
        END AS DataValoreFine
        FROM MacchineTrc
        WHERE IdOdl = @IdOdl AND IdRegistro IN ('24', '25') AND IdMacchina = @IdMacchina
    ) X
    WHERE IdRegistro = '24'
    ORDER BY X.IdMacchinaTrc

	OPEN cur_tempi_fm
	FETCH NEXT FROM cur_tempi_fm INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @IdUtenteC, @IdRegistroFineC, @DataValoreFineC, @DifferenzaC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @DifferenzaC IS NOT NULL
			SET @TempoFermoMacchina = @TempoFermoMacchina + @DifferenzaC
		
		FETCH NEXT FROM cur_tempi_fm INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @IdUtenteC, @IdRegistroFineC, @DataValoreFineC, @DifferenzaC
	END

	CLOSE cur_tempi_fm
	DEALLOCATE cur_tempi_fm

	/**********************
	** Tempi sospensione **
	**********************/

	DECLARE cur_tempi_sosp CURSOR FOR
	SELECT *, DATEDIFF(SECOND, X.DataValore, X.DataValoreFine) AS Differenza
    FROM (
        SELECT IdMacchinaTrc, IdMacchina, IdRegistro, Valore, DataValore, IdOdl, IdAuthUser,
        LEAD(IdRegistro, 1, NULL) OVER (ORDER BY IdMacchinaTrc) AS IdRegistroFine,
        CASE
            WHEN IdRegistro = '32' AND LEAD(IdRegistro, 1, NULL) OVER (ORDER BY IdMacchinaTrc) = '33'
            THEN LEAD(DataValore, 1, NULL) OVER (ORDER BY IdMacchinaTrc)
            ELSE NULL
        END AS DataValoreFine
        FROM MacchineTrc
        WHERE IdOdl = @IdOdl AND IdRegistro IN ('32', '33') AND IdMacchina = @IdMacchina
    ) X
    WHERE IdRegistro = '32'
    ORDER BY X.IdMacchinaTrc

	OPEN cur_tempi_sosp
	FETCH NEXT FROM cur_tempi_sosp INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @IdUtenteC, @IdRegistroFineC, @DataValoreFineC, @DifferenzaC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @DifferenzaC IS NOT NULL
			SET @TempoSospensione = @TempoSospensione + @DifferenzaC
		
		FETCH NEXT FROM cur_tempi_sosp INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @IdUtenteC, @IdRegistroFineC, @DataValoreFineC, @DifferenzaC
	END

	CLOSE cur_tempi_sosp
	DEALLOCATE cur_tempi_sosp

	/***********************
	** Tempi attrezzaggio **
	***********************/

	DECLARE cur_tempi_attr CURSOR FOR
	SELECT *, DATEDIFF(SECOND, X.DataValore, X.DataValoreFine) AS Differenza
    FROM (
        SELECT IdMacchinaTrc, IdMacchina, IdRegistro, Valore, DataValore, IdOdl, IdAuthUser,
        LEAD(IdRegistro, 1, NULL) OVER (ORDER BY IdMacchinaTrc) AS IdRegistroFine,
        CASE
            WHEN IdRegistro = '28' AND LEAD(IdRegistro, 1, NULL) OVER (ORDER BY IdMacchinaTrc) = '29'
            THEN LEAD(DataValore, 1, NULL) OVER (ORDER BY IdMacchinaTrc)
            ELSE NULL
        END AS DataValoreFine
        FROM MacchineTrc
        WHERE IdOdl = @IdOdl AND IdRegistro IN ('28', '29') AND IdMacchina = @IdMacchina
    ) X
    WHERE IdRegistro = '28'
    ORDER BY X.IdMacchinaTrc

	OPEN cur_tempi_attr
	FETCH NEXT FROM cur_tempi_attr INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @IdUtenteC, @IdRegistroFineC, @DataValoreFineC, @DifferenzaC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @DifferenzaC IS NOT NULL
			SET @TempoAttrezzaggio = @TempoAttrezzaggio + @DifferenzaC

		IF @OperatoreAttrezzaggio = 0
			SET @OperatoreAttrezzaggio = @IdUtenteC
		
		FETCH NEXT FROM cur_tempi_attr INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @IdUtenteC, @IdRegistroFineC, @DataValoreFineC, @DifferenzaC
	END

	IF @OperatoreAttrezzaggio <> 0
	BEGIN
		SELECT TOP(1) @CostoOperAttrezzaggio = ISNULL(Prezzo, 0)
		FROM Listini
		WHERE TipoCodice = 'UT' AND IdTabella = CAST(@OperatoreAttrezzaggio as nvarchar(255))
			AND DataInizioValidita <= @DataOdl AND ((DataFineValidita IS NULL) OR (DataFineValidita >= @DataOdl))
		ORDER BY DataInizioValidita, DataFineValidita

		IF @CostoOperAttrezzaggio <> 0
		BEGIN
			SET @CostoOperAttrezzaggio = @CostoOperAttrezzaggio / 3600
			SET @CostoOperAttrezzaggio = ROUND(@TempoAttrezzaggio * @CostoOperAttrezzaggio, 2)
		END
	END

	CLOSE cur_tempi_attr
	DEALLOCATE cur_tempi_attr

	/*********************
	** Tempi produzione **
	*********************/

	SELECT @TempoTotale = ISNULL(SUM(DATEDIFF(second, X.DataValore, X.DataValoreSucc)), 0), @TempoMedia = ISNULL(AVG(DATEDIFF(second, X.DataValore, X.DataValoreSucc)), 0),
        @TempoMin = ISNULL(MIN(DATEDIFF(second, X.DataValore, X.DataValoreSucc)), 0), @TempoMax = ISNULL(MAX(DATEDIFF(second, X.DataValore, X.DataValoreSucc)), 0)
    FROM (
        SELECT IdMacchinaTrc, IdMacchina, IdRegistro, Valore, DataValore, IdOdl,
        LEAD(DataValore, 1, NULL) OVER (ORDER BY IdMacchinaTrc) DataValoreSucc
        FROM MacchineTrc
        WHERE IdRegistro IN ('99', '20', '23') AND IdOdl = @IdOdl AND IdMacchina = @IdMacchina
    ) X
    WHERE DATEDIFF(second, X.DataValore, X.DataValoreSucc) > 0

	/******************************
	** Tempi produzione macchina **
	******************************/

	DECLARE @CountRegistri int = 0
	DECLARE @RegistroInizio nvarchar(50) = '21'
	DECLARE @RegistroFine nvarchar(50) = '22'

	SELECT @CountRegistri = COUNT(*)
	FROM MacchineTrc
	WHERE IdOdl = @IdOdl AND IdMacchina = @IdMacchina AND IdRegistro IN (@RegistroInizio, @RegistroFine)

	IF @CountRegistri = 0
	BEGIN
		SET @RegistroInizio = '20'
		SET @RegistroFine = '23'
	END

	SELECT @TempoTotaleMac = ISNULL(SUM(DATEDIFF(second, X.DataValore, X.DataValoreSucc)), 0), @TempoMediaMac = ISNULL(AVG(DATEDIFF(second, X.DataValore, X.DataValoreSucc)), 0),
        @TempoMinMac = ISNULL(MIN(DATEDIFF(second, X.DataValore, X.DataValoreSucc)), 0), @TempoMaxMac = ISNULL(MAX(DATEDIFF(second, X.DataValore, X.DataValoreSucc)), 0)
    FROM (
        SELECT IdMacchinaTrc, IdMacchina, IdRegistro, Valore, DataValore, IdOdl,
        LEAD(DataValore, 1, NULL) OVER (ORDER BY IdMacchinaTrc) DataValoreSucc
        FROM MacchineTrc
        WHERE IdRegistro IN ('99', @RegistroInizio, @RegistroFine) AND IdOdl = @IdOdl AND IdMacchina = @IdMacchina
    ) X
    WHERE DATEDIFF(second, X.DataValore, X.DataValoreSucc) > 0

	/*********************
	** Operatore attivo **
	*********************/

	DECLARE @IdUtenteOA bigint
	DECLARE @IdRegistroOA nvarchar(50)

	SELECT TOP(1) @IdUtenteOA = IdAuthUser, @IdRegistroOA = IdRegistro
    FROM MacchineTrc
    WHERE IdOdl = @IdOdl AND IdMacchina = @IdMacchina AND IdRegistro IN ('20', '23', '21', '22', '32', '33', '28', '29')
    ORDER BY DataValore DESC

	IF @IdUtenteOA IS NOT NULL
	BEGIN
		IF @IdRegistroOA IS NOT NULL AND @IdRegistroOA <> '29'
			SET @OperAttivo = @IdUtenteOA
	END

	/************************
	** Costo fase/macchina **
	************************/

	SELECT TOP(1) @CostoFase = ISNULL(Prezzo, 0)
	FROM Listini
	WHERE TipoCodice = 'FS' AND IdTabella = CAST(@IdArticoloFase as nvarchar(255))
		AND DataInizioValidita <= @DataOdl AND ((DataFineValidita IS NULL) OR (DataFineValidita >= @DataOdl))
	ORDER BY DataInizioValidita, DataFineValidita

	SELECT TOP(1) @CostoMacchina = ISNULL(Prezzo, 0)
	FROM Listini
	WHERE TipoCodice = 'MC' AND IdTabella = CAST(@IdMacchina as nvarchar(255))
		AND DataInizioValidita <= @DataOdl AND ((DataFineValidita IS NULL) OR (DataFineValidita >= @DataOdl))
	ORDER BY DataInizioValidita, DataFineValidita

	/********************
	** Costi operativi **
	********************/

	SELECT TOP(1) @CostoElettricita = ISNULL(Prezzo, 0)
	FROM Listini
	WHERE TipoCodice = 'EL' AND IdTabella = '1'
		AND DataInizioValidita <= @DataOdl AND ((DataFineValidita IS NULL) OR (DataFineValidita >= @DataOdl))
	ORDER BY DataInizioValidita, DataFineValidita

	SELECT TOP(1) @CostoGas = ISNULL(Prezzo, 0)
	FROM Listini
	WHERE TipoCodice = 'GS' AND IdTabella = '1'
		AND DataInizioValidita <= @DataOdl AND ((DataFineValidita IS NULL) OR (DataFineValidita >= @DataOdl))
	ORDER BY DataInizioValidita, DataFineValidita

	/*******************
	** Ultimi calcoli **
	*******************/

	-- Quantità residua

	SET @QuantitaRes = @QuantitaLav - @QuantitaProd
	SET @QuantitaResN = @QuantitaLav - @QuantitaProd - @QuantitaScarto

	-- Tempi lavorazione
	
	IF @TempoTotale IS NOT NULL AND @QuantitaProd > 0
		SET @TempoUnitario = ROUND(CAST(@TempoTotale AS float) / CAST(@QuantitaProd AS float), 0)

	IF @TempoTotaleMac IS NULL
		SET @TempoTotaleMac = @TempoTotale

	-- Tempo previsto lavorazione

	SET @TPLHHSec = FLOOR(@TPLHH * 3600)
	SET @TPLMMSec = FLOOR(@TPLMM * 60)
	SET @TPLTotale = @TPLHHSec + @TPLMMSec + @TPLSS

	-- Tempo previsto attrezzaggio

	SET @TPAHHSec = FLOOR(@TPAHH * 3600)
	SET @TPAMMSec = FLOOR(@TPAMM * 60)
	SET @TPATotale = @TPAHHSec + @TPAMMSec + @TPASS

	-- Tempo previsto lavorazione totale

	SET @TPLTGGSec = FLOOR(@TPLTGG * 86400)
	SET @TPLTHHSec = FLOOR(@TPLTHH * 3600)
	SET @TPLTMMSec = FLOOR(@TPLTMM * 60)
	SET @TPLTTotale = @TPLTGGSec + @TPLTHHSec + @TPLTMMSec + @TPLTSS

	-- Differenza tempi previsto-effettivo

	IF @TempoTotale >= @TPLTTotale
		SET @DifferenzaTempiPE = @TempoTotale - @TPLTTotale
	ELSE
		SET @DifferenzaTempiPE = @TPLTTotale - @TempoTotale

	-- Differenza tempi previsto-effettivo macchina

	IF @TempoTotaleMac >= @TPLTTotale
		SET @DifferenzaTempiPEMac = @TempoTotaleMac - @TPLTTotale
	ELSE
		SET @DifferenzaTempiPEMac = @TPLTTotale - @TempoTotaleMac

	-- Differenza tempi previsto-effettivo attrezzaggio

	IF @TempoAttrezzaggio > @TPATotale
		SET @DifferenzaTempiAttrezzaggio = @TempoAttrezzaggio - @TPATotale
	ELSE
		SET @DifferenzaTempiAttrezzaggio = @TPATotale - @TempoAttrezzaggio

	/**********************
	** Valori di ritorno **
	**********************/

	SELECT @IdOdl AS IdOdl, @QuantitaProd AS QuantitaProdotta, @QuantitaRes AS QuantitaResidua, @QuantitaScarto AS QuantitaScartata, @QuantitaResN AS QuantitaResiduaNetta,
		@TempoFermoMacchina AS TempoFermoMacchina, @TempoSospensione AS TempoSospensione, @TempoAttrezzaggio AS TempoAttrezzaggio, @OperatoreAttrezzaggio AS OperatoreAttrezzaggio,
		@TempoTotale AS TempoTotale, @TempoMedia AS TempoMedio, @TempoMin AS TempoMinimo, @TempoMax AS TempoMassimo, @CostoOperAttrezzaggio AS CostoOperatoreAttrezzaggio,
		@TempoUnitario AS TempoUnitario, @TempoTotaleMac AS TempoTotaleMacchina, @OperAttivo AS OperatoreAttivo, @TPLTTotale AS TempoPrevistoLavorazioneTotale,
		@TPLTotale AS TempoPrevistoLavorazione, @TPATotale AS TempoPrevistoAttrezzaggio, @DifferenzaTempiAttrezzaggio AS DifferenzaTempiAttrezzaggio,
		@DifferenzaTempiPE AS DifferenzaTempi, @DifferenzaTempiPEMac AS DifferenzaTempiMacchina, @CostoFase AS CostoFase, @CostoMacchina AS CostoMacchina,
		@CostoElettricita AS CostoElettricita, @CostoGas AS CostoGas
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTracciatureOdls]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetTracciatureOdls]
AS
BEGIN
	DECLARE @IdOdlC bigint

	CREATE TABLE #Tracciature(
		IdOdl bigint,
		QuantitaProdotta float,
		QuantitaResidua float,
		QuantitaScartata float,
		TempoFermoMacchina float,
		TempoSospensione float,
		TempoAttrezzaggio float,
		TempoTotale float,
		TempoMedio float,
		TempoMinimo float,
		TempoMassimo float,
		TempoUnitario float,
		OperatoreAttivo int,
		TempoTotaleMacchina float,
		TempoPrevisto float,
		DifferenzaTempi float,
		DifferenzaTempiMacchina float
	)

	DECLARE cur_odl CURSOR FOR
	SELECT IdOdl
    FROM OrdiniDiLavoro

	OPEN cur_odl
	FETCH NEXT FROM cur_odl INTO @IdOdlC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO #Tracciature(IdOdl, QuantitaProdotta, QuantitaResidua, QuantitaScartata, TempoFermoMacchina, TempoSospensione,
		TempoAttrezzaggio, TempoTotale, TempoMedio, TempoMinimo, TempoMassimo, TempoUnitario, OperatoreAttivo, TempoTotaleMacchina,
		TempoPrevisto, DifferenzaTempi, DifferenzaTempiMacchina)
		EXEC spGetTracciatureOdl @IdOdl = @IdOdlC

		FETCH NEXT FROM cur_odl INTO @IdOdlC
	END

	CLOSE cur_odl
	DEALLOCATE cur_odl

	SELECT * FROM #Tracciature
END
GO
/****** Object:  StoredProcedure [dbo].[spTempiOperatori]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTempiOperatori]
	@IdOdl bigint
AS
BEGIN
	SET NOCOUNT ON;

	/*******************************************************************
	** Dichiarazione variabili temporanee e tabella valori di ritorno **
	*******************************************************************/

	DECLARE @IdMacchina bigint
	DECLARE @DataOdl datetime

	DECLARE @IdUtenteC bigint
	DECLARE @TotaleTempoC int
	DECLARE @PrezzoListinoC float

	DECLARE @PrezzoListino float = 0
	DECLARE @PrezzoListinoSec float = 0

	SELECT @IdMacchina = IdMacchina, @DataOdl = ISNULL(DataOraFineProduzione, DataOraInserimento)
	FROM OrdiniDiLavoro
	WHERE IdOdl = @IdOdl

	CREATE TABLE #TempOperatori(
		IdOdl bigint,
		IdUtente bigint,
		NomeUtente nvarchar(50),
		Tempo float,
		CostoOrario float,
		CostoTotale float
	)

	/********************
	** Tempi operatore **
	********************/

	DECLARE cur_tempi_oper CURSOR FOR
	SELECT X.IdAuthUser, SUM(DATEDIFF(second, X.DataValore, X.DataValoreSucc)) AS TotaleTempo
    FROM (
        SELECT IdMacchinaTrc, IdMacchina, IdRegistro, Valore, DataValore, IdOdl,
        LEAD(DataValore, 1, NULL) OVER (ORDER BY IdMacchinaTrc) DataValoreSucc, IdAuthUser
        FROM MacchineTrc
        WHERE IdRegistro IN ('99', '20', '23', '32', '33') AND IdOdl = @IdOdl AND IdMacchina = @IdMacchina
    ) X
    WHERE DATEDIFF(second, X.DataValore, X.DataValoreSucc) > 0
    GROUP BY X.IdAuthUser

	OPEN cur_tempi_oper
	FETCH NEXT FROM cur_tempi_oper INTO @IdUtenteC, @TotaleTempoC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @CountUtente int = 0
		SELECT @CountUtente = COUNT(*) FROM #TempOperatori WHERE IdUtente = @IdUtenteC

		IF @CountUtente = 0
		BEGIN
			DECLARE @NomeUtente nvarchar(150) = ''
			SELECT @NomeUtente = username FROM auth_user WHERE id = @IdUtenteC
			SET @PrezzoListino = 0

			SELECT TOP(1) @PrezzoListino = ISNULL(Prezzo, 0)
			FROM Listini
			WHERE TipoCodice = 'UT' AND IdTabella = CAST(@IdUtenteC as nvarchar(255))
				AND DataInizioValidita <= @DataOdl AND ((DataFineValidita IS NULL) OR (DataFineValidita >= @DataOdl))
			ORDER BY DataInizioValidita, DataFineValidita

			INSERT INTO #TempOperatori(IdOdl, IdUtente, NomeUtente, Tempo, CostoOrario, CostoTotale) VALUES (@IdOdl, @IdUtenteC, @NomeUtente, @TotaleTempoC, @PrezzoListino, 0)
		END
		ELSE
		BEGIN
			UPDATE #TempOperatori
			SET
				Tempo = Tempo + @TotaleTempoC
			WHERE IdUtente = @IdUtenteC
		END

		FETCH NEXT FROM cur_tempi_oper INTO @IdUtenteC, @TotaleTempoC
	END

	CLOSE cur_tempi_oper
	DEALLOCATE cur_tempi_oper

	/****************************
	** Calcolo costo operatore **
	****************************/

	DECLARE cur_tempi CURSOR FOR
	SELECT IdUtente, CostoOrario FROM #TempOperatori

	OPEN cur_tempi
	FETCH NEXT FROM cur_tempi INTO @IdUtenteC, @PrezzoListinoC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @PrezzoListinoSec = 0

		IF @PrezzoListinoC <> 0
			SET @PrezzoListinoSec = @PrezzoListinoC / 3600

		UPDATE #TempOperatori
		SET CostoTotale = ROUND(Tempo * @PrezzoListinoSec, 2)
		WHERE IdUtente = @IdUtenteC

		FETCH NEXT FROM cur_tempi INTO @IdUtenteC, @PrezzoListinoC
	END

	CLOSE cur_tempi
	DEALLOCATE cur_tempi

	/**********************
	** Valori di ritorno **
	**********************/
    
	SELECT * FROM #TempOperatori
END
GO
/****** Object:  StoredProcedure [dbo].[spTempiPresidioOperatori]    Script Date: 12/06/2023 08:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTempiPresidioOperatori]
	@IdOdl bigint
AS
BEGIN
	SET NOCOUNT ON;

	/*******************************************************************
	** Dichiarazione variabili temporanee e tabella valori di ritorno **
	*******************************************************************/

	DECLARE @IdMacchina bigint
	DECLARE @DataOdl datetime

	DECLARE @IdMacchinaTrcC bigint
	DECLARE @IdMacchinaC bigint
	DECLARE @IdRegistroC nvarchar(50)
	DECLARE @ValoreC nvarchar(MAX)
	DECLARE @DataValoreC datetime
	DECLARE @IdOdlC bigint
	DECLARE @FlTipoConteggioC smallint
	DECLARE @TempValore float
	DECLARE @IdUtenteC bigint
	DECLARE @IdRegistroFineC nvarchar(50)
	DECLARE @DataValoreFineC datetime
	DECLARE @DifferenzaC int
	DECLARE @PrezzoListinoC float

	DECLARE @PrezzoListino float = 0
	DECLARE @PrezzoListinoSec float = 0

	SELECT @IdMacchina = IdMacchina, @DataOdl = ISNULL(DataOraFineProduzione, DataOraInserimento)
	FROM OrdiniDiLavoro
	WHERE IdOdl = @IdOdl

	CREATE TABLE #TempPresidio(
		IdOdl bigint,
		IdUtente bigint,
		NomeUtente nvarchar(50),
		Tempo float,
		CostoOrario float,
		CostoTotale float
	)

	/*****************************
	** Tempi presidio operatore **
	*****************************/

	DECLARE cur_tempi_presidio CURSOR FOR
	SELECT *, DATEDIFF(SECOND, X.DataValore, X.DataValoreFine) AS Differenza
    FROM (
        SELECT IdMacchinaTrc, IdMacchina, IdRegistro, Valore, DataValore, IdOdl, IdAuthUser,
        LEAD(IdRegistro, 1, NULL) OVER (PARTITION BY IdAuthUser ORDER BY IdMacchinaTrc) AS IdRegistroFine,
        CASE
            WHEN IdRegistro = '30' AND LEAD(IdRegistro, 1, NULL) OVER (PARTITION BY IdAuthUser ORDER BY IdMacchinaTrc) = '31'
            THEN LEAD(DataValore, 1, NULL) OVER (PARTITION BY IdAuthUser ORDER BY IdMacchinaTrc)
            ELSE NULL
        END AS DataValoreFine
        FROM MacchineTrc
        WHERE IdOdl = @IdOdl AND IdRegistro IN ('30', '31') AND IdMacchina = @IdMacchina
    ) X
    WHERE IdRegistro = '30'
    ORDER BY X.IdMacchinaTrc

	OPEN cur_tempi_presidio
	FETCH NEXT FROM cur_tempi_presidio INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @IdUtenteC, @IdRegistroFineC, @DataValoreFineC, @DifferenzaC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @CountUtente int = 0
		SELECT @CountUtente = COUNT(*) FROM #TempPresidio WHERE IdUtente = @IdUtenteC

		IF @CountUtente = 0
		BEGIN
			DECLARE @NomeUtente nvarchar(150) = ''
			SELECT @NomeUtente = username FROM auth_user WHERE id = @IdUtenteC
			SET @PrezzoListino = 0

			SELECT TOP(1) @PrezzoListino = ISNULL(Prezzo, 0)
			FROM Listini
			WHERE TipoCodice = 'UT' AND IdTabella = CAST(@IdUtenteC as nvarchar(255))
				AND DataInizioValidita <= @DataOdl AND ((DataFineValidita IS NULL) OR (DataFineValidita >= @DataOdl))
			ORDER BY DataInizioValidita, DataFineValidita

			INSERT INTO #TempPresidio(IdOdl, IdUtente, NomeUtente, Tempo, CostoOrario, CostoTotale) VALUES (@IdOdl, @IdUtenteC, @NomeUtente, @DifferenzaC, @PrezzoListino, 0)
		END
		ELSE
		BEGIN
			UPDATE #TempPresidio
			SET
				Tempo = Tempo + @DifferenzaC
			WHERE IdUtente = @IdUtenteC
		END

		FETCH NEXT FROM cur_tempi_presidio INTO @IdMacchinaTrcC, @IdMacchinaC, @IdRegistroC, @ValoreC, @DataValoreC, @IdOdlC, @IdUtenteC, @IdRegistroFineC, @DataValoreFineC, @DifferenzaC
	END

	CLOSE cur_tempi_presidio
	DEALLOCATE cur_tempi_presidio

	/****************************
	** Calcolo costo operatore **
	****************************/

	DECLARE cur_tempi CURSOR FOR
	SELECT IdUtente, CostoOrario FROM #TempPresidio

	OPEN cur_tempi
	FETCH NEXT FROM cur_tempi INTO @IdUtenteC, @PrezzoListinoC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @PrezzoListinoSec = 0

		IF @PrezzoListinoC <> 0
			SET @PrezzoListinoSec = @PrezzoListinoC / 3600

		UPDATE #TempPresidio
		SET CostoTotale = ROUND(Tempo * @PrezzoListinoSec, 2)
		WHERE IdUtente = @IdUtenteC

		FETCH NEXT FROM cur_tempi INTO @IdUtenteC, @PrezzoListinoC
	END

	CLOSE cur_tempi
	DEALLOCATE cur_tempi

	/**********************
	** Valori di ritorno **
	**********************/
    
	SELECT * FROM #TempPresidio
END
GO
USE [master]
GO
ALTER DATABASE [GMES_V2] SET  READ_WRITE 
GO
