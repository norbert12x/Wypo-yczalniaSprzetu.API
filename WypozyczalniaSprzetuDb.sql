USE [master]
GO
/****** Object:  Database [WypozyczalniaSprzetuDb]    Script Date: 28.07.2025 21:57:54 ******/
CREATE DATABASE [WypozyczalniaSprzetuDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WypozyczalniaSprzetuDb', FILENAME = N'C:\Users\Norbert\WypozyczalniaSprzetuDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WypozyczalniaSprzetuDb_log', FILENAME = N'C:\Users\Norbert\WypozyczalniaSprzetuDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WypozyczalniaSprzetuDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET  MULTI_USER 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET QUERY_STORE = OFF
GO
USE [WypozyczalniaSprzetuDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28.07.2025 21:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KategorieSprzetu]    Script Date: 28.07.2025 21:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KategorieSprzetu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_KategorieSprzetu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 28.07.2025 21:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[IdKlienta] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](max) NOT NULL,
	[Nazwisko] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Telefon] [nvarchar](max) NOT NULL,
	[Haslo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Klienci] PRIMARY KEY CLUSTERED 
(
	[IdKlienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezerwacje]    Script Date: 28.07.2025 21:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezerwacje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataOd] [datetime2](7) NOT NULL,
	[DataDo] [datetime2](7) NOT NULL,
	[DataRezerwacji] [datetime2](7) NOT NULL,
	[CzyAnulowana] [bit] NOT NULL,
	[KlientId] [int] NOT NULL,
	[SprzetId] [int] NOT NULL,
 CONSTRAINT [PK_Rezerwacje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sprzety]    Script Date: 28.07.2025 21:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sprzety](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](max) NOT NULL,
	[Opis] [nvarchar](max) NOT NULL,
	[Dostepny] [bit] NOT NULL,
	[KategorieSprzetuId] [int] NOT NULL,
	[Cena] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Sprzety] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zwroty]    Script Date: 28.07.2025 21:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zwroty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataZwrotu] [datetime2](7) NOT NULL,
	[RezerwacjaId] [int] NOT NULL,
 CONSTRAINT [PK_Zwroty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250723083731_InitialCreate', N'9.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250723085218_RenameTableName', N'9.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250723094031_DodanieKolumnyTelefon', N'9.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250723094442_autoincrementid', N'9.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250724082329_addhaslo', N'9.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250724083645_addhaslo', N'9.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250727181734_DodanieCeny', N'9.0.7')
GO
SET IDENTITY_INSERT [dbo].[KategorieSprzetu] ON 

INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (1, N'Sporty zimowe')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (2, N'Rowery górskie')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (3, N'Rowery szosowe')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (4, N'Fitness')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (5, N'Kajaki')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (6, N'Wspinaczka')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (7, N'Hulajnogi elektryczne')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (8, N'Wędkarstwo')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (9, N'Skateboarding')
INSERT [dbo].[KategorieSprzetu] ([Id], [Nazwa]) VALUES (10, N'Sporty wodne')
SET IDENTITY_INSERT [dbo].[KategorieSprzetu] OFF
GO
SET IDENTITY_INSERT [dbo].[Klienci] ON 

INSERT [dbo].[Klienci] ([IdKlienta], [Imie], [Nazwisko], [Email], [Telefon], [Haslo]) VALUES (3, N'Norbert', N'Baj', N'norbertbaj2001@gmail.com', N'669533786', N'$2a$11$CCTjTM6/2KoRDOuKhvp.deRj3PxintKf57pZUxumxb8c6SMowH2Oe')
INSERT [dbo].[Klienci] ([IdKlienta], [Imie], [Nazwisko], [Email], [Telefon], [Haslo]) VALUES (4, N'Paweł', N'Nowakowski', N'Pawel@gmail.com', N'123456789', N'$2a$11$JulFlyqMAyyd2K7kDA5AfuzhJQ.dlQIrhpxCmPuXJ8qA7NUKEiyje')
INSERT [dbo].[Klienci] ([IdKlienta], [Imie], [Nazwisko], [Email], [Telefon], [Haslo]) VALUES (5, N'Jakub', N'nowak', N'Jakub@gmail.com', N'123456781', N'$2a$11$luqvhEHUNP7hAIhql6r5E.ndM1UuDaZdCoSGpKITtyUZ7FW9aKp4W')
INSERT [dbo].[Klienci] ([IdKlienta], [Imie], [Nazwisko], [Email], [Telefon], [Haslo]) VALUES (6, N'Anna', N'Baj', N'Anna@gmail.com', N'123456123', N'$2a$11$OFZIAoaKPM0VonQ8dH3lu.1YR9/2jXnHcDHGi.mOb9y3tn1mD8Vha')
SET IDENTITY_INSERT [dbo].[Klienci] OFF
GO
SET IDENTITY_INSERT [dbo].[Rezerwacje] ON 

INSERT [dbo].[Rezerwacje] ([Id], [DataOd], [DataDo], [DataRezerwacji], [CzyAnulowana], [KlientId], [SprzetId]) VALUES (3, CAST(N'2025-07-27T12:02:35.2190000' AS DateTime2), CAST(N'2025-07-30T12:02:35.2190000' AS DateTime2), CAST(N'2025-07-24T12:02:43.8359059' AS DateTime2), 0, 3, 12)
INSERT [dbo].[Rezerwacje] ([Id], [DataOd], [DataDo], [DataRezerwacji], [CzyAnulowana], [KlientId], [SprzetId]) VALUES (4, CAST(N'2025-07-27T12:02:35.2190000' AS DateTime2), CAST(N'2025-07-30T12:02:35.2190000' AS DateTime2), CAST(N'2025-07-24T12:06:43.9280209' AS DateTime2), 0, 3, 15)
INSERT [dbo].[Rezerwacje] ([Id], [DataOd], [DataDo], [DataRezerwacji], [CzyAnulowana], [KlientId], [SprzetId]) VALUES (5, CAST(N'2025-07-24T12:19:10.7890000' AS DateTime2), CAST(N'2025-07-26T12:19:10.7890000' AS DateTime2), CAST(N'2025-07-24T12:19:20.5184388' AS DateTime2), 0, 3, 21)
INSERT [dbo].[Rezerwacje] ([Id], [DataOd], [DataDo], [DataRezerwacji], [CzyAnulowana], [KlientId], [SprzetId]) VALUES (6, CAST(N'2025-07-28T08:41:52.8540000' AS DateTime2), CAST(N'2025-07-30T08:41:52.8540000' AS DateTime2), CAST(N'2025-07-28T08:48:45.8012565' AS DateTime2), 0, 3, 50)
INSERT [dbo].[Rezerwacje] ([Id], [DataOd], [DataDo], [DataRezerwacji], [CzyAnulowana], [KlientId], [SprzetId]) VALUES (7, CAST(N'2025-07-28T09:01:00.6770000' AS DateTime2), CAST(N'2025-07-30T09:01:00.6770000' AS DateTime2), CAST(N'2025-07-28T09:01:23.8596978' AS DateTime2), 0, 6, 70)
INSERT [dbo].[Rezerwacje] ([Id], [DataOd], [DataDo], [DataRezerwacji], [CzyAnulowana], [KlientId], [SprzetId]) VALUES (8, CAST(N'2025-07-28T09:25:46.7820000' AS DateTime2), CAST(N'2025-07-29T09:25:46.7820000' AS DateTime2), CAST(N'2025-07-28T09:25:46.9593955' AS DateTime2), 0, 3, 28)
INSERT [dbo].[Rezerwacje] ([Id], [DataOd], [DataDo], [DataRezerwacji], [CzyAnulowana], [KlientId], [SprzetId]) VALUES (9, CAST(N'2025-07-28T09:26:15.2620000' AS DateTime2), CAST(N'2025-07-29T09:26:15.2620000' AS DateTime2), CAST(N'2025-07-28T09:26:15.2838022' AS DateTime2), 0, 3, 18)
INSERT [dbo].[Rezerwacje] ([Id], [DataOd], [DataDo], [DataRezerwacji], [CzyAnulowana], [KlientId], [SprzetId]) VALUES (10, CAST(N'2025-08-06T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-08T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-28T10:48:58.7777843' AS DateTime2), 0, 3, 70)
SET IDENTITY_INSERT [dbo].[Rezerwacje] OFF
GO
SET IDENTITY_INSERT [dbo].[Sprzety] ON 

INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (7, N'SnowMaster 3000', N'SnowMaster 3000 to narty narciarskie zaprojektowane z myślą o osobach początkujących i średniozaawansowanych. Ich lekka konstrukcja i stabilność zapewniają wygodę jazdy na różnorodnym terenie.', 1, 1, CAST(21.35 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (8, N'Avalanche X1', N'Avalanche X1 to deska snowboardowa stworzona z myślą o osobach, które chcą poczuć się pewnie podczas jazdy po stoku. Dzięki innowacyjnej technologii rdzenia, zapewnia doskonałą kontrolę i prędkość.', 1, 1, CAST(38.87 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (9, N'FrostBoot Pro', N'Buty narciarskie FrostBoot Pro oferują doskonałą izolację termiczną oraz wygodę, dzięki zastosowaniu innowacyjnych materiałów. Idealne do jazdy na długich trasach, zapewniają pełną stabilność na każdym stoku.', 1, 1, CAST(33.53 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (10, N'Glacier Helm X', N'Kask narciarski Glacier Helm X wyposażony jest w system wentylacji oraz zewnętrzną powłokę, która chroni przed wstrząsami. Komfort i bezpieczeństwo użytkownika na najwyższym poziomie.', 1, 1, CAST(35.92 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (11, N'PolarGrip Gloves', N'Rękawice narciarskie PolarGrip Gloves są odporne na wiatr i wodę, dzięki czemu doskonale sprawdzają się w trudnych warunkach atmosferycznych. Oferują również świetną przyczepność, co pozwala na pewny chwyt kijów narciarskich.', 1, 1, CAST(53.97 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (12, N'SnowShield Goggles', N'Gogle narciarskie SnowShield Goggles zapewniają doskonałą widoczność dzięki specjalnej powłoce antyrefleksyjnej. Wymienne soczewki dostosowują się do warunków pogodowych, gwarantując bezpieczeństwo na stoku.', 1, 1, CAST(24.65 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (13, N'FrostRunner Sanki', N'FrostRunner to tradycyjne sanki drewniane, które oferują niepowtarzalną przyjemność z jazdy po śniegu. Stworzone z wytrzymałego drewna, gwarantują bezpieczną zabawę nawet na stromych zjazdach.', 1, 1, CAST(33.87 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (14, N'IceSail 500', N'Deska do snowkitingu IceSail 500 to sprzęt przeznaczony dla bardziej doświadczonych użytkowników. Została zaprojektowana tak, aby zapewniać maksymalną stabilność nawet przy silnych wiatrach.', 1, 1, CAST(77.42 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (15, N'PolarClad Jacket', N'Kurtka narciarska PolarClad Jacket wyposażona jest w specjalną membranę, która zapewnia całkowitą wodoodporność i oddychalność. Dodatkowe kieszenie i regulowany kaptur zwiększają komfort użytkowania.', 1, 1, CAST(116.05 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (16, N'SnowCarrier Pro Bag', N'Torba transportowa SnowCarrier Pro Bag została zaprojektowana specjalnie do przechowywania sprzętu narciarskiego. Jest przestronna, ma wzmocnione uchwyty i jest łatwa do przenoszenia.', 1, 1, CAST(137.94 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (17, N'MountainRider XT', N'Rower górski MountainRider XT to model, który sprawdzi się zarówno na szlakach, jak i w bardziej wymagających warunkach terenowych. Dzięki solidnej ramie i amortyzatorom, zapewnia wygodną jazdę na nierównych nawierzchniach.', 1, 2, CAST(135.28 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (18, N'TrailMaster 6000', N'TrailMaster 6000 to rower górski stworzony z myślą o długich wyprawach. Jego wytrzymała konstrukcja i specjalistyczne opony zapewniają doskonałą przyczepność na różnych nawierzchniach, nawet w trudnych warunkach.', 1, 2, CAST(127.32 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (19, N'RidgeBiker Pro', N'RidgeBiker Pro to rower górski o lekkiej, ale wytrzymałej ramie. Dzięki nowoczesnym komponentom, zapewnia precyzyjną kontrolę podczas jazdy w terenie i daje pewność na każdym szlaku.', 1, 2, CAST(79.00 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (20, N'AlpineRider 360', N'Rowery AlpineRider 360 to perfekcyjny wybór dla pasjonatów kolarstwa górskiego, którzy szukają wyjątkowej wydajności. Dzięki zaawansowanej technologii amortyzacji, rower ten zapewnia płynność jazdy na najbardziej wymagających trasach.', 1, 2, CAST(127.67 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (21, N'RockClimber XT', N'RockClimber XT to rower górski, który dzięki wyjątkowym oponom, zapewnia optymalną przyczepność na stromych podjazdach i zjazdach. Jego system zawieszenia sprawia, że jazda po kamienistych szlakach jest przyjemnością.', 1, 2, CAST(97.78 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (22, N'EnduroKing 5000', N'EnduroKing 5000 to rower górski zaprojektowany z myślą o ekstremalnych trasach enduro. Wyposażony w sztywne ramy i systemy amortyzacyjne, ten model gwarantuje stabilność i komfort jazdy na trudnych szlakach.', 1, 2, CAST(39.51 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (23, N'TrailBlazer 2.0', N'TrailBlazer 2.0 to rower górski idealny do jazdy po górskich ścieżkach i szlakach. Jego uniwersalne właściwości sprawiają, że jest to świetny wybór zarówno dla amatorów, jak i bardziej zaawansowanych rowerzystów.', 1, 2, CAST(108.65 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (24, N'RidgeRunner Pro X', N'RidgeRunner Pro X to rower zaprojektowany z myślą o wymagających trasach. Jego nowoczesna konstrukcja i systemy zawieszenia sprawiają, że jest jednym z najlepszych wyborów w swojej klasie.', 1, 2, CAST(62.50 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (25, N'PeakExplorer 750', N'PeakExplorer 750 to rower górski stworzony z myślą o długich wyprawach w teren. Wyposażony w systemy amortyzacyjne i wytrzymałe komponenty, gwarantuje komfort i niezawodność podczas pokonywania górskich szlaków.', 1, 2, CAST(133.66 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (26, N'DirtMaster 250', N'DirtMaster 250 to rower górski, który łączy w sobie funkcjonalność i styl. Idealny do jazdy w trudnym terenie, zapewnia doskonałą kontrolę i zwrotność, co czyni go odpowiednim do zarówno rekreacyjnych, jak i sportowych wyzwań.', 1, 2, CAST(21.16 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (27, N'SpeedMaster 3000', N'SpeedMaster 3000 to rower szosowy, który charakteryzuje się wyjątkową lekkością i aerodynamiką. Dzięki zaawansowanej technologii ramy, zapewnia szybkie osiągi na asfaltowych trasach.', 1, 3, CAST(84.15 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (28, N'RoadRunner X', N'RoadRunner X to rower szosowy zaprojektowany z myślą o długich trasach. Jego ergonomiczna konstrukcja oraz precyzyjny system zmiany biegów sprawiają, że jazda jest komfortowa, nawet na długich dystansach.', 0, 3, CAST(41.18 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (29, N'TurboRoad 500', N'TurboRoad 500 to model szosowy stworzony z myślą o wyścigach i osiąganiu wysokich prędkości. Jego lekkie koła oraz innowacyjny system amortyzacji sprawiają, że jest idealny do pokonywania długich tras w szybkim tempie.', 1, 3, CAST(142.68 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (30, N'CycloEdge 1000', N'CycloEdge 1000 to rower szosowy, który łączy w sobie nowoczesny design i wydajność. Dzięki wyjątkowej ramie z włókna węglowego, zapewnia doskonałą sztywność i lekkość, co pozwala na szybkie pokonywanie odcinków szosowych.', 1, 3, CAST(134.08 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (31, N'VeloX 700', N'VeloX 700 to rower szosowy o sportowym charakterze. Jego nowoczesna konstrukcja sprawia, że jest idealny do jazdy na długich dystansach, zapewniając jednocześnie komfort i stabilność.', 1, 3, CAST(137.48 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (32, N'RoadAce 1500', N'RoadAce 1500 to profesjonalny rower szosowy, który oferuje wyjątkową prędkość i precyzyjność. Dzięki zastosowaniu zaawansowanych materiałów, zapewnia niezrównaną sztywność ramy i wydajność na trasach.', 1, 3, CAST(127.73 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (33, N'PaceRider 200', N'PaceRider 200 to rower szosowy zaprojektowany dla miłośników wyścigów. Charakteryzuje się lekką ramą oraz aerodynamicznymi kołami, co czyni go idealnym wyborem na długie, szybkie jazdy po szosach.', 1, 3, CAST(107.23 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (34, N'EliteTrack 800', N'EliteTrack 800 to rower szosowy, który łączy w sobie sportowy wygląd i świetne osiągi. Jego wydajne hamulce i precyzyjny system przerzutek sprawiają, że jest to model, który świetnie sprawdzi się na wymagających trasach.', 1, 3, CAST(23.82 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (35, N'VeloSprint 400', N'VeloSprint 400 to model szosowy przeznaczony do wyścigów i intensywnych treningów. Jego ultralekka rama i aerodynamiczny design pozwalają osiągnąć maksymalne prędkości na szosach.', 1, 3, CAST(127.86 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (36, N'SprintForce 250', N'SprintForce 250 to rower szosowy, który zapewnia doskonałą równowagę pomiędzy prędkością a komfortem. Dzięki innowacyjnym komponentom i lekkiej konstrukcji, sprawdza się zarówno w treningach, jak i w zawodach.', 1, 3, CAST(36.49 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (37, N'Orbitrek Magnetyczny X-Stride 500', N'Profesjonalny orbitrek magnetyczny z 16 poziomami oporu. Wyposażony w wyświetlacz LCD, który pokazuje czas, dystans, kalorie i puls. Idealny do intensywnych treningów cardio.', 1, 4, CAST(143.15 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (38, N'Bieżnia Elektroniczna RunMaster 3000', N'Bieżnia o mocy silnika 3.5 KM, z regulacją kąta nachylenia do 12 stopni. Posiada 12 programów treningowych i amortyzację pasu biegowego. Idealna do treningów biegowych w domu.', 1, 4, CAST(90.74 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (39, N'Rower Spinningowy CycloPro GX', N'Solidny rower spinningowy z ciężkim kołem zamachowym (20 kg) i regulacją oporu. Zapewnia płynny i intensywny trening. Posiada możliwość regulacji siodełka i kierownicy.', 1, 4, CAST(148.96 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (40, N'Stepper Skrętny Twister Plus', N'Kompaktowy stepper skrętny do ćwiczeń dolnych partii ciała. Wyposażony w linki oporowe do pracy nad ramionami. Mały, cichy i idealny do użytku domowego.', 1, 4, CAST(46.72 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (41, N'Wioślarz Magnetyczny AquaRow 700', N'Profesjonalny ergometr wioślarski z 10-stopniową regulacją oporu. Wyświetlacz LCD śledzi czas, kalorie, uderzenia i dystans. Doskonały do treningu całego ciała.', 1, 4, CAST(94.87 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (42, N'Ławka Skośna ThorFit X-Bench', N'Regulowana ławka skośna do brzuszków i ćwiczeń z hantlami. Konstrukcja stalowa, antypoślizgowe uchwyty i wytrzymała tapicerka zapewniają komfort i bezpieczeństwo.', 1, 4, CAST(25.58 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (43, N'Zestaw Hantli HexRubber 2–20 kg', N'Kompletny zestaw hantli gumowanych z sześciokątną podstawą. Antypoślizgowe uchwyty i odporna na uderzenia guma. Idealny do siłowni domowej lub profesjonalnej.', 1, 4, CAST(133.69 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (44, N'Piłka Gimnastyczna FitBall 75 cm', N'Wytrzymała piłka gimnastyczna o średnicy 75 cm. Nadaje się do ćwiczeń stabilizacyjnych, rozciągania i rehabilitacji. W zestawie pompka i instrukcja treningu.', 1, 4, CAST(118.00 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (45, N'Kettlebell Kompozytowy 16 kg BlackCore', N'Odważnik kulowy z winylowym wykończeniem i stalowym uchwytem. Doskonały do treningu siłowego, funkcjonalnego i crossfitu. Ergonomiczny uchwyt zapewnia pewny chwyt.', 1, 4, CAST(86.22 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (46, N'Skakanka CrossPro SpeedRope 2.0', N'Profesjonalna skakanka z łożyskami kulkowymi i regulowaną długością. Świetna do treningu szybkości, koordynacji i spalania kalorii. Aluminiowe rączki zapewniają lekkość i wytrzymałość.', 1, 4, CAST(31.16 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (47, N'Sea Eagle 330 Deluxe', N'Inflatable kayak z miejscem dla dwóch osób, w zestawie pompka, pagaje i pokrowiec. Stabilny i łatwy do transportu – idealny na jeziora i spokojne rzeki.', 1, 5, CAST(142.83 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (48, N'Old Town Loon 120', N'12‑stopowy kajak rekreacyjny o znakomitej stabilności i doskonałej ścieżce płynięcia. Komfortowy, z miejscem na bagaż i dobrze wyprofilowanym kokpitem.', 1, 5, CAST(22.19 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (49, N'Pelican Argo 100X', N'Budżetowy kajak sit‑inside, lekki (~36 lb), z dwiema warstwami trwałego plastiku. Posiada schowek typu hatch i spory kokpit.', 1, 5, CAST(130.50 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (50, N'Wilderness Systems Tarpon 120', N'12‑stopowy sit‑on‑top z bardzo wygodnym, regulowanym siedziskiem i dużą stabilnością – świetny do wędkowania i rekreacji.', 1, 5, CAST(91.98 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (51, N'Hobie Mirage Passport 12.0 R', N'Kajak z napędem pedałowym MirageDrive, idealny do wycieczek i rekreacji. Pozwala na płynne, ręce wolne pływanie i doskonałą manewrowość.', 1, 5, CAST(142.79 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (52, N'Jackson Kayak Cruise', N'Rekreacyjny kajak od Jackson Kayak – solidny, wygodny i dobrze prowadzący się podczas spokojnych spływów rzecznych.', 1, 5, CAST(118.27 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (53, N'Perception Tribe 9.5', N'Stabilny, rekreacyjny kajak sit‑on‑top, łatwy w transporcie. Świetny wybór dla początkujących na jeziora i spokojne rzeki.', 1, 5, CAST(90.50 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (54, N'Advanced Elements AdvancedFrame Convertible', N'Hybrydowy kajak nadmuchiwany z aluminiowym stelażem – składa się do małego pakunku, ale zapewnia twardą powłokę i stabilność.', 1, 5, CAST(45.62 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (55, N'Flyak Hydrofoil', N'Innowacyjny kajak z hydrofoilem, który unosi kadłub nad wodą, osiągając większą prędkość – ekstremalne doznania pływackie.', 1, 5, CAST(24.59 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (56, N'Sea Eagle SE330', N'Jednoosobowy, nadmuchiwany kajak – łatwy w pakowaniu, wytrzymały i stabilny, doskonały dla pojedynczych wypraw rekreacyjnych.', 1, 5, CAST(86.74 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (57, N'Black Diamond Camalot C4 #2', N'Spring-loaded camming device firmy Black Diamond – elastyczny zakres asekuracji, idealny do średniej wielkości szczelin. Wysoka precyzja i odporność sprawiają, że to popularny model wśród wspinaczy tradowych.', 1, 6, CAST(82.15 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (58, N'Petzl GRIGRI +', N'Mechaniczny przyrząd asekuracyjny z hamulcem samoblokującym. Idealny do wspinaczki sportowej i prowadzenia – zapewnia płynne zwijanie liny i zwiększone bezpieczeństwo.', 1, 6, CAST(58.45 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (59, N'La Sportiva Tarantulace', N'Buty wspinaczkowe półautomatyczne, przystępne cenowo, zaprojektowane do siłowni i pierwszych prób skałkowych. Wygodne, z dobrym tarciem XS Grip, polecane dla początkujących i średniozaawansowanych wspinaczy :contentReference[oaicite:1]{index=1}.', 1, 6, CAST(46.99 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (60, N'Scarpa Helix', N'Buty wspinaczkowe na sznurowadła, bardzo komfortowe dzięki wyściełanemu kielichowi pięty. Dobre do dłuższych sesji w skałach, równoważą komfort i precyzję :contentReference[oaicite:2]{index=2}.', 1, 6, CAST(94.29 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (61, N'Five Ten Anasazi VCS', N'Flagowe buty półautomatyczne z gumą Stealth®, chwalone za przyczepność i uniwersalność – sprawdzają się zarówno w skałkach, jak i na ściankach treningowych :contentReference[oaicite:3]{index=3}.', 1, 6, CAST(109.60 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (62, N'Metolius Sling 11 mm 120 cm', N'Wytrzymała pętla z taśmy do asekuracji i ekspozycji punktów. Wysoka trwałość i wszechstronność – przydatna zarówno do tradu, jak i wspinaczki sportowej.', 1, 6, CAST(131.70 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (63, N'Wild Country Dragon Cam #1', N'Alternatywa dla Black Diamond Camalot – lekkie i solidne friendy, cenione za trwałość i precyzyjne zaciskanie. Świetne do trudniejszych linii tradowych :contentReference[oaicite:4]{index=4}.', 1, 6, CAST(136.49 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (64, N'Petzl Boreo Caving Helmet', N'Lekki i wytrzymały kask, zaprojektowany z myślą o eksploracji jaskiń, ale idealnie sprawdza się również podczas wspinaczki – zapewnia ochronę i wygodę.', 1, 6, CAST(70.56 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (65, N'Wild Country Wildwire Quickdraw (12 cm)', N'Zestaw ekspresów z lekkimi karabinkami – uniwersalne do wspinaczki sportowej, dające poczucie bezpieczeństwa oraz wygodę przy prowadzeniu dróg.', 1, 6, CAST(84.50 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (66, N'Black Diamond Momentum Lace', N'Buty wspinaczkowe na sznurowadła, łączące wygodę z dobrym tarciem. Świetne do treningu, codziennych sesji i nauki techniki wspinaczkowej :contentReference[oaicite:5]{index=5}.', 1, 6, CAST(147.97 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (67, N'Unagi Model One Voyager', N'Lekka i elegancka hulajnoga o podwójnym silniku, idealna do miejskich dojazdów. Ma łatwy system składania i solidną ramę z włókna węglowego.', 1, 7, CAST(26.95 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (68, N'Levy Light', N'Hulajnoga z wyjmowaną baterią i opcjonalnymi oponami bezdętkowymi, zapewnia dużą wygodę serwisową. Kompaktowa i praktyczna na co dzień.', 1, 7, CAST(73.70 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (69, N'GOTRAX G7 Pro', N'Solidna hulajnoga dla wyższych osób, wyposażona we wskaźniki kierunkowskazów. Posiada mocny silnik i stabilną konstrukcję.', 1, 7, CAST(132.62 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (70, N'Segway Max G30P', N'Hulajnoga o zasięgu ponad 65 km na jednym ładowaniu, idealna na dłuższe miejskie trasy. Wyposażona w światła LED i światełka kierunkowe.', 0, 7, CAST(112.60 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (71, N'Apollo Go', N'Rozsądny średniak z dwoma silnikami 350 W, dobrą amortyzacją i aplikacją umożliwiającą sterowanie trybami jazdy. Waży ok. 20 kg, co ułatwia przenoszenie.', 1, 7, CAST(21.53 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (72, N'TurboAnt X7 Pro', N'Składana hulajnoga z odłączaną baterią i hamulcami tarczowymi. Osiąga prędkość do 32 km/h i zapewnia wygodny transport dzięki mechanizmowi składania.', 1, 7, CAST(53.87 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (73, N'NIU 100F', N'Budgetowa hulajnoga ze składanymi kierownicami i kierunkowskazami. Ma wytrzymałą konstrukcję i przyzwoity zasięg do codziennych zastosowań.', 1, 7, CAST(146.38 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (74, N'NIU KQi Air', N'Lekka i bardzo przenośna hulajnoga (ok. 12 kg) z funkcjami antykradzieżowymi i kierunkowskazami. Oferuje przyzwoity zasięg i atrakcyjny wygląd.', 1, 7, CAST(39.82 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (75, N'Apollo City', N'Wysokiej klasy hulajnoga z kierunkowskazami na kierownicy i dobrymi parametrami do jazdy miejskiej. Mocny silnik umożliwia jazdę po wzniesieniach.', 1, 7, CAST(141.06 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (76, N'Segway Kickscooter Max G3', N'Wytrzymała hulajnoga z zasięgiem około 80 km i prędkością do 45 km/h. Wyposażona w wbudowane kierunkowskazy i moduł Apple Find My.', 1, 7, CAST(59.41 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (77, N'Ugly Stik GX2 Spinning Rod', N'Wytrzymały i elastyczny kij do spinningu, wykonany z kompozytu włókna szklanego z dodatkiem grafitu. Idealny dla początkujących i średniozaawansowanych – można go wygiąć w kółko bez ryzyka uszkodzenia. :contentReference[oaicite:1]{index=1}', 1, 8, CAST(105.77 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (78, N'Penn Fierce II Reel', N'Solidny kołowrotek z przednim hamulcem, odporny na korozję, doskonały do połowów słodkowodnych. Posiada precyzyjną listwę zębatą i płynny hamulec. :contentReference[oaicite:2]{index=2}', 1, 8, CAST(55.88 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (79, N'ABU Garcia Ambassadeur C4 Baitcaster', N'Klasyczny baitcaster o trwałej konstrukcji, z precyzyjnym hamulcem i metalową obudową – sprawdzi się przy połowach większych ryb. :contentReference[oaicite:3]{index=3}', 1, 8, CAST(49.13 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (80, N'Shimano Stradic FL Spinning Reel', N'Lekkie, ale trwałe kołowrotki przeciwwodnej klasy, złożone z dysków hamulcowych o płynnym działaniu i wysoką kulturą pracy. :contentReference[oaicite:4]{index=4}', 1, 8, CAST(65.14 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (81, N'Daiwa BG Spinning Reel', N'Uniwersalny kołowrotek z aluminiowym korpusem, mocnym hamulcem przednim i wodoodporną przekładnią – świetny do wędkarstwa słodko- i słonowodnego. :contentReference[oaicite:5]{index=5}', 1, 8, CAST(140.64 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (82, N'St. Croix Triumph Casting Rod', N'Wysokiej jakości kij baitcastingowy z lekkim blankiem i ergonomiczną rękojeścią – propozycja dla średniozaawansowanych wędkarzy. :contentReference[oaicite:6]{index=6}', 1, 8, CAST(123.12 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (83, N'Fenwick Eagle Spinning Rod', N'Precyzyjny kij spinningowy wykonany z kompozytu grafitowo-korkowego, oferujący dobrą czułość i wyjątkowy komfort rzutu. :contentReference[oaicite:7]{index=7}', 1, 8, CAST(42.19 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (84, N'Ugly Stik Elite Inshore Rod', N'Wzmocniony kij do połowów przybrzeżnych, odporny na korozję i udary, oferujący świetną wytrzymałość i stabilność. :contentReference[oaicite:8]{index=8}', 1, 8, CAST(101.65 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (85, N'Penn Carnage II Jigging Rod', N'Specjalistyczny kij do jigowania na morzu, z mocnym blankiem i rękojeścią EVA – przystosowany do ciężkich połowów. :contentReference[oaicite:9]{index=9}', 1, 8, CAST(145.56 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (86, N'Seaguar BasiX Fluorocarbon Line', N'Wysokiej jakości żyłka fluorocarbonowa, prawie niewidoczna w wodzie, odporna na przetarcia – świetny wybór dla wymagających wędkarzy. :contentReference[oaicite:10]{index=10}', 1, 8, CAST(25.17 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (87, N'Santa Cruz Screaming Hand', N'Deskorolka z klasycznym designem Santa Cruz, idealna zarówno dla początkujących, jak i zaawansowanych riderów. Posiada łożyska ABEC-7 i deck z 7-warstwowego klonu kanadyjskiego.', 1, 9, CAST(111.96 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (88, N'Element Section Complete', N'Kompletna deskorolka marki Element, oferująca solidną jakość wykonania i wysoką wytrzymałość. Świetna do jazdy miejskiej i podstawowych tricków.', 1, 9, CAST(138.21 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (89, N'Almost Youness R7', N'Model z technologią Resin-7, która zapewnia wyjątkową trwałość. Idealna dla osób szukających lekkiej, ale mocnej deskorolki do jazdy po skateparkach.', 1, 9, CAST(116.26 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (90, N'Powell Peralta Caballero', N'Deska inspirowana latami 80-tymi, doskonała do klasycznego stylu jazdy. Znana ze swojego oryginalnego designu i stabilności przy jeździe ulicznej.', 1, 9, CAST(82.25 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (91, N'Plan B Team OG', N'Pro model od Plan B dla fanów technicznych tricków. Posiada mocne trucki i precyzyjne łożyska, które świetnie sprawdzą się w każdych warunkach.', 1, 9, CAST(148.02 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (92, N'Birdhouse Stage 1 Tony Hawk', N'Deska sygnowana przez legendę – Tony’ego Hawka. Świetna dla początkujących, którzy chcą zacząć swoją przygodę ze skateboardingiem na solidnym sprzęcie.', 1, 9, CAST(51.25 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (93, N'Enjoi Whitey Panda', N'Model od znanej marki Enjoi, oferujący świetny balans między wagą a wytrzymałością. Idealny wybór do codziennej jazdy po mieście.', 1, 9, CAST(50.24 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (94, N'Globe G1 Stack', N'Stylowa deskorolka z nadrukiem graffiti, wyposażona w miękkie koła dla lepszej amortyzacji. Dobra zarówno do jazdy po rampach, jak i po chodnikach.', 1, 9, CAST(141.83 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (95, N'Zero Single Skull', N'Deska w klasycznym stylu marki Zero, zaprojektowana do agresywnej jazdy. Cechuje się bardzo dobrą przyczepnością i responsywnym prowadzeniem.', 1, 9, CAST(105.22 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (96, N'Blind Reaper Rasta', N'Kolorowa deskorolka o jamajskim klimacie, przyciągająca wzrok. Świetnie sprawdza się w trickach dzięki twardym kołom i stabilnemu deckowi.', 1, 9, CAST(21.30 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (97, N'Red Paddle Co Ride 10''6"', N'Uniwersalna deska SUP o długości 10''6 cala, idealna dla początkujących i średniozaawansowanych. Lekka, stabilna i łatwa do transportu dzięki technologii MSL Fusion.', 1, 10, CAST(111.44 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (98, N'O''Neill Epic 5/4mm Full Wetsuit', N'Pianka neoprenowa do sportów wodnych w chłodniejszych warunkach. Zapewnia doskonałą izolację termiczną i pełen zakres ruchu dzięki elastycznym panelom.', 1, 10, CAST(53.28 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (99, N'Jobe Aero Yarra 10.6', N'Pompowana deska SUP z szerokim pokładem i dużą stabilnością. Idealna do rekreacyjnego pływania po jeziorach i spokojnych rzekach.', 1, 10, CAST(79.26 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (100, N'BIC Sport Trinidad Kayak', N'Dwuosobowy kajak rekreacyjny z miejscem dla dziecka. Bardzo stabilny, świetny wybór dla rodzinnych wycieczek po wodach śródlądowych.', 1, 10, CAST(51.96 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (101, N'Mystic Warrior Waist Harness', N'Trapez do kitesurfingu zaprojektowany z myślą o komforcie i wsparciu pleców. Posiada system szybkiego odpinania oraz wygodną piankową wyściółkę.', 1, 10, CAST(87.82 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (102, N'Fanatic Viper Windsurf', N'Deska windsurfingowa dla początkujących z dużą wypornością. Łatwa w prowadzeniu, doskonała do nauki w warunkach przybrzeżnych.', 1, 10, CAST(148.22 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (103, N'Sevylor Hudson Inflatable Kayak', N'Nadmuchiwany kajak trzyosobowy z wytrzymałego PVC. Łatwy w transporcie i szybki do napompowania, idealny na weekendowe wypady.', 1, 10, CAST(28.01 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (104, N'Aquaglide Navarro 130', N'Wysokiej klasy jednoosobowy kajak turystyczny z komfortowym siedzeniem i dużą przestrzenią bagażową. Świetny do eksploracji jezior i zatok.', 1, 10, CAST(38.84 AS Decimal(18, 2)))
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (105, N'Naish Hover 160 Foil Board', N'Nowoczesna deska do foilboardingu, idealna do nauki i rozwijania umiejętności. Posiada lekki rdzeń EPS i wzmocniony pokład.', 1, 10, CAST(33.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[Sprzety] ([Id], [Nazwa], [Opis], [Dostepny], [KategorieSprzetuId], [Cena]) VALUES (106, N'Aqua Marina Vapor SUP', N'Nadmuchiwana deska SUP o długości 10’4”, stabilna i wytrzymała. W zestawie znajduje się wiosło, plecak oraz pompka wysokociśnieniowa.', 1, 10, CAST(91.19 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Sprzety] OFF
GO
SET IDENTITY_INSERT [dbo].[Zwroty] ON 

INSERT [dbo].[Zwroty] ([Id], [DataZwrotu], [RezerwacjaId]) VALUES (3, CAST(N'2025-07-24T14:04:38.4003897' AS DateTime2), 3)
INSERT [dbo].[Zwroty] ([Id], [DataZwrotu], [RezerwacjaId]) VALUES (4, CAST(N'2025-07-28T16:28:27.5255829' AS DateTime2), 9)
SET IDENTITY_INSERT [dbo].[Zwroty] OFF
GO
/****** Object:  Index [IX_Rezerwacje_KlientId]    Script Date: 28.07.2025 21:57:54 ******/
CREATE NONCLUSTERED INDEX [IX_Rezerwacje_KlientId] ON [dbo].[Rezerwacje]
(
	[KlientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rezerwacje_SprzetId]    Script Date: 28.07.2025 21:57:54 ******/
CREATE NONCLUSTERED INDEX [IX_Rezerwacje_SprzetId] ON [dbo].[Rezerwacje]
(
	[SprzetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sprzety_KategorieSprzetuId]    Script Date: 28.07.2025 21:57:54 ******/
CREATE NONCLUSTERED INDEX [IX_Sprzety_KategorieSprzetuId] ON [dbo].[Sprzety]
(
	[KategorieSprzetuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Zwroty_RezerwacjaId]    Script Date: 28.07.2025 21:57:54 ******/
CREATE NONCLUSTERED INDEX [IX_Zwroty_RezerwacjaId] ON [dbo].[Zwroty]
(
	[RezerwacjaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Klienci] ADD  DEFAULT (N'') FOR [Telefon]
GO
ALTER TABLE [dbo].[Klienci] ADD  DEFAULT (N'') FOR [Haslo]
GO
ALTER TABLE [dbo].[Sprzety] ADD  DEFAULT ((0.0)) FOR [Cena]
GO
ALTER TABLE [dbo].[Rezerwacje]  WITH CHECK ADD  CONSTRAINT [FK_Rezerwacje_Klienci_KlientId] FOREIGN KEY([KlientId])
REFERENCES [dbo].[Klienci] ([IdKlienta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rezerwacje] CHECK CONSTRAINT [FK_Rezerwacje_Klienci_KlientId]
GO
ALTER TABLE [dbo].[Rezerwacje]  WITH CHECK ADD  CONSTRAINT [FK_Rezerwacje_Sprzety_SprzetId] FOREIGN KEY([SprzetId])
REFERENCES [dbo].[Sprzety] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rezerwacje] CHECK CONSTRAINT [FK_Rezerwacje_Sprzety_SprzetId]
GO
ALTER TABLE [dbo].[Sprzety]  WITH CHECK ADD  CONSTRAINT [FK_Sprzety_KategorieSprzetu_KategorieSprzetuId] FOREIGN KEY([KategorieSprzetuId])
REFERENCES [dbo].[KategorieSprzetu] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sprzety] CHECK CONSTRAINT [FK_Sprzety_KategorieSprzetu_KategorieSprzetuId]
GO
ALTER TABLE [dbo].[Zwroty]  WITH CHECK ADD  CONSTRAINT [FK_Zwroty_Rezerwacje_RezerwacjaId] FOREIGN KEY([RezerwacjaId])
REFERENCES [dbo].[Rezerwacje] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zwroty] CHECK CONSTRAINT [FK_Zwroty_Rezerwacje_RezerwacjaId]
GO
USE [master]
GO
ALTER DATABASE [WypozyczalniaSprzetuDb] SET  READ_WRITE 
GO
