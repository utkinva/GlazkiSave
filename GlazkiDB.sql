USE [master]
GO
/****** Object:  Database [Glazki]    Script Date: 31/01/22 11:32:57 ******/
CREATE DATABASE [Glazki]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Glazki', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Glazki.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Glazki_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Glazki_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Glazki] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Glazki].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Glazki] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Glazki] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Glazki] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Glazki] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Glazki] SET ARITHABORT OFF 
GO
ALTER DATABASE [Glazki] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Glazki] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Glazki] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Glazki] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Glazki] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Glazki] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Glazki] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Glazki] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Glazki] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Glazki] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Glazki] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Glazki] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Glazki] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Glazki] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Glazki] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Glazki] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Glazki] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Glazki] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Glazki] SET  MULTI_USER 
GO
ALTER DATABASE [Glazki] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Glazki] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Glazki] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Glazki] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Glazki] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Glazki] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Glazki] SET QUERY_STORE = OFF
GO
USE [Glazki]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 31/01/22 11:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'СервисПив', 1, N'840377, Рязанская область, город Щёлково, пл. Бухарестская, 42', N'6861024038', N'218034630', N'Никита Александрович Королёв', N'+7 (922) 325-12-93', N'znosov@vasilev.ru', N'', 329)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'СантехСеверЛенМашина', 2, N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', N'3506691089', N'830713603', N'Павел Максимович Рожков', N'(812) 214-73-94', N'pgorbacev@vasilev.net', N'\agents\agent_99.png', 201)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'ЭлектроРемОрионЛизинг', 3, N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', N'1340072597', N'500478249', N'Тарасова Дан Львович', N'(495) 513-93-16', N'anfisa.fedotova@tvetkov.ru', N'\agents\agent_93.png', 198)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'РыбАлмазГаражСнаб', 3, N'278792, Воронежская область, город Люберцы, ул. Космонавтов, 07', N'2135119617', N'916748563', N'Власов Ян Львович', N'(35222) 46-54-74', N'diana.gorbunov@gromov.ru', N'\agents\agent_29.png', 50)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'CибБашкирТекстиль', 4, N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', N'7392007090', N'576103661', N'Григорий Владимирович Елисеева', N'(35222) 92-28-68', N'vzimina@zdanova.com', N'\agents\agent_94.png', 218)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'ЮпитерТяжОрионЭкспедиция', 5, N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', N'6843174002', N'935556458', N'Валерий Евгеньевич Виноградов', N'(812) 819-51-58', N'gblokin@orlov.net', N'\agents\agent_69.png', 446)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'КазаньТекстиль', 5, N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', N'4584384019', N'149680499', N'Александров Бронислав Максимович', N'+7 (922) 936-37-67', N'osimonova@andreeva.com', N'\agents\agent_72.png', 156)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'МясИнфоМясТраст', 5, N'873144, Курская область, город Талдом, проезд Домодедовская, 46', N'6387079446', N'113956342', N'Лихачёваа Оксана Романовна', N'(812) 375-59-29', N'dgulyev@krasilnikov.ru', N'\agents\agent_43.png', 16)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'АвтоТомскЦементЦентр', 4, N'282009, Вологодская область, город Красногорск, пл. Домодедовская, 14', N'8317739640', N'940326934', N'Леонид Иванович Афанасьева', N'(35222) 24-98-18', N'kabanov.valentina@subbotina.ru', N'\agents\agent_40.png', 71)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'Радио', 6, N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', N'9077613654', N'657690787', N'Эмма Андреевна Колесникова', N'(35222) 84-44-92', N'rtretykova@kozlov.ru', N'\agents\agent_68.png', 221)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'ДизайнФинансМикро', 5, N'775051, Иркутская область, город Серебряные Пруды, спуск Домодедовская, 41', N'2700182907', N'141912770', N'Кузьма Борисович Королёва', N'(495) 223-67-97', N'varvara15@belousov.ru', N'', 462)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'Креп', 3, N'336489, Калининградская область, город Можайск, наб. Славы, 35', N'4880732317', N'258673591', N'Назар Алексеевич Григорьева', N'(495) 315-25-86', N'savina.dominika@belousova.com', N'\agents\agent_64.png', 371)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'ЖелДорДизайнМетизТраст', 6, N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', N'7669116841', N'906390137', N'Игорь Львович Агафонова', N'8-800-692-72-18', N'lnikitina@kulikova.com', N'', 290)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'Асбоцемент', 2, N'030119, Курганская область, город Дмитров, пер. Славы, 47', N'1261407459', N'745921890', N'Никитинаа Антонина Андреевна', N'(812) 152-28-78', N'antonin19@panfilov.ru', N'\agents\agent_59.png', 273)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'Мобайл', 6, N'273144, Калужская область, город Наро-Фоминск, бульвар Чехова, 70', N'3655195522', N'395816585', N'Горшков Кузьма Фёдорович', N'(495) 532-54-42', N'rafail22@orlov.ru', N'\agents\agent_53.png', 40)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'ТекстильУралАвтоОпт', 3, N'028936, Магаданская область, город Видное, ул. Гагарина, 54', N'3930950057', N'678529397', N'Алина Сергеевна Дьячковаа', N'(495) 418-67-55', N'hkononova@pavlova.ru', N'\agents\agent_97.png', 176)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'Башкир', 1, N'513065, Рязанская область, город Одинцово, шоссе Славы, 93', N'3105334340', N'117513650', N'Одинцова Розалина Дмитриевна', N'8-800-656-63-99', N'iskra.sergeev@zykov.com', N'\agents\agent_33.png', 35)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'ГорДор', 4, N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', N'7088187045', N'440309946', N'Нонна Львовна Одинцоваа', N'(812) 364-46-64', N'maiy12@koklov.net', N'\agents\agent_77.png', 175)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'Компания Рос', 2, N'479740, Оренбургская область, город Наро-Фоминск, наб. Будапештсткая, 36', N'5502989807', N'518320454', N'Алёна Ивановна Тимофеева', N'(35222) 32-99-94', N'odenisov@knyzeva.ru', N'', 252)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'КазЮпитерТомск', 5, N'393450, Тульская область, город Кашира, пр. 1905 года, 47', N'9201745524', N'510248846', N'Рафаил Андреевич Копылов', N'(35222) 24-85-54', N'tgavrilov@frolov.ru', N'\agents\agent_85.png', 244)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'СеверГаз', 6, N'509479, Орловская область, город Павловский Посад, спуск Бухарестская, 28', N'7908427926', N'249521550', N'Валериан Андреевич Кириллова', N'(812) 973-88-81', N'smukina@evseev.com', N'\agents\agent_15.png', 83)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'Компания КазАлмаз', 2, N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', N'3084797352', N'123190924', N'Марк Фёдорович Муравьёва', N'+7 (922) 692-21-57', N'irina.gusina@vlasova.ru', N'\agents\agent_105.png', 396)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'ЦементАсбоцементОрионТраст', 5, N'221534, Орловская область, город Серебряные Пруды, проезд Гагарина, 54', N'2972154471', N'668972219', N'Павлова Марк Александрович', N'(495) 979-36-66', N'igulyeva@kostina.ru', N'\agents\agent_28.png', 441)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'Компания Электро', 2, N'183744, Рязанская область, город Клин, въезд Косиора, 29', N'4335399269', N'780051451', N'Кабанов Кирилл Максимович', N'(35222) 63-92-83', N'blokin.sofiy@terentev.ru', N'\agents\agent_41.png', 340)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'БашкирЮпитерТомск', 3, N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', N'1606315697', N'217799345', N'Фадеева Раиса Александровна', N'(812) 395-91-75', N'dyckov.veniamin@kotova.ru', N'\agents\agent_84.png', 139)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ОрионВектор', 3, N'138159, Свердловская область, город Подольск, спуск Балканская, 72', N'5687675108', N'816451597', N'Алексей Борисович Семёнова', N'+7 (922) 456-59-29', N'subbotin.rostislav@zueva.org', N'\agents\agent_22.png', 496)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'Рос', 1, N'412597, Калужская область, город Клин, пр. Гагарина, 57', N'6729448041', N'935241906', N'Никифороваа Рената Сергеевна', N'+7 (922) 822-88-76', N'potapov.abram@trofimova.org', N'\agents\agent_36.png', 158)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'ДизайнВосток', 4, N'680394, Оренбургская область, город Павловский Посад, спуск Косиора, 50', N'6222265808', N'245694799', N'Добрыня Сергеевич Кабанов', N'+7 (922) 767-84-15', N'efimova.timofei@tretykova.ru', N'\agents\agent_17.png', 188)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'РемГаражЛифт', 5, N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', N'1656477206', N'988968838', N'Филатов Владимир Максимович', N'(35222) 18-85-61', N'novikova.gleb@sestakov.ru', N'\agents\agent_90.png', 374)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'ПивГлав', 2, N'244290, Астраханская область, город Талдом, проезд Космонавтов, 17', N'3090235456', N'870818930', N'Клим Иванович Юдин', N'8-800-153-74-46', N'sofiy.bolsakov@isakova.ru', N'\agents\agent_27.png', 329)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'Компания Гараж', 2, N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', N'6190244524', N'399106161', N'Владлена Фёдоровна Ларионоваа', N'(35222) 22-47-12', N'asiryeva@andreeva.com', N'\agents\agent_91.png', 413)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'Монтаж', 1, N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', N'6142194281', N'154457435', N'Блохина Сергей Максимович', N'(495) 783-36-97', N'zakar.sazonova@gavrilov.ru', N'\agents\agent_66.png', 300)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'ВодГараж', 5, N'988899, Саратовская область, город Раменское, пр. Славы, 40', N'5575072431', N'684290320', N'Лаврентий Фёдорович Логинова', N'(35222) 11-75-66', N'pmaslov@fomiceva.com', N'\agents\agent_92.png', 250)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'Компания Метал', 2, N'908229, Иркутская область, город Истра, бульвар Бухарестская, 97', N'9933367989', N'856443865', N'Валентина Ивановна Громова', N'(35222) 99-39-28', N'vasileva.tatyna@lebedeva.net', N'\agents\agent_16.png', 167)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'Бум', 1, N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', N'1953785418', N'122905583', N'Татьяна Сергеевна Королёваа', N'+7 (922) 282-82-91', N'belova.vikentii@konstantinova.net', N'\agents\agent_103.png', 82)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'Гор', 6, N'245009, Белгородская область, город Коломна, шоссе Домодедовская, 93', N'6196739969', N'784512010', N'Адриан Александрович Одинцов', N'(812) 327-52-23', N'rostislav.savelev@dmitrieva.ru', N'\agents\agent_46.png', 85)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'МясРеч', 3, N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', N'9254261217', N'656363498', N'Белоусоваа Ирина Максимовна', N'(812) 256-74-95', N'bkozlov@volkov.ru', N'\agents\agent_83.png', 355)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'МясТрансМоторЛизинг', 5, N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', N'6148685143', N'196332656', N'Тамара Дмитриевна Семёноваа', N'(495) 489-75-57', N'vlad.sokolov@andreev.org', N'\agents\agent_87.png', 268)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'Компания ТелекомХмельГаражПром', 2, N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', N'1614623826', N'824882264', N'Костина Татьяна Борисовна', N'8-800-617-13-37', N'qkolesnikova@kalinina.ru', N'\agents\agent_96.png', 457)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'МетизТехАвтоПроф', 2, N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', N'2988890076', N'215491048', N'Егор Фёдорович Третьякова', N'8-800-192-74-77', N'anastasiy.gromov@samsonova.com', N'\agents\agent_58.png', 321)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'РосАвтоМонтаж', 2, N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', N'4735043946', N'263682488', N'Диана Алексеевна Исаковаа', N'8-800-468-91-51', N'lapin.inessa@isaeva.com', N'\agents\agent_80.png', 10)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'Компания КрепГаз', 2, N'415525, Воронежская область, город Орехово-Зуево, спуск Ленина, 14', N'2910821636', N'169856199', N'Эмилия Фёдоровна Шилова', N'8-800-971-62-32', N'iturova@isakova.ru', N'\agents\agent_48.png', 50)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'БухТеле', 3, N'481781, Астраханская область, город Орехово-Зуево, спуск Ломоносова, 67', N'3547826061', N'581933218', N'Клавдия Романовна Савина', N'(35222) 89-78-68', N'vasilev.svetlana@saskov.org', N'\agents\agent_18.png', 171)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'ТяжМяж', 6, N'255489, Самарская область, город Озёры, ул. Ломоносова, 09', N'6391522710', N'209038885', N'Юлия Львовна Горбунова', N'(812) 425-28-46', N'bzykov@baranov.com', N'\agents\agent_55.png', 472)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'Тех', 5, N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', N'9282924869', N'587356429', N'Аким Романович Логинова', N'+7 (922) 113-94-49', N'vasilisa99@belyev.ru', N'\agents\agent_86.png', 278)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ГлавITФлотПроф', 1, N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', N'2561361494', N'525678825', N'Зыкова Стефан Максимович', N'(35222) 33-48-16', N'savva.rybov@kolobov.ru', N'\agents\agent_89.png', 62)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'Восток', 1, N'284236, Воронежская область, город Павловский Посад, бульвар Ленина, 28', N'8929775900', N'788028687', N'Савинаа Нина Александровна', N'(495) 227-66-48', N'nsitnikova@tikonova.org', N'', 380)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'ТелекомЮпитер', 4, N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', N'9383182378', N'944520594', N'Калинина Татьяна Ивановна', N'(812) 798-33-53', N'kulikov.adrian@zuravlev.org', N'\agents\agent_106.png', 302)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'МонтажВекторМобайлЦентр', 3, N'094869, Ленинградская область, город Ступино, наб. Ленина, 80', N'4433392652', N'757806909', N'Захар Александрович Панова', N'(495) 566-98-62', N'pavel.davydova@tretykov.net', N'\agents\agent_32.png', 372)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'ВостокГлав', 2, N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', N'3580946305', N'405017349', N'Инга Фёдоровна Дмитриева', N'+7 (922) 329-34-28', N'gordei95@kirillov.ru', N'\agents\agent_88.png', 107)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'Компания КрепЦемент', 2, N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', N'3025099903', N'606083992', N'Екатерина Львовна Суворова', N'8-800-628-79-67', N'rusakov.efim@nikiforov.ru', N'\agents\agent_75.png', 426)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'ЖелДор', 3, N'860124, Иркутская область, город Егорьевск, пер. Гагарина, 67', N'9392505809', N'911026119', N'Симоноваа Лариса Борисовна', N'(35222) 26-55-64', N'karitonova.fedosy@vasileva.net', N'\agents\agent_51.png', 429)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'Компания Хмель', 2, N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', N'9004087602', N'297273898', N'Владимир Борисович Суворова', N'(35222) 27-19-66', N'ermakov.mark@isakova.ru', N'\agents\agent_67.png', 2)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'Цемент', 2, N'084315, Амурская область, город Шаховская, наб. Чехова, 62', N'9662118663', N'650216214', N'Анфиса Фёдоровна Буроваа', N'+7 (922) 859-19-97', N'panova.klementina@bobrov.ru', N'\agents\agent_79.png', 340)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'ЛенМобайлМикро', 1, N'737175, Ростовская область, город Одинцово, ул. Космонавтов, 99', N'6729041572', N'828657559', N'Изабелла Евгеньевна Дьячкова', N'(35222) 96-34-97', N'frolov.artem@zuravlev.ru', N'\agents\agent_52.png', 341)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'Компания ТверьДизайн', 2, N'672492, Калининградская область, город Москва, проезд Сталина, 64', N'3567301661', N'623881311', N'Доминика Александровна Никитинаа', N'8-800-234-93-22', N'ypotapov@kolesnikova.ru', N'\agents\agent_37.png', 271)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'ВодТверьХозМашина', 3, N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', N'4174253174', N'522227145', N'Александра Дмитриевна Ждановаа', N'(495) 756-36-72', N'tkrylov@baranova.net', N'\agents\agent_81.png', 8)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'ТелеГлавВекторСбыт', 3, N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', N'9504787157', N'419758597', N'Екатерина Фёдоровна Ковалёва', N'+7 (922) 619-91-52', N'nsitnikov@kovaleva.ru', N'\agents\agent_56.png', 185)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'БашкирИнжКрепСбыт', 2, N'191420, Новосибирская область, город Ногинск, пер. Будапештсткая, 28', N'6771467761', N'977595370', N'Алиса Фёдоровна Архипова', N'+7 (922) 495-46-18', N'vlad.molcanov@fomicev.ru', N'\agents\agent_24.png', 475)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'ТрансТверь', 4, N'818676, Томская область, город Павловский Посад, ул. Ладыгина, 27', N'3311036393', N'590018934', N'Алина Романовна Овчинникова', N'(35222) 22-74-12', N'dorofeev.milan@vorobeva.net', N'\agents\agent_25.png', 495)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'ТелеСеверМикро', 4, N'046300, Орловская область, город Ступино, бульвар Бухарестская, 13', N'9534974527', N'344691556', N'Селезнёв Василий Евгеньевич', N'(35222) 66-26-65', N'koseleva.ylii@potapov.ru', N'\agents\agent_12.png', 254)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'CибПивОмскСнаб', 3, N'816260, Ивановская область, город Москва, ул. Гагарина, 31', N'5676173945', N'256512286', N'Людмила Александровна Сафонова', N'(812) 743-49-87', N'evorontova@potapova.ru', N'', 477)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'ЛенБухМикро-H', 1, N'078797, Мурманская область, город Коломна, пр. Гоголя, 94', N'5943902570', N'103426359', N'Субботин Герасим Владимирович', N'(812) 421-59-75', N'rybov.tatyna@merkuseva.com', N'\agents\agent_30.png', 242)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'ЮпитерЛенГараж-М', 4, N'339507, Московская область, город Видное, ул. Космонавтов, 11', N'2038393690', N'259672761', N'Васильева Валерия Борисовна', N'(812) 229-34-18', N'larkipova@gorbunov.ru', N'\agents\agent_73.png', 470)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'МорВостокТомскПром', 5, N'034623, Белгородская область, город Павловский Посад, проезд Ломоносова, 72', N'4082127026', N'544686044', N'Гавриил Евгеньевич Селиверстов', N'+7 (922) 258-96-16', N'lev.efremov@frolov.ru', N'\agents\agent_20.png', 198)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'Компания ФинансСервис', 2, N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', N'7491491391', N'673621812', N'Клавдия Сергеевна Виноградова', N'8-800-358-54-99', N'robert.serbakov@safonova.ru', N'\agents\agent_63.png', 395)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'Метиз', 2, N'455463, Ярославская область, город Серпухов, пер. Бухарестская, 01', N'4433116074', N'949226221', N'Ян Иванович Егоров', N'(35222) 81-78-92', N'mersova@rodionova.ru', N'\agents\agent_54.png', 168)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'ФлотБух', 4, N'741647, Ульяновская область, город Наро-Фоминск, ул. 1905 года, 11', N'4868711532', N'409331823', N'Муравьёваа Мария Дмитриевна', N'+7 (922) 155-75-21', N'tkuznetova@sukanova.ru', N'\agents\agent_21.png', 385)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'КазХоз', 5, N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', N'6503377671', N'232279972', N'Степанова Роман Иванович', N'8-800-955-44-52', N'istrelkova@fomin.ru', N'', 213)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'Орион', 6, N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', N'2670166502', N'716874456', N'Мартынов Михаил Борисович', N'(35222) 58-77-96', N'aleksei63@kiselev.ru', N'\agents\agent_102.png', 166)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'РечИнж', 5, N'862241, Кемеровская область, город Москва, пер. Славы, 63', N'9289300952', N'534867576', N'Донат Иванович Кудрявцев', N'(812) 971-47-98', N'qloginova@antonov.com', N'\agents\agent_8.png', 426)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'РосПивТверь', 5, N'053965, Магаданская область, город Видное, наб. Балканская, 41', N'2857470864', N'732899890', N'Люся Фёдоровна Горшковаа', N'+7 (922) 692-73-72', N'vitalii.melnikov@kopylov.com', N'\agents\agent_11.png', 368)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'КрепТелекомТекстильМашина', 1, N'754514, Тверская область, город Люберцы, пл. Домодедовская, 84', N'7626613684', N'187506967', N'Богданов Денис Максимович', N'+7 (922) 278-54-95', N'ignatov.adam@kononova.org', N'\agents\agent_39.png', 259)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'МорГлавМонтажЭкспедиция', 5, N'313619, Читинская область, город Чехов, ул. Ленина, 38', N'8619846965', N'796144573', N'Анастасия Львовна Субботинаа', N'(812) 161-96-49', N'flukin@moiseeva.com', N'\agents\agent_34.png', 329)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'ТекстильУралВод', 6, N'872673, Ярославская область, город Видное, спуск Славы, 04', N'8336124514', N'871193263', N'Эльвира Фёдоровна Герасимова', N'(495) 614-67-93', N'obespalov@alekseev.org', N'\agents\agent_9.png', 28)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'Газ', 1, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'8876413796', N'955381891', N'Терентьев Илларион Максимович', N'8-800-278-78-32', N'ulyna.antonov@noskov.ru', N'\agents\agent_101.png', 170)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'ТомскТранс', 2, N'271624, Свердловская область, город Озёры, ул. Косиора, 21', N'6523850838', N'970092830', N'Архипова Юрий Дмитриевич', N'(35222) 66-22-46', N'antonina.krasilnikov@nikonov.ru', N'\agents\agent_47.png', 427)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'Компания ТехТеле', 2, N'285256, Магаданская область, город Дмитров, шоссе Ладыгина, 20', N'1553744119', N'713327632', N'Тихонова Валериан Владимирович', N'8-800-943-36-45', N'anfisa63@sobolev.ru', N'\agents\agent_42.png', 465)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'СофтИнжIT', 5, N'146295, Тверская область, город Одинцово, въезд Бухарестская, 78', N'2368693812', N'791368408', N'Виктор Львович Михайлова', N'8-800-319-27-45', N'yliy.efimov@zdanova.ru', N'\agents\agent_50.png', 460)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'Компания Монтаж', 2, N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', N'6206428565', N'118570048', N'Силин Даниил Иванович', N'(495) 626-86-13', N'afanasev.anastasiy@muravev.ru', N'\agents\agent_100.png', 124)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'СтройГорНефть', 5, N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', N'5916775587', N'398299418', N'Тарасова Макар Максимович', N'(495) 852-82-84', N'lysy.kolesnikova@molcanova.com', N'\agents\agent_62.png', 161)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'ЦементХмельОрионНаладка', 5, N'014379, Кировская область, город Озёры, пр. Будапештсткая, 28', N'2118874929', N'482607758', N'Максим Евгеньевич Гурьева', N'+7 (922) 419-14-19', N'daniil.selezneva@safonova.com', N'\agents\agent_49.png', 61)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'Компания ОрионСтройЛифт', 2, N'819305, Воронежская область, город Талдом, шоссе Ломоносова, 36', N'8834229587', N'958311664', N'Щукина Искра Максимовна', N'8-800-381-59-97', N'artemii.abramova@arkipov.ru', N'', 467)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'Тяж', 1, N'650482, Смоленская область, город Коломна, проезд Косиора, 95', N'5484904441', N'943388774', N'Белов Влад Александрович', N'+7 (922) 547-77-52', N'rodionova.ulyna@noskov.ru', N'\agents\agent_35.png', 207)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'ЦементАсбоцемент', 3, N'619540, Курская область, город Раменское, пл. Балканская, 12', N'4345774724', N'352469905', N'Воронова Мария Александровна', N'+7 (922) 133-68-96', N'polykov.veronika@artemeva.ru', N'\agents\agent_76.png', 426)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'ГазДизайнЖелДор', 4, N'695230, Курская область, город Красногорск, пр. Гоголя, 64', N'2396029740', N'458924890', N'Лев Иванович Третьяков', N'(35222) 39-88-91', N'elizaveta.komarov@rybakov.net', N'\agents\agent_74.png', 236)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'РемСантехОмскБанк', 5, N'289468, Омская область, город Видное, пер. Балканская, 33', N'6823050572', N'176488617', N'Фокина Искра Максимовна', N'(35222) 76-15-56', N'anisimov.mark@vorobev.ru', N'\agents\agent_82.png', 442)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'Мясо', 1, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'1876413796', N'955381891', N'Терентьев Илларион Максимович', N'+7 (922) 315-51-42', N'ulyna.antonov@noskov.ru', N'\agents\agent_107.png', 170)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'КрепГаражСантехМаш', 6, N'207204, Пензенская область, город Одинцово, пер. Гагарина, 80', N'7574946061', N'146206755', N'Аркадий Романович Тихонов', N'(495) 172-31-91', N'vladlen84@ersova.net', N'\agents\agent_10.png', 330)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'ИнжITЖелДор-H', 1, N'019291, Вологодская область, город Клин, ул. Космонавтов, 96', N'8103088511', N'604606043', N'Колесникова Август Владимирович', N'(495) 324-18-82', N'karitonov.aleksandra@samoilov.com', N'\agents\agent_14.png', 129)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'Рем', 3, N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', N'3203830728', N'456254820', N'Шароваа Елизавета Львовна', N'(35222) 46-69-69', N'zanna25@nikiforova.com', N'\agents\agent_104.png', 329)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (92, N'ФинансТелеТверь', 6, N'687171, Томская область, город Лотошино, пл. Славы, 59', N'2646091050', N'971874277', N'Зайцеваа Дарья Сергеевна', N'(495) 839-58-56', N'medvedev.klim@afanasev.com', N'\agents\agent_70.png', 100)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'Строй', 1, N'763019, Омская область, город Шатура, пл. Сталина, 56', N'6678884759', N'279288618', N'Кудрявцев Адриан Андреевич', N'+7 (922) 129-57-13', N'soloveva.adam@andreev.ru', N'\agents\agent_57.png', 12)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'ЭлектроITITСбыт', 3, N'855489, Вологодская область, город Серебряные Пруды, пл. Ломоносова, 57', N'1532104861', N'112607081', N'Якушеваа Варвара Романовна', N'(812) 326-15-27', N'eliseeva.sofy@gorskov.net', N'\agents\agent_23.png', 452)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'ЛенХозМясБанк', 4, N'702413, Саратовская область, город Люберцы, въезд Чехова, 15', N'9266199692', N'335770867', N'Арсений Алексеевич Виноградова', N'(35222) 26-15-93', N'bobrov.viktor@kazakova.ru', N'\agents\agent_31.png', 17)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'ЭлектроМоторТрансСнос', 5, N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', N'6608362851', N'799760512', N'Людмила Евгеньевна Новиковаа', N'(495) 951-23-53', N'inessa.voronov@sidorova.ru', N'\agents\agent_98.png', 151)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'Компания СервисРадиоГор', 2, N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', N'8880473721', N'729975116', N'Попов Вадим Александрович', N'(812) 871-21-15', N'nika.nekrasova@kovalev.ru', N'\agents\agent_65.png', 169)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'Компания МясДизайнДизайн', 2, N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', N'8004989990', N'908629456', N'Клементина Сергеевна Стрелкова', N'(495) 752-21-98', N'gleb.gulyev@belyeva.com', N'\agents\agent_78.png', 491)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'БашкирФлотМотор-H', 4, N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', N'1657476072', N'934931159', N'Марат Алексеевич Фролов', N'(812) 737-79-77', N'morozova.nika@kazakova.ru', N'\agents\agent_61.png', 416)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'СофтМонтажХозСбыт', 5, N'860932, Калужская область, город Наро-Фоминск, ул. Балканская, 78', N'5408216010', N'737659265', N'Харитонов Антонин Владимирович', N'(495) 396-23-64', N'zinaida90@filippov.org', N'\agents\agent_44.png', 403)
GO
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 
GO
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'МФО', NULL)
GO
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'ООО', NULL)
GO
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'ЗАО', NULL)
GO
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'МКК', NULL)
GO
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'ОАО', NULL)
GO
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'ПАО', NULL)
GO
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Маска на лицо открытого типа 4556', 1, N'7560408', N'', N'', 3, 3, CAST(1576.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Очки прозрачные затемненные 2256', 1, N'76452269', N'', N'', 3, 9, CAST(342.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Защита глаз с клапаном 2579', 1, N'50785095', N'', N'', 3, 5, CAST(832.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Маска на лицо затемненные 5068', 1, N'44451659', N'', N'', 3, 6, CAST(1713.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Маска защитная закрытого типа 1359', 2, N'75996796', N'', N'', 4, 12, CAST(198.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Очки прозрачные открытого типа 2830', 3, N'67633308', N'', N'', 5, 2, CAST(1269.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Маска на лицо с клапаном 3370', 4, N'81175619', N'', N'', 1, 3, CAST(822.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Маска защитная затемненные 1396', 4, N'21739873', N'', N'', 2, 10, CAST(744.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Защита глаз затемненные 1999', 3, N'83267291', N'', N'', 1, 8, CAST(1105.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Маска защитная с клапаном 2921', 2, N'42906442', N'', N'', 4, 3, CAST(273.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Очки красные затемненные 5288', 2, N'17973888', N'', N'', 5, 10, CAST(1383.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Маска защитная закрытого типа 1508', 2, N'38631872', N'', N'', 5, 10, CAST(1521.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Защита глаз от воды с клапаном 5141', 4, N'48232658', N'', N'', 2, 10, CAST(1754.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Очки прозрачные с клапаном 4732', 1, N'9796980', N'', N'', 4, 5, CAST(1806.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Маска на лицо открытого типа 3158', 4, N'47415783', N'', N'', 5, 1, CAST(1285.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Очки прозрачные с клапаном 5034', 4, N'6783736', N'', N'', 3, 12, CAST(1475.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Защита глаз затемненные 1922', 2, N'63567187', N'', N'', 4, 9, CAST(1562.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Защита глаз от воды с клапаном 1498', 4, N'73250951', N'', N'', 5, 12, CAST(1868.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Защита глаз от пыли затемненные 6614', 4, N'89589447', N'', N'', 1, 7, CAST(1370.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Очки темные открытого типа 4067', 4, N'74666994', N'', N'', 2, 5, CAST(792.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Защита глаз открытого типа 3465', 2, N'35778001', N'', N'', 2, 4, CAST(212.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Защита глаз от воды закрытого типа 6052', 4, N'80684143', N'', N'', 2, 9, CAST(589.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Очки прозрачные затемненные 5848', 1, N'86254159', N'', N'', 4, 8, CAST(878.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Маска на лицо закрытого типа 4426', 4, N'78789007', N'', N'', 5, 8, CAST(185.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Маска на лицо открытого типа 6456', 1, N'23804393', N'', N'', 3, 12, CAST(1343.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Защита глаз открытого типа 2381', 1, N'80410937', N'', N'', 5, 2, CAST(1690.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Очки прозрачные открытого типа 6480', 2, N'23552742', N'', N'', 5, 12, CAST(729.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Маска на лицо затемненные 6914', 4, N'16837832', N'', N'', 1, 9, CAST(296.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Защита глаз открытого типа 1876', 4, N'18274186', N'', N'', 1, 6, CAST(1754.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Защита глаз с клапаном 2715', 4, N'65896850', N'', N'', 3, 11, CAST(1769.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Защита глаз от воды с клапаном 2922', 3, N'32589387', N'', N'', 1, 3, CAST(1436.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Маска защитная затемненные 3116', 4, N'16694924', N'', N'', 3, 4, CAST(1042.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Маска защитная открытого типа 5493', 1, N'28669954', N'', N'', 4, 9, CAST(565.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Очки темные с клапаном 4354', 4, N'26078631', N'', N'', 2, 6, CAST(1627.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Защита глаз от пыли открытого типа 5443', 2, N'87162470', N'', N'', 5, 8, CAST(1180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Маска на лицо с клапаном 6789', 3, N'75277715', N'', N'', 2, 1, CAST(874.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Защита глаз с клапаном 1456', 1, N'89728004', N'', N'', 3, 10, CAST(1676.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Очки прозрачные закрытого типа 1090', 3, N'51936367', N'', N'', 2, 12, CAST(335.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Защита глаз от воды закрытого типа 1351', 2, N'33766997', N'', N'', 4, 11, CAST(453.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Защита глаз с клапаном 4657', 2, N'60888572', N'', N'', 3, 12, CAST(638.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Очки прозрачные затемненные 2009', 4, N'60643813', N'', N'', 2, 10, CAST(1070.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Очки темные с клапаном 2774', 2, N'74007987', N'', N'', 5, 11, CAST(534.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Очки прозрачные затемненные 4299', 3, N'30033340', N'', N'', 1, 7, CAST(708.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Защита глаз от воды закрытого типа 5795', 1, N'37743614', N'', N'', 1, 11, CAST(1790.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Защита глаз от пыли с клапаном 6767', 4, N'57763347', N'', N'', 4, 5, CAST(371.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Защита глаз затемненные 1433', 3, N'19163774', N'', N'', 3, 12, CAST(1301.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Очки прозрачные с клапаном 2870', 3, N'14625901', N'', N'', 2, 1, CAST(1483.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Очки прозрачные с клапаном 2928', 1, N'72314954', N'', N'', 1, 2, CAST(1467.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Очки прозрачные закрытого типа 1153', 4, N'18277077', N'', N'', 3, 12, CAST(375.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Маска на лицо закрытого типа 2053', 4, N'48084823', N'', N'', 5, 3, CAST(1617.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (1, 4, 33, CAST(N'2014-06-25' AS Date), 8)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (2, 4, 33, CAST(N'2016-12-16' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (3, 4, 18, CAST(N'2018-08-22' AS Date), 1)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (4, 4, 50, CAST(N'2017-07-20' AS Date), 17)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (5, 1, 9, CAST(N'2010-07-20' AS Date), 16)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (6, 1, 34, CAST(N'2011-03-17' AS Date), 20)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (7, 1, 8, CAST(N'2016-04-17' AS Date), 4)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (8, 1, 8, CAST(N'2019-02-12' AS Date), 17)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (9, 1, 47, CAST(N'2018-09-11' AS Date), 9)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (10, 89, 33, CAST(N'2017-10-25' AS Date), 8)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (11, 89, 9, CAST(N'2010-09-13' AS Date), 5)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (12, 15, 1, CAST(N'2014-03-28' AS Date), 20)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (13, 15, 31, CAST(N'2019-02-13' AS Date), 18)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (14, 72, 42, CAST(N'2011-01-04' AS Date), 10)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (15, 72, 20, CAST(N'2011-02-05' AS Date), 11)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (16, 42, 2, CAST(N'2019-01-22' AS Date), 5)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (17, 42, 43, CAST(N'2015-10-18' AS Date), 7)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (18, 73, 11, CAST(N'2015-07-03' AS Date), 3)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (19, 73, 14, CAST(N'2017-07-06' AS Date), 14)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (20, 73, 49, CAST(N'2010-06-09' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (21, 8, 21, CAST(N'2019-06-06' AS Date), 16)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (22, 8, 12, CAST(N'2013-01-28' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (23, 8, 40, CAST(N'2016-01-09' AS Date), 17)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (24, 8, 45, CAST(N'2012-10-15' AS Date), 10)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (25, 8, 49, CAST(N'2013-08-24' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (26, 77, 5, CAST(N'2018-05-01' AS Date), 1)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (27, 77, 46, CAST(N'2012-06-11' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (28, 9, 41, CAST(N'2018-01-14' AS Date), 14)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (29, 9, 16, CAST(N'2011-05-10' AS Date), 11)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (30, 9, 39, CAST(N'2018-06-24' AS Date), 4)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (31, 95, 31, CAST(N'2019-03-10' AS Date), 6)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (32, 95, 4, CAST(N'2012-12-28' AS Date), 13)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (33, 95, 5, CAST(N'2012-10-12' AS Date), 15)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (34, 11, 29, CAST(N'2018-03-05' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (35, 11, 37, CAST(N'2013-06-26' AS Date), 9)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (36, 11, 26, CAST(N'2010-12-21' AS Date), 5)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (37, 11, 26, CAST(N'2010-02-21' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (38, 83, 31, CAST(N'2010-09-13' AS Date), 11)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (39, 83, 17, CAST(N'2014-01-08' AS Date), 5)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (40, 43, 6, CAST(N'2012-11-24' AS Date), 7)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (41, 43, 41, CAST(N'2017-06-24' AS Date), 10)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (42, 71, 38, CAST(N'2012-04-26' AS Date), 17)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (43, 71, 8, CAST(N'2012-08-26' AS Date), 7)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (44, 71, 28, CAST(N'2011-02-27' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (45, 78, 8, CAST(N'2016-05-05' AS Date), 8)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (46, 23, 8, CAST(N'2018-05-23' AS Date), 8)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (47, 23, 33, CAST(N'2013-07-10' AS Date), 18)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (48, 23, 39, CAST(N'2013-04-18' AS Date), 5)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (49, 23, 24, CAST(N'2012-08-01' AS Date), 1)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (50, 17, 18, CAST(N'2016-11-06' AS Date), 7)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (51, 17, 41, CAST(N'2010-03-23' AS Date), 15)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (52, 56, 32, CAST(N'2017-12-09' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (53, 56, 35, CAST(N'2013-01-12' AS Date), 7)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (54, 19, 35, CAST(N'2013-03-18' AS Date), 13)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (55, 19, 13, CAST(N'2013-06-16' AS Date), 20)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (56, 19, 20, CAST(N'2014-09-13' AS Date), 8)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (57, 19, 47, CAST(N'2018-01-18' AS Date), 10)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (58, 21, 43, CAST(N'2012-08-18' AS Date), 7)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (59, 49, 18, CAST(N'2017-09-10' AS Date), 9)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (60, 24, 12, CAST(N'2018-04-18' AS Date), 20)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (61, 24, 26, CAST(N'2017-05-05' AS Date), 20)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (62, 24, 50, CAST(N'2015-03-07' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (63, 36, 18, CAST(N'2016-09-17' AS Date), 13)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (64, 36, 16, CAST(N'2017-12-19' AS Date), 16)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (65, 36, 17, CAST(N'2010-08-27' AS Date), 6)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (66, 36, 26, CAST(N'2011-10-27' AS Date), 15)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (67, 26, 14, CAST(N'2013-02-03' AS Date), 1)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (68, 26, 37, CAST(N'2011-01-06' AS Date), 4)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (69, 59, 48, CAST(N'2012-08-06' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (70, 27, 9, CAST(N'2012-10-08' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (71, 28, 17, CAST(N'2017-06-15' AS Date), 11)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (72, 47, 14, CAST(N'2010-11-04' AS Date), 10)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (73, 47, 44, CAST(N'2017-12-15' AS Date), 16)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (74, 47, 6, CAST(N'2018-02-06' AS Date), 18)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (75, 47, 25, CAST(N'2011-11-12' AS Date), 6)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (76, 58, 16, CAST(N'2013-08-24' AS Date), 6)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (77, 94, 44, CAST(N'2012-06-04' AS Date), 13)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (78, 94, 47, CAST(N'2015-09-05' AS Date), 17)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (79, 60, 23, CAST(N'2015-06-24' AS Date), 10)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (80, 60, 15, CAST(N'2019-01-08' AS Date), 10)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (81, 60, 48, CAST(N'2011-12-16' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (82, 44, 12, CAST(N'2012-01-04' AS Date), 3)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (83, 44, 32, CAST(N'2018-12-07' AS Date), 15)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (84, 84, 49, CAST(N'2010-05-08' AS Date), 13)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (85, 84, 37, CAST(N'2014-01-16' AS Date), 3)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (86, 84, 31, CAST(N'2014-07-10' AS Date), 16)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (87, 63, 14, CAST(N'2013-04-18' AS Date), 1)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (88, 63, 21, CAST(N'2019-08-09' AS Date), 1)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (89, 52, 43, CAST(N'2019-09-26' AS Date), 17)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (90, 52, 29, CAST(N'2014-03-24' AS Date), 4)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (91, 52, 22, CAST(N'2015-02-12' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (92, 74, 29, CAST(N'2019-12-23' AS Date), 13)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (93, 65, 37, CAST(N'2019-11-07' AS Date), 17)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (94, 79, 34, CAST(N'2011-07-20' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (95, 61, 10, CAST(N'2014-04-12' AS Date), 13)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (96, 82, 17, CAST(N'2010-11-10' AS Date), 1)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (97, 75, 9, CAST(N'2013-03-23' AS Date), 10)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (98, 67, 48, CAST(N'2019-03-05' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (99, 90, 19, CAST(N'2017-12-17' AS Date), 8)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (100, 100, 27, CAST(N'2011-11-01' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 
GO
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'С клапаном', 0)
GO
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Открытого типа', 0)
GO
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Закрытого типа', 0)
GO
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Затемненные', 0)
GO
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [Glazki] SET  READ_WRITE 
GO
