USE [master]
GO
/****** Object:  Database [GeoAcademy]    Script Date: 05/06/2015 15:50:59 ******/
CREATE DATABASE [GeoAcademy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeoAcademy', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GeoAcademy.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GeoAcademy_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GeoAcademy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GeoAcademy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeoAcademy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeoAcademy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeoAcademy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeoAcademy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeoAcademy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeoAcademy] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeoAcademy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GeoAcademy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeoAcademy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeoAcademy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeoAcademy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeoAcademy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeoAcademy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeoAcademy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeoAcademy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeoAcademy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GeoAcademy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeoAcademy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeoAcademy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeoAcademy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeoAcademy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeoAcademy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GeoAcademy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeoAcademy] SET RECOVERY FULL 
GO
ALTER DATABASE [GeoAcademy] SET  MULTI_USER 
GO
ALTER DATABASE [GeoAcademy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeoAcademy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeoAcademy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeoAcademy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GeoAcademy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GeoAcademy', N'ON'
GO
USE [GeoAcademy]
GO
/****** Object:  Table [dbo].[Avatar]    Script Date: 05/06/2015 15:50:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Avatar](
	[idAvatar] [int] NOT NULL,
	[Descricao] [varchar](400) NULL,
	[CodigoHTML] [varchar](400) NOT NULL,
	[Achievement] [int] NOT NULL,
 CONSTRAINT [PK_Avatar] PRIMARY KEY CLUSTERED 
(
	[idAvatar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvatarUtilizador]    Script Date: 05/06/2015 15:50:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvatarUtilizador](
	[idUtilizador] [int] NOT NULL,
	[idAvatar] [int] NOT NULL,
	[Data] [date] NULL,
 CONSTRAINT [PK_AvatarUtilizador] PRIMARY KEY CLUSTERED 
(
	[idUtilizador] ASC,
	[idAvatar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pergunta]    Script Date: 05/06/2015 15:50:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pergunta](
	[idPergunta] [int] NOT NULL,
	[Descricao] [varchar](400) NULL,
	[idConcelho] [int] NOT NULL,
	[idDistrito] [int] NOT NULL,
 CONSTRAINT [PK_Pergunta] PRIMARY KEY CLUSTERED 
(
	[idPergunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PerguntaUtilizador]    Script Date: 05/06/2015 15:50:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerguntaUtilizador](
	[idUtilizador] [int] NOT NULL,
	[idPergunta] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[Cotacao] [bit] NOT NULL,
 CONSTRAINT [PK_PerguntaUtilizador] PRIMARY KEY CLUSTERED 
(
	[idUtilizador] ASC,
	[idPergunta] ASC,
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilizador]    Script Date: 05/06/2015 15:50:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utilizador](
	[idUtilizador] [int] NOT NULL,
	[Nome] [varchar](45) NULL,
	[Email] [varchar](45) NULL,
	[Password] [varchar](60) NOT NULL,
	[Genero] [varchar](1) NULL,
	[Classificacao] [float] NULL,
	[Idade] [int] NULL,
	[DataNasc] [date] NULL,
	[NumTestes] [int] NULL,
	[NumAulas] [int] NULL,
 CONSTRAINT [PK_Utilizador] PRIMARY KEY CLUSTERED 
(
	[idUtilizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AvatarUtilizador]  WITH CHECK ADD  CONSTRAINT [FK_AvatarUtilizador_Avatar] FOREIGN KEY([idAvatar])
REFERENCES [dbo].[Avatar] ([idAvatar])
GO
ALTER TABLE [dbo].[AvatarUtilizador] CHECK CONSTRAINT [FK_AvatarUtilizador_Avatar]
GO
ALTER TABLE [dbo].[AvatarUtilizador]  WITH CHECK ADD  CONSTRAINT [FK_AvatarUtilizador_Utilizador] FOREIGN KEY([idUtilizador])
REFERENCES [dbo].[Utilizador] ([idUtilizador])
GO
ALTER TABLE [dbo].[AvatarUtilizador] CHECK CONSTRAINT [FK_AvatarUtilizador_Utilizador]
GO
ALTER TABLE [dbo].[PerguntaUtilizador]  WITH CHECK ADD  CONSTRAINT [FK_PerguntaUtilizador_Pergunta] FOREIGN KEY([idPergunta])
REFERENCES [dbo].[Pergunta] ([idPergunta])
GO
ALTER TABLE [dbo].[PerguntaUtilizador] CHECK CONSTRAINT [FK_PerguntaUtilizador_Pergunta]
GO
ALTER TABLE [dbo].[PerguntaUtilizador]  WITH CHECK ADD  CONSTRAINT [FK_PerguntaUtilizador_Utilizador] FOREIGN KEY([idUtilizador])
REFERENCES [dbo].[Utilizador] ([idUtilizador])
GO
ALTER TABLE [dbo].[PerguntaUtilizador] CHECK CONSTRAINT [FK_PerguntaUtilizador_Utilizador]
GO
ALTER TABLE [dbo].[PerguntaUtilizador]  WITH CHECK ADD  CONSTRAINT [FK_PerguntaUtilizador_Utilizador1] FOREIGN KEY([idUtilizador])
REFERENCES [dbo].[Utilizador] ([idUtilizador])
GO
ALTER TABLE [dbo].[PerguntaUtilizador] CHECK CONSTRAINT [FK_PerguntaUtilizador_Utilizador1]
GO
USE [master]
GO
ALTER DATABASE [GeoAcademy] SET  READ_WRITE 
GO
