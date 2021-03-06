USE [master]
GO
/****** Object:  Database [Complejos]    Script Date: 13/12/2016 15:40:31 ******/
CREATE DATABASE [Complejos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Complejos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2\MSSQL\DATA\Complejos.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Complejos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2\MSSQL\DATA\Complejos_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Complejos] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Complejos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Complejos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Complejos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Complejos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Complejos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Complejos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Complejos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Complejos] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Complejos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Complejos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Complejos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Complejos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Complejos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Complejos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Complejos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Complejos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Complejos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Complejos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Complejos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Complejos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Complejos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Complejos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Complejos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Complejos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Complejos] SET RECOVERY FULL 
GO
ALTER DATABASE [Complejos] SET  MULTI_USER 
GO
ALTER DATABASE [Complejos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Complejos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Complejos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Complejos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Complejos', N'ON'
GO
USE [Complejos]
GO
/****** Object:  Table [dbo].[cancha]    Script Date: 13/12/2016 15:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cancha](
	[id_cancha] [int] IDENTITY(1,1) NOT NULL,
	[id_complejo] [int] NULL,
	[nombre] [varchar](20) NULL,
	[descripcion] [varchar](100) NULL,
	[id_tipo] [int] NULL,
	[horarios] [int] NULL,
	[disponible] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cancha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[complejo]    Script Date: 13/12/2016 15:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[complejo](
	[dueño] [int] NULL,
	[id_complejo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[numero_de_canchas] [int] NOT NULL,
	[telefono_complejo] [varchar](20) NULL,
	[mail] [varchar](50) NULL,
	[facebook] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_complejo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reserva]    Script Date: 13/12/2016 15:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserva](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[usuario_que_alquila] [int] NULL,
	[cancha_alquilada] [int] NULL,
	[fecha_efectuado_alquiler] [datetime] NULL,
	[hora_ectuado_alquiler] [time](7) NULL,
	[hora_a_jugar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_cancha]    Script Date: 13/12/2016 15:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_cancha](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[Tamaño_de_cancha] [int] NULL,
	[tipo_suelo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 13/12/2016 15:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [varchar](20) NOT NULL,
	[apellido_usuario] [varchar](20) NOT NULL,
	[email_usuario] [varchar](30) NULL,
	[telefono_usuario] [varchar](20) NOT NULL,
	[rol] [int] NULL,
	[edad] [int] NULL,
	[canchas_alquiladas] [int] NULL,
	[reputacion] [int] NULL,
	[roll] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cancha] ON 

GO
INSERT [dbo].[cancha] ([id_cancha], [id_complejo], [nombre], [descripcion], [id_tipo], [horarios], [disponible]) VALUES (1, 1, N'cancha 1', NULL, 1, NULL, NULL)
GO
INSERT [dbo].[cancha] ([id_cancha], [id_complejo], [nombre], [descripcion], [id_tipo], [horarios], [disponible]) VALUES (2, 1, N'cancha 2', NULL, 1, NULL, NULL)
GO
INSERT [dbo].[cancha] ([id_cancha], [id_complejo], [nombre], [descripcion], [id_tipo], [horarios], [disponible]) VALUES (3, 1, N'cancha 3', NULL, 1, NULL, NULL)
GO
INSERT [dbo].[cancha] ([id_cancha], [id_complejo], [nombre], [descripcion], [id_tipo], [horarios], [disponible]) VALUES (4, 1, N'cancha 4', NULL, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[cancha] OFF
GO
SET IDENTITY_INSERT [dbo].[complejo] ON 

GO
INSERT [dbo].[complejo] ([dueño], [id_complejo], [nombre], [descripcion], [numero_de_canchas], [telefono_complejo], [mail], [facebook]) VALUES (NULL, 1, N'la cabaña', N'es la mejor canchita', 4, N'4258-8974', NULL, NULL)
GO
INSERT [dbo].[complejo] ([dueño], [id_complejo], [nombre], [descripcion], [numero_de_canchas], [telefono_complejo], [mail], [facebook]) VALUES (NULL, 2, N'tie break', N'esta cancha safa', 1, N'5258-8335', NULL, NULL)
GO
INSERT [dbo].[complejo] ([dueño], [id_complejo], [nombre], [descripcion], [numero_de_canchas], [telefono_complejo], [mail], [facebook]) VALUES (NULL, 3, N'rojitas', N'hola k ac', 4, N'4258-8974', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[complejo] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_cancha] ON 

GO
INSERT [dbo].[tipo_cancha] ([id_tipo], [descripcion], [Tamaño_de_cancha], [tipo_suelo]) VALUES (1, NULL, 5, N'cesped sintetico')
GO
INSERT [dbo].[tipo_cancha] ([id_tipo], [descripcion], [Tamaño_de_cancha], [tipo_suelo]) VALUES (2, NULL, 5, N'cemento')
GO
INSERT [dbo].[tipo_cancha] ([id_tipo], [descripcion], [Tamaño_de_cancha], [tipo_suelo]) VALUES (3, NULL, 7, N'tierra')
GO
SET IDENTITY_INSERT [dbo].[tipo_cancha] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

GO
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [apellido_usuario], [email_usuario], [telefono_usuario], [rol], [edad], [canchas_alquiladas], [reputacion], [roll]) VALUES (1, N'juan', N'lopez', NULL, N'4856-8793', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [apellido_usuario], [email_usuario], [telefono_usuario], [rol], [edad], [canchas_alquiladas], [reputacion], [roll]) VALUES (2, N'pepe', N'moore', NULL, N'7856-8793', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [apellido_usuario], [email_usuario], [telefono_usuario], [rol], [edad], [canchas_alquiladas], [reputacion], [roll]) VALUES (3, N'atilio', N'perez', NULL, N'5556-8793', NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[cancha]  WITH CHECK ADD FOREIGN KEY([id_complejo])
REFERENCES [dbo].[complejo] ([id_complejo])
GO
ALTER TABLE [dbo].[cancha]  WITH CHECK ADD FOREIGN KEY([id_tipo])
REFERENCES [dbo].[tipo_cancha] ([id_tipo])
GO
ALTER TABLE [dbo].[complejo]  WITH CHECK ADD FOREIGN KEY([dueño])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[reserva]  WITH CHECK ADD FOREIGN KEY([cancha_alquilada])
REFERENCES [dbo].[cancha] ([id_cancha])
GO
ALTER TABLE [dbo].[reserva]  WITH CHECK ADD FOREIGN KEY([usuario_que_alquila])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
USE [master]
GO
ALTER DATABASE [Complejos] SET  READ_WRITE 
GO
