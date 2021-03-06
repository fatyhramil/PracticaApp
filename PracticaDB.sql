USE [PracticaDB]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 18.04.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (1, 2)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (1, 3)
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Ramil', N'Fatykhov', NULL, NULL, CAST(N'2022-03-12T00:00:00.000' AS DateTime), NULL, N'12345678', N'1', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 5, 1, CAST(N'2022-03-12T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'Мужской')
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (1, N'Natura Siberica', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (2, N'Биопин ФАРМА', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (3, N'Milotto', CAST(N'2016-06-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (4, N'Лаборатория натуральной косметики MIXIT', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (5, N'Малавит', CAST(N'2017-09-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (6, N'ANDALOU', CAST(N'2015-11-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (7, N'Agent Netty PRO', CAST(N'2016-03-17' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (8, N'ЕвроТек', CAST(N'2017-10-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (9, N'Blue Beautifly', CAST(N'2017-01-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (10, N'MATSESTA', CAST(N'2018-04-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (11, N'АЙРОН БАРБЕР', CAST(N'2018-04-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (12, N'РУСХИМТЕХ', CAST(N'2018-07-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (13, N'НИКОЛЬ', CAST(N'2018-02-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (14, N'Аравия', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (15, N'Алтэя', CAST(N'2018-05-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (16, N'SHELK Cosmetics', CAST(N'2018-01-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (17, N'Русская косметика', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (18, N'MAGIC HERBS', CAST(N'2018-02-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (19, N'Natura Botanica', CAST(N'2018-05-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (20, N'Bel Savon', CAST(N'2018-04-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (21, N'ИРИДА-НЕВА', CAST(N'2018-05-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (22, N'Славяна', CAST(N'2018-03-09' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (23, N'АЛВА', CAST(N'2018-08-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (24, N'Альпика', CAST(N'2018-05-31' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (25, N'Жерминаль', CAST(N'2018-04-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (26, N'Арт-Визаж', CAST(N'2018-04-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (27, N'Валери-Д', CAST(N'2018-06-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (28, N'Мастерская Fitoland Organic', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (29, N'ДОМ ПРИРОДЫ', CAST(N'2018-11-25' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (30, N'Флора', CAST(N'2018-01-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (31, N'ЭКО ТАВРИДА', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (32, N'АлтайЯ', CAST(N'2018-07-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (33, N'Weleda', CAST(N'2018-04-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (34, N'ANTI AGE', CAST(N'2018-01-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (35, N'Колорит', CAST(N'2018-12-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (36, N'SATIVA', CAST(N'2018-01-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (37, N'Фитокосметик', CAST(N'2018-03-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (38, N'Клеона', CAST(N'2018-01-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (39, N'Живая косметика Сибири', CAST(N'2018-01-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (40, N'SLAVIC HAIR Company', CAST(N'2018-01-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (41, N'Green era', CAST(N'2018-01-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (42, N'SIBERINA', CAST(N'2018-01-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (43, N'Green Mama', CAST(N'2018-01-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (44, N'Altanya', CAST(N'2018-01-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (45, N'Черный бриллиант', CAST(N'2018-01-17' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (46, N'BIOSelect', CAST(N'2018-01-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (47, N'АромаВятка', CAST(N'2018-01-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (48, N'VIQQO — производитель инновационной уходовой косметики', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (49, N'DIONY', CAST(N'2018-01-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (50, N'AMSARVEDA', CAST(N'2018-01-22' AS Date))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (1, N'Ирисовый освежающий увлажняющий крем', 720.0000, N'Ирисовый освежающий увлажняющий крем', N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\1781679-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (2, N'Сыворотка для кожи вокруг глаз с гиалуроновой кислотой', 690.0000, N'Сыворотка для кожи вокруг глаз с гиалуроновой кислотой', N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\2008488-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (3, N'Тоник для лица дневной', 800.0000, N'Тоник для лица дневной, Витаминный', N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\3432465-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (4, N'Массажный крем для лица с увлажняющим и тонизирующим эффектом', 740.0000, N'Массажный крем для лица с увлажняющим и тонизирующим эффектом', N' /Images/6556449-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (5, N'Маска-пленка отшелушивающая с лифтинг-эффектом', 860.0000, N'Маска-пленка отшелушивающая с лифтинг-эффектом', N' /Images/6556452-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (6, N'Специальный крем для клеточного восстановления', 920.0000, N'Специальный крем для клеточного восстановления', N' /Images/6556466-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (7, N'Увлажняющий крем', 730.0000, N'Увлажняющий крем', N' /Images/1781678-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (8, N'Восстанавливающая маска для лица', 630.0000, N'Восстанавливающая маска для лица', N' /Images/3432465-1.jpg', 0, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (10, N'По1рочный набор Сияние', 630.0000, N'По1рочный набор Сияние', N' /Images/6964198-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (11, N'Пена для бритья Натуральная, Лимон и Корица', 470.0000, N'Пена для бритья Натуральная, Лимон и Корица', N' /Images/7528034-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (12, N'Крем питательный тонизирующий ночной', 950.0000, N'Крем питательный тонизирующий ночной', N' /Images/3388879-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (13, N'По1рочный набор Супер Увлажнение', 830.0000, N'По1рочный набор Супер Увлажнение', N' /Images/6964197-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (14, N'По1рочный набор Глубокое Очищение', 860.0000, N'По1рочный набор Глубокое Очищение', N' /Images/6964196-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (15, N'Тоник ACTIVE для возрастной кожи лица натуральный', 720.0000, N'Тоник ACTIVE для возрастной кожи лица натуральный', N' /Images/9939709-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (16, N'Эфирное масло мелиссы', 380.0000, N'Эфирное масло мелиссы', N' /Images/7064333-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (17, N'Увлажняющая эмульсия для лица', 910.0000, N'Увлажняющая эмульсия для лица', N' /Images/6556463-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (18, N'Масло персиковое', 280.0000, N'Масло персиковое', N' /Images/6691688-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (19, N'Очищающая коллекция Ночной восстанавливающий крем для лица', 570.0000, N'Очищающая коллекция Ночной восстанавливающий крем для лица', N' /Images/3432453-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (20, N'По1рочный набор For HIM, Сильный мужчина', 900.0000, N'По1рочный набор For HIM, Сильный мужчина', N' /Images/7299377-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (21, N'Антивозрастная коллекция Освежающий тоник Цветочный', 940.0000, N'Антивозрастная коллекция Освежающий тоник Цветочный', N' /Images/3432442-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (22, N'Розовый разглаживающий увлажняющий крем', 890.0000, N'Розовый разглаживающий увлажняющий крем', N' /Images/1781679-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (23, N'Деликатный питательный крем', 890.0000, N'Деликатный питательный крем', N' /Images/1781676-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (24, N'Масло сладкого мин1ля', 250.0000, N'Масло сладкого мин1ля', N' /Images/6691687-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (25, N'Эфирное масло жасмин', 610.0000, N'Эфирное масло жасмин', N' /Images/7064330-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (26, N'Натуральная пенка для умывания, с ароматом розового дерева', 750.0000, N'Натуральная пенка для умывания, с ароматом розового дерева', N' /Images/6953177-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (27, N'Тоник для лица, для сухой и нормальной кожи', 490.0000, N'Тоник для лица, для сухой и нормальной кожи', N' /Images/9631443-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (28, N'Эфирное масло лемонграсс', 380.0000, N'Эфирное масло лемонграсс', N' /Images/7064323-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (29, N'Ирисовый освежающий ночной крем', 840.0000, N'Ирисовый освежающий ночной крем', N' /Images/1781674-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (30, N'Деликатное очищающее молочко', 680.0000, N'Деликатное очищающее молочко', N' /Images/1781675-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (31, N'Эфирное масло корицы', 370.0000, N'Эфирное масло корицы', N' /Images/7064335-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (32, N'Очищающий гель для умывания', 720.0000, N'Очищающий гель для умывания', N' /Images/7847906-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (33, N'Солнцезащитный лосьон для лица и тела', 830.0000, N'Солнцезащитный лосьон для лица и тела', N' /Images/6556469-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (34, N'Коллекция Кокосовая, Очищающая пенка для лица с экстрактами кактуса', 540.0000, N'Коллекция Кокосовая, Очищающая пенка для лица с экстрактами кактуса', N' /Images/3472602-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (35, N'S.O.S. средство против локальных несовершенств кожи', 870.0000, N'S.O.S. средство против локальных несовершенств кожи', N' /Images/7847905-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (36, N'Коллекция Сияние, Очищающая крем-пенка Лимон Мейера', 750.0000, N'Коллекция Сияние, Очищающая крем-пенка Лимон Мейера', N' /Images/3472591-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (37, N'По1рочный набор Сияние и Красота', 570.0000, N'По1рочный набор Сияние и Красота', N' /Images/6964199-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (38, N'Маска-пленка для глубокого очищения пор', 920.0000, N'Маска-пленка для глубокого очищения пор', N' /Images/6556453-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (39, N'Ирисовый освежающий дневной крем', 740.0000, N'Ирисовый освежающий дневной крем', N' /Images/1781693-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (40, N'Деликатный увлажняющий крем', 940.0000, N'Деликатный увлажняющий крем', N' /Images/1781680-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (41, N'Ухаживающее масло, против сухости кожи', 410.0000, N'Ухаживающее масло, против сухости кожи', N' /Images/6953160-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (42, N'Розовое растительное мыло', 470.0000, N'Розовое растительное мыло', N' /Images/1781711-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (43, N'Гранатовый дневной крем-лифтинг', 800.0000, N'Гранатовый дневной крем-лифтинг', N' /Images/1781695-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (44, N'Тонизирующее очищающее средство 2 в 1', 640.0000, N'Тонизирующее очищающее средство 2 в 1', N' /Images/2008488-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (45, N'Сыворотка для лица с гиалуроновой кислотой, для сухой и чувствительной кожи', 590.0000, N'Сыворотка для лица с гиалуроновой кислотой, для сухой и чувствительной кожи', N' /Images/9631448-1.jpg', 0, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (46, N'Эфирное масло лимона', 330.0000, N'Эфирное масло лимона', N' /Images/7064322-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (47, N'Эфирное масло розовое дерево', 510.0000, N'Эфирное масло розовое дерево', N' /Images/7064326-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (48, N'Мягкая пенка для умывания', 680.0000, N'Мягкая пенка для умывания', N' /Images/5625224-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (49, N'Сыворотка для лица с гиалуроновой кислотой, для нормальной кожи', 560.0000, N'Сыворотка для лица с гиалуроновой кислотой, для нормальной кожи', N' /Images/9631445-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (50, N'Тоник для лица, для жирной и проблемной кожи', 600.0000, N'Тоник для лица, для жирной и проблемной кожи', N' /Images/9631442-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (51, N'Пенка для умывания, для сухой и чувствительной кожи', 440.0000, N'Пенка для умывания, для сухой и чувствительной кожи', N' /Images/9631439-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (52, N'Антивозрастной крем для лица с органическими яго1ми годжи', 990.0000, N'Антивозрастной крем для лица с органическими яго1ми годжи', N' /Images/6433981-1.jpg', 0, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (53, N'Эфирное масло эвкалипт', 410.0000, N'Эфирное масло эвкалипт', N' /Images/7064320-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (54, N'Сыворотка PERFECT SERUM депигментирующая натуральная', 710.0000, N'Сыворотка PERFECT SERUM депигментирующая натуральная', N' /Images/9939719-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (55, N'Крем для лица с антиокси1нтами органической клюквы', 980.0000, N'Крем для лица с антиокси1нтами органической клюквы', N' /Images/6433979-1.jpg', 0, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (56, N'Пенка для лица для чувствительной кожи', 630.0000, N'Пенка для лица для чувствительной кожи', N' /Images/3472601-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (57, N'Коллекция Кокосовая, Укрепляющая сыворотка с экстрактами кактуса', 680.0000, N'Коллекция Кокосовая, Укрепляющая сыворотка с экстрактами кактуса', N' /Images/3472604-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (58, N'Крем-маска WOW EFFECT омолаживающая для лица натуральная', 950.0000, N'Крем-маска WOW EFFECT омолаживающая для лица натуральная', N' /Images/9939704-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (59, N'По1рочный набор For MEN', 840.0000, N'По1рочный набор For MEN', N' /Images/7299378-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (60, N'Очищающий гель для нормальной и сухой кожи лица', 720.0000, N'Очищающий гель для нормальной и сухой кожи лица', N' /Images/6556458-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (61, N'Лифтинг-сыворотка для лица', 930.0000, N'Лифтинг-сыворотка для лица', N' /Images/6556462-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (62, N'Тоник для ухо1 за сухой и нормальной кожей', 990.0000, N'Тоник для ухо1 за сухой и нормальной кожей', N' /Images/6556459-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (63, N'Питательный крем для лица', 800.0000, N'Питательный крем для лица', N' /Images/6556464-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (64, N'Крем против морщин для глаз', 570.0000, N'Крем против морщин для глаз', N' /Images/5427580-1.jpg', 0, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (65, N'Лифтинг-сыворотка для лица с гиалуроновой кислотой', 610.0000, N'Лифтинг-сыворотка для лица с гиалуроновой кислотой', N' /Images/9631446-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (66, N'Деликатное питательное масло для лица', 930.0000, N'Деликатное питательное масло для лица', N' /Images/2262226-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (67, N'Тонизирующая сыворотка для лица', 780.0000, N'Тонизирующая сыворотка для лица', N' /Images/6556461-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (68, N'Масло праймер для лица (основа под макияж), Выравнивание', 530.0000, N'Масло праймер для лица (основа под макияж), Выравнивание', N' /Images/6953159-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (69, N'Сыворотка COUPEROSE укрепляющая сосуды натуральная', 590.0000, N'Сыворотка COUPEROSE укрепляющая сосуды натуральная', N' /Images/9939714-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (70, N'Органический тонер с экстрактом Розы', 960.0000, N'Органический тонер с экстрактом Розы', N' /Images/7889950-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (71, N'Пенка для умывания, для жирной и комбинированной кожи', 780.0000, N'Пенка для умывания, для жирной и комбинированной кожи', N' /Images/9631437-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (72, N'Маска для лица увлажняющая и тонизирующая', 860.0000, N'Маска для лица увлажняющая и тонизирующая', N' /Images/6556451-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (73, N'Эфирное масло чайного дерева', 410.0000, N'Эфирное масло чайного дерева', N' /Images/7064334-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (74, N'Очищающий гель для комбинированной и жирной кожи лица', 980.0000, N'Очищающий гель для комбинированной и жирной кожи лица', N' /Images/6556457-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (75, N'Масло после бритья Натуральное, Лимон и Корица', 300.0000, N'Масло после бритья Натуральное, Лимон и Корица', N' /Images/7528031-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (76, N'Ухаживающее масло для лица, восстанавливает кожу', 420.0000, N'Ухаживающее масло для лица, восстанавливает кожу', N' /Images/6953176-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (77, N'По1рочный набор Мягкое Очищение', 850.0000, N'По1рочный набор Мягкое Очищение', N' /Images/6964195-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (78, N'Гранатовый ночной крем-лифтинг', 560.0000, N'Гранатовый ночной крем-лифтинг', N' /Images/1781696-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (79, N'Живительный тоник для лица', 770.0000, N'Живительный тоник для лица', N' /Images/2008486-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (80, N'Универсальный питательный крем SKIN FOOD', 640.0000, N'Универсальный питательный крем SKIN FOOD', N' /Images/2351755-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (81, N'Органическое 100% аргановое масло', 760.0000, N'Органическое 100% аргановое масло', N' /Images/6433982-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (82, N'Пенка для умывания, для нормальной кожи', 400.0000, N'Пенка для умывания, для нормальной кожи', N' /Images/9631438-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (83, N'Крем PERFECT выравнивающий тон лица натуральный', 780.0000, N'Крем PERFECT выравнивающий тон лица натуральный', N' /Images/9939700-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (84, N'Чистящая пена-гель для лица', 550.0000, N'Чистящая пена-гель для лица', N' /Images/2697586-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (85, N'Пенка для умывания Натуральная, Лимон и корица', 280.0000, N'Пенка для умывания Натуральная, Лимон и корица', N' /Images/7528032-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (86, N'Масло для лица массажное, с эффектом Лифтинга', 500.0000, N'Масло для лица массажное, с эффектом Лифтинга', N' /Images/6953169-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (87, N'Увлажняющий 24-часовой крем против морщин', 910.0000, N'Увлажняющий 24-часовой крем против морщин', N' /Images/2697576-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (88, N'По1рочный набор Travel, в Командировку, мужской', 880.0000, N'По1рочный набор Travel, в Командировку, мужской', N' /Images/7299376-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (89, N'Тоник для ухо1 за жирной и комбинированной кожей', 800.0000, N'Тоник для ухо1 за жирной и комбинированной кожей', N' /Images/6556460-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (90, N'Тонизирующий крем для лица', 800.0000, N'Тонизирующий крем для лица', N' /Images/6556465-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (91, N'Восстанавливающий крем для лица с органическим шиповником', 960.0000, N'Восстанавливающий крем для лица с органическим шиповником', N' /Images/6433984-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (92, N'Эфирное масло перечной мяты', 390.0000, N'Эфирное масло перечной мяты', N' /Images/7064324-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (93, N'Тоник для лица, Успокаивающий, для всех типов кожи', 410.0000, N'Тоник для лица, Успокаивающий, для всех типов кожи', N' /Images/6953158-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (94, N'Эфирное масло бергамота', 380.0000, N'Эфирное масло бергамота', N' /Images/7064315-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (95, N'Гималайская грязевая маска восстанавливающая', 640.0000, N'Гималайская грязевая маска восстанавливающая', N' /Images/6556455-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (96, N'Эфирное масло лаванды', 570.0000, N'Эфирное масло лаванды', N' /Images/7064314-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (97, N'Гималайская грязевая маска антиокси1нтная', 660.0000, N'Гималайская грязевая маска антиокси1нтная', N' /Images/6556454-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (98, N'Гранатовая интенсивная сыворотка-лифтинг', 720.0000, N'Гранатовая интенсивная сыворотка-лифтинг', N' /Images/1781670-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (99, N'Коллекция Кокосовая, Увлажняющий ночной крем с экстрактами кактуса', 700.0000, N'Коллекция Кокосовая, Увлажняющий ночной крем с экстрактами кактуса', N' /Images/3472608-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (100, N'Тоник-пилинг для лица EXFOLIANT на основе фруктовых кислот натуральный', 660.0000, N'Тоник-пилинг для лица EXFOLIANT на основе фруктовых кислот натуральный', N' /Images/9939710-1.jpg', 1, 10)
GO
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (102, N'Гель для волос', 0.0000, N'Гель для волос', N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\1781680-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (103, N'Гель для душа', 0.0000, N'Гель для душа', N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\3472604-1.jpg', 0, 3)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (104, N'Лосьен для лица', 0.0000, N'Лосьен для лица', N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\2697586-1.jpg', 1, 3)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (105, N'Хуй', 0.0000, N'Хуй', NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPhoto] ON 

INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (2, 1, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\1781679-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (9, 4, N' /Images/6556449-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (10, 5, N' /Images/6556452-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (11, 6, N' /Images/6556466-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (12, 7, N' /Images/1781678-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (13, 8, N' /Images/3432465-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (14, 10, N' /Images/6964198-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (15, 11, N' /Images/7528034-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (16, 12, N' /Images/3388879-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (17, 13, N' /Images/6964197-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (18, 14, N' /Images/6964196-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (19, 15, N' /Images/9939709-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (20, 16, N' /Images/7064333-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (21, 17, N' /Images/6556463-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (22, 18, N' /Images/6691688-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (23, 19, N' /Images/3432453-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (24, 20, N' /Images/7299377-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (25, 21, N' /Images/3432442-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (26, 22, N' /Images/1781679-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (27, 23, N' /Images/1781676-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (28, 24, N' /Images/6691687-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (29, 25, N' /Images/7064330-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (30, 26, N' /Images/6953177-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (31, 27, N' /Images/9631443-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (32, 28, N' /Images/7064323-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (33, 29, N' /Images/1781674-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (34, 30, N' /Images/1781675-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (35, 31, N' /Images/7064335-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (36, 32, N' /Images/7847906-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (37, 33, N' /Images/6556469-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (38, 34, N' /Images/3472602-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (39, 35, N' /Images/7847905-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (40, 36, N' /Images/3472591-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (41, 37, N' /Images/6964199-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (42, 38, N' /Images/6556453-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (43, 39, N' /Images/1781693-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (44, 40, N' /Images/1781680-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (45, 41, N' /Images/6953160-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (46, 42, N' /Images/1781711-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (47, 43, N' /Images/1781695-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (48, 44, N' /Images/2008488-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (49, 45, N' /Images/9631448-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (50, 46, N' /Images/7064322-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (51, 47, N' /Images/7064326-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (52, 48, N' /Images/5625224-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (53, 49, N' /Images/9631445-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (54, 50, N' /Images/9631442-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (55, 51, N' /Images/9631439-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (56, 52, N' /Images/6433981-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (57, 53, N' /Images/7064320-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (58, 54, N' /Images/9939719-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (59, 55, N' /Images/6433979-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (60, 56, N' /Images/3472601-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (61, 57, N' /Images/3472604-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (62, 58, N' /Images/9939704-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (63, 59, N' /Images/7299378-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (64, 60, N' /Images/6556458-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (65, 61, N' /Images/6556462-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (66, 62, N' /Images/6556459-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (67, 63, N' /Images/6556464-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (68, 64, N' /Images/5427580-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (69, 65, N' /Images/9631446-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (70, 66, N' /Images/2262226-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (71, 67, N' /Images/6556461-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (72, 68, N' /Images/6953159-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (73, 69, N' /Images/9939714-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (74, 70, N' /Images/7889950-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (75, 71, N' /Images/9631437-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (76, 72, N' /Images/6556451-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (77, 73, N' /Images/7064334-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (78, 74, N' /Images/6556457-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (79, 75, N' /Images/7528031-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (80, 76, N' /Images/6953176-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (81, 77, N' /Images/6964195-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (82, 78, N' /Images/1781696-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (83, 79, N' /Images/2008486-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (84, 80, N' /Images/2351755-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (85, 81, N' /Images/6433982-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (86, 82, N' /Images/9631438-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (87, 83, N' /Images/9939700-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (88, 84, N' /Images/2697586-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (89, 85, N' /Images/7528032-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (90, 86, N' /Images/6953169-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (91, 87, N' /Images/2697576-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (92, 88, N' /Images/7299376-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (93, 89, N' /Images/6556460-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (94, 90, N' /Images/6556465-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (95, 91, N' /Images/6433984-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (96, 92, N' /Images/7064324-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (97, 93, N' /Images/6953158-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (98, 94, N' /Images/7064315-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (99, 95, N' /Images/6556455-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (100, 96, N' /Images/7064314-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (101, 97, N' /Images/6556454-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (102, 98, N' /Images/1781670-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (103, 99, N' /Images/3472608-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (104, 100, N' /Images/9939710-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (109, 102, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\1781680-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (110, 102, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\1781693-1.jpg')
GO
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (111, 1, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\1781711-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (114, 103, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\1781693-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (117, 103, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\3472604-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (119, 2, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\2008488-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (120, 2, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\2262226-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (125, 104, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\2697586-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (132, 3, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\3432465-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (133, 5, N'D:\Programming\WPF\PracticaApp\PracticaApp\Images\1781678-1.jpg')
SET IDENTITY_INSERT [dbo].[ProductPhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (2, CAST(N'2022-03-12T00:00:00.000' AS DateTime), 1, 3, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (3, CAST(N'2022-03-12T00:00:00.000' AS DateTime), 2, 2, 2)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Массаж', 500.0000, 1200, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
