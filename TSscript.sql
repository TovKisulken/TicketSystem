USE [master]
GO
/****** Object:  Database [TicketSystem]    Script Date: 29.12.2021 23:37:49 ******/
CREATE DATABASE [TicketSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketSystem', FILENAME = N'B:\Programs\MSSQL15.MSSQLSERVER\MSSQL\DATA\TicketSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketSystem_log', FILENAME = N'B:\Programs\MSSQL15.MSSQLSERVER\MSSQL\DATA\TicketSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TicketSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [TicketSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TicketSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TicketSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TicketSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TicketSystem', N'ON'
GO
ALTER DATABASE [TicketSystem] SET QUERY_STORE = OFF
GO
USE [TicketSystem]
GO
/****** Object:  Table [dbo].[ActionLog]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionLog](
	[ID] [uniqueidentifier] NOT NULL,
	[IDSession] [uniqueidentifier] NOT NULL,
	[Action] [nvarchar](500) NOT NULL,
	[CD] [datetime] NOT NULL,
 CONSTRAINT [PK_ActionLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [uniqueidentifier] NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[House] [nvarchar](50) NOT NULL,
	[Building] [nvarchar](50) NULL,
	[CD] [datetime] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Disable] [bit] NOT NULL,
	[DisableCD] [datetime] NULL,
	[DisableAuthor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCategories]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCategories](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[SortIndex] [int] NOT NULL,
	[CD] [datetime] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Disable] [bit] NOT NULL,
	[DisableCD] [datetime] NULL,
	[DisableAuthor] [nvarchar](50) NULL,
 CONSTRAINT [PK_EventCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[IDCategory] [uniqueidentifier] NOT NULL,
	[MaxViewers] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[IDAddress] [uniqueidentifier] NOT NULL,
	[IDOrganization] [uniqueidentifier] NOT NULL,
	[CD] [datetime] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Disable] [bit] NOT NULL,
	[DisableCD] [datetime] NULL,
	[DisableAuthor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Events_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[OGRN] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[CD] [datetime] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Disable] [bit] NOT NULL,
	[DisableCD] [datetime] NULL,
	[DisableAuthor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionLog]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionLog](
	[ID] [uniqueidentifier] NOT NULL,
	[IDUser] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SessionLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketCategories]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketCategories](
	[ID] [uniqueidentifier] NOT NULL,
	[IDEvent] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Price] [float] NOT NULL,
	[MaxCount] [int] NOT NULL,
	[CD] [datetime] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Disable] [bit] NOT NULL,
	[DisableCD] [datetime] NULL,
	[DisableAuthor] [nvarchar](50) NULL,
 CONSTRAINT [PK_TicketCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[ID] [uniqueidentifier] NOT NULL,
	[IDEvent] [uniqueidentifier] NOT NULL,
	[IDTicketCategory] [uniqueidentifier] NOT NULL,
	[BuyerEmail] [nvarchar](50) NOT NULL,
	[CD] [datetime] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Disable] [bit] NOT NULL,
	[DisableCD] [datetime] NULL,
	[DisableAuthor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.12.2021 23:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [uniqueidentifier] NOT NULL,
	[IDRole] [uniqueidentifier] NOT NULL,
	[Login] [varchar](64) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Surename] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Sex] [nvarchar](10) NOT NULL,
	[CD] [datetime] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Disable] [bit] NOT NULL,
	[DisableCD] [datetime] NULL,
	[DisableAuthor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActionLog]  WITH CHECK ADD  CONSTRAINT [FK_ActionLog_SessionLog] FOREIGN KEY([IDSession])
REFERENCES [dbo].[SessionLog] ([ID])
GO
ALTER TABLE [dbo].[ActionLog] CHECK CONSTRAINT [FK_ActionLog_SessionLog]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Addresses] FOREIGN KEY([IDAddress])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Addresses]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventCategories] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[EventCategories] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventCategories]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Organizations] FOREIGN KEY([IDOrganization])
REFERENCES [dbo].[Organizations] ([ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Organizations]
GO
ALTER TABLE [dbo].[SessionLog]  WITH CHECK ADD  CONSTRAINT [FK_SessionLog_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SessionLog] CHECK CONSTRAINT [FK_SessionLog_Users]
GO
ALTER TABLE [dbo].[TicketCategories]  WITH CHECK ADD  CONSTRAINT [FK_TicketCategories_Events1] FOREIGN KEY([IDEvent])
REFERENCES [dbo].[Events] ([ID])
GO
ALTER TABLE [dbo].[TicketCategories] CHECK CONSTRAINT [FK_TicketCategories_Events1]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_TicketCategories] FOREIGN KEY([IDTicketCategory])
REFERENCES [dbo].[TicketCategories] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Ticket_TicketCategories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [TicketSystem] SET  READ_WRITE 
GO
