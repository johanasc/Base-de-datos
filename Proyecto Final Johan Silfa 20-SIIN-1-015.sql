/*Nombre: Johan Silfa Matricula: 20-SIIN-1-015 Seccion: 541 */
USE [master]
GO
/****** Object:  Database [Escuela]    Script Date: 4/14/2022 9:59:07 PM ******/
CREATE DATABASE [Escuela]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Escuela', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Escuela.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Escuela_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Escuela_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Escuela] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Escuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Escuela] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Escuela] SET ARITHABORT OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Escuela] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Escuela] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Escuela] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Escuela] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Escuela] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Escuela] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Escuela] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Escuela] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Escuela] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Escuela] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Escuela] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Escuela] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Escuela] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Escuela] SET RECOVERY FULL 
GO
ALTER DATABASE [Escuela] SET  MULTI_USER 
GO
ALTER DATABASE [Escuela] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Escuela] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Escuela] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Escuela] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Escuela] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Escuela] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Escuela', N'ON'
GO
ALTER DATABASE [Escuela] SET QUERY_STORE = OFF
GO
USE [Escuela]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 4/14/2022 9:59:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[Id] [char](8) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Fecha_nacimiento] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 4/14/2022 9:59:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[Id] [char](8) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 4/14/2022 9:59:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[Id] [char](8) NOT NULL,
	[IdAsignatura] [char](8) NOT NULL,
	[IdAlumno] [char](8) NOT NULL,
	[IdProfesor] [char](8) NOT NULL,
	[Fecha] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institucion]    Script Date: 4/14/2022 9:59:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institucion](
	[Id] [varchar](10) NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 4/14/2022 9:59:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[Id] [char](8) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Fecha_nacimiento] [char](8) NULL,
	[Nivel_Academico] [varchar](20) NULL,
	[IdIntitucion] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Profesor__3214EC07E88A2A0E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'1       ', N'Ramon', N'Laureano', N'c/ girasoles #22', N'12012005')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'10      ', N'Jismell', N'Rodriguez', N'c/B, #13', N'08042007')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'11      ', N'Lizbel', N'Monegro', N'c/ 4ta, #16', N'05022009')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'12      ', N'Lorena', N'Pierre', N'c/sandoval, #2', N'14052005')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'2       ', N'Laura', N'Peña', N'c/ 4ta, #1', N'05082003')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'3       ', N'Yulissa', N'Geronimo', N'c/ gardenias #2', N'13042006')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'4       ', N'Carolina', N'Santana', N'c/ martini #30', N'26122005')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'5       ', N'Luciano', N'Perez', N'c/ catanga, #36', N'12122000')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'6       ', N'Francisco', N'Acosta', N'c/ Rosa Duarte, #15', N'01102002')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'7       ', N'Carmen', N'De La Cruz', N'c/ 3ra, #7', N'10012007')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'8       ', N'Johanna', N'Abreu', N'c/2da, #42', N'05092004')
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento]) VALUES (N'9       ', N'Nirvis', N'De Oleo', N'c/ Margarita, #9', N'03052001')
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'1       ', N'Matematicas')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'10      ', N'Quimica')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'11      ', N'Ingles')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'12      ', N'Informatica')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'2       ', N'Naturales')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'3       ', N'Lenguaje')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'4       ', N'Sociales')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'5       ', N'Religion')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'6       ', N'Artistica')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'7       ', N'Educacion Fisica')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'8       ', N'Formacion Humana')
INSERT [dbo].[Asignatura] ([Id], [Nombre]) VALUES (N'9       ', N'Fisica')
GO
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'1       ', N'1       ', N'1       ', N'5       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'10      ', N'10      ', N'7       ', N'8       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'11      ', N'11      ', N'8       ', N'6       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'12      ', N'12      ', N'9       ', N'1       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'2       ', N'2       ', N'2       ', N'2       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'3       ', N'3       ', N'3       ', N'3       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'4       ', N'4       ', N'4       ', N'10      ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'5       ', N'5       ', N'1       ', N'6       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'6       ', N'6       ', N'2       ', N'9       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'7       ', N'7       ', N'3       ', N'7       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'8       ', N'8       ', N'4       ', N'4       ', N'12032021')
INSERT [dbo].[Inscripcion] ([Id], [IdAsignatura], [IdAlumno], [IdProfesor], [Fecha]) VALUES (N'9       ', N'9       ', N'6       ', N'1       ', N'12032021')
GO
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'1', N'Colegio Sagrario Corazon')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'10', N'Colegio Monseñor Liz')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'11', N'Centro RMM')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'12', N'Colegio Doña Rosa')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'2', N'Centro Educativo Fe')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'3', N'Colegio Margarita')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'4', N'Escuela Luz y Vida')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'5', N'Centro Educaivo Duarte')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'6', N'Escuela Mexico')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'7', N'Escuela Venezuela')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'8', N'Colegio Pedro Baez')
INSERT [dbo].[Institucion] ([Id], [Nombre]) VALUES (N'9', N'Colegio Esperanza')
GO
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'1       ', N'Roger', N'Perez', N'c/ primera, #2', N'12031980', N'Master Fisica', N'2')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'10      ', N'Francis', N'Genere', N'c/ 10, #11', N'21121982', N'Licenciada', N'4')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'2       ', N'Herminia', N'De la Cruz', N'c/ segunda, #3', N'13041981', N'Dr. Biologia', N'1')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'3       ', N'Lorena', N'Pacheco', N'c/ tercera, #4', N'14051982', N'Licenciada', N'11')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'4       ', N'Rey David', N'Belen', N'c/ cuarta, #5', N'15061983', N'Licenciado', N'10')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'5       ', N'Jeffry', N'Angomas', N'c/ quinta, #6', N'16071984', N'Dr. Matematicas', N'9')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'6       ', N'Misael', N'Pimantel', N'c/ sexta, #7', N'17081985', N'Dr. en Lenguas', N'8')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'7       ', N'Danauris', N'Jimenez', N'c/ Septima, #8', N'18091986', N'Licenciado', N'7')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'8       ', N'Laura', N'Siri', N'c/ Octaba, #9', N'19101980', N'Dra. en Ciencias', N'6')
INSERT [dbo].[Profesor] ([Id], [Nombre], [Apellido], [Direccion], [Fecha_nacimiento], [Nivel_Academico], [IdIntitucion]) VALUES (N'9       ', N'Ashley', N'Peña', N'c/ novena, #10', N'20111981', N'Licenciada', N'5')
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK__Inscripci__IdPro__36B12243] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([Id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK__Inscripci__IdPro__36B12243]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [fk_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumnos] ([Id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [fk_Alumno]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [fk_Asignatura] FOREIGN KEY([IdAsignatura])
REFERENCES [dbo].[Asignatura] ([Id])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [fk_Asignatura]
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD  CONSTRAINT [FK_Profesor_Institucion] FOREIGN KEY([IdIntitucion])
REFERENCES [dbo].[Institucion] ([Id])
GO
ALTER TABLE [dbo].[Profesor] CHECK CONSTRAINT [FK_Profesor_Institucion]
GO
USE [master]
GO
ALTER DATABASE [Escuela] SET  READ_WRITE 
GO
