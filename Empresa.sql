USE [master]
GO
CREATE DATABASE [Empresa] ON  PRIMARY 
( NAME = N'Empresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Empresa.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Empresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Empresa_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Empresa] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Empresa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Empresa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Empresa] SET  MULTI_USER 
GO
ALTER DATABASE [Empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Empresa] SET DB_CHAINING OFF 
GO
USE [Empresa]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cargo](
	[IdCargo] [tinyint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Empleados](
	[Cedula] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Cargo] [tinyint] NOT NULL
) ON [PRIMARY]

GO
INSERT [Cargo] ([IdCargo], [Nombre]) VALUES (1, N'Supervisor')
INSERT [Empleados] ([Cedula], [Nombre], [Apellido], [FechaNacimiento], [Cargo]) VALUES (232424, N'werfwefsf', N'fdf', CAST(N'2019-10-13' AS Date), 1)
INSERT [Empleados] ([Cedula], [Nombre], [Apellido], [FechaNacimiento], [Cargo]) VALUES (12332487, N'juan', N'jose', CAST(N'2000-09-12' AS Date), 1)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [SPContacto]
	@opc  INT = NULL,
	@Cedula INT=Null,
    @Nombre Varchar(50)=Null,
    @Apellido VARCHAR(50)=Null,
    @Fecha_Nacimiento date =Null,
    @Cargo int=Null

	AS


IF @opc = 1 
BEGIN
	SELECT * FROM dbo.Empleados
END

if @opc = 2
BEGIN 
	insert into dbo.Empleados (Cedula, Nombre, Apellido,FechaNacimiento,Cargo)
	VALUES (@Cedula, @Nombre, @Apellido,@Fecha_Nacimiento,@Cargo)
END 



if @opc = 3
BEGIN
	update dbo.Empleados set Nombre = @Nombre, Apellido = @Apellido, FechaNacimiento = @Fecha_Nacimiento, Cargo = @Cargo 
	where Cedula = @Cedula
END

if @opc = 4
BEGIN 
	delete from Empleados where Cedula = @Cedula
END
GO
USE [master]
GO
ALTER DATABASE [Empresa] SET  READ_WRITE 
GO
