USE [DB_edumoraglez]
GO

/****** Object:  Table [dbo].[FACT_EnvironmentalMeasurements]    Script Date: 15/05/2021 0:59:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACT_EnvironmentalMeasurements](
	[pk_id] [int] NOT NULL,
	[fk_date] [int] NOT NULL,
	[fk_region] [int] NOT NULL,
	[fk_activitysector] [int] NOT NULL,
	[fk_typeequipinstall] [int] NOT NULL,
	[fk_measurement] [int] NOT NULL,
	[value] [decimal](19, 4) NULL,
 CONSTRAINT [PK_FACT_EnvironmentalMeasurements] PRIMARY KEY CLUSTERED 
(
	[pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FACT_EnergyBalances]    Script Date: 15/05/2021 0:59:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACT_EnergyBalances](
	[pk_fk_date] [int] NOT NULL,
	[pk_fk_country] [int] NOT NULL,
	[pk_fk_product] [int] NOT NULL,
	[pk_fk_measurement] [int] NOT NULL,
	[value] [decimal](19, 4) NULL,
 CONSTRAINT [PK_FACT_EnergyBalances] PRIMARY KEY CLUSTERED 
(
	[pk_fk_date] ASC,
	[pk_fk_country] ASC,
	[pk_fk_product] ASC,
	[pk_fk_measurement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Measurement]    Script Date: 15/05/2021 0:59:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Measurement](
	[pk_measurement] [int] NOT NULL,
	[measurement_code] [varchar](100) NULL,
	[measurement_name] [varchar](200) NULL,
	[unit] [varchar](25) NULL,
	[fk_sdg] [int] NULL,
 CONSTRAINT [PK_DIM_Measurement] PRIMARY KEY CLUSTERED 
(
	[pk_measurement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Date]    Script Date: 15/05/2021 0:59:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Date](
	[pk_date] [int] NOT NULL,
	[date_year] [int] NOT NULL,
	[date_month] [int] NOT NULL,
	[date_day] [int] NOT NULL,
	[date_date] [datetime] NOT NULL,
 CONSTRAINT [PK_DIM_Date] PRIMARY KEY CLUSTERED 
(
	[pk_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_EconomicActivitySector]    Script Date: 15/05/2021 0:59:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_EconomicActivitySector](
	[pk_activitysector] [int] NOT NULL,
	[activitysector_name] [varchar](100) NULL,
 CONSTRAINT [PK_DIM_EconomicActivitySector] PRIMARY KEY CLUSTERED 
(
	[pk_activitysector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_TypeEquipmentInstallation]    Script Date: 15/05/2021 0:59:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_TypeEquipmentInstallation](
	[pk_typeequipinstall] [int] NOT NULL,
	[typeequipinstall_name] [varchar](100) NULL,
 CONSTRAINT [PK_DIM_TypeEquipmentInstallation] PRIMARY KEY CLUSTERED 
(
	[pk_typeequipinstall] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Product]    Script Date: 15/05/2021 0:59:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Product](
	[pk_product] [int] NOT NULL,
	[product_name] [varchar](100) NULL,
 CONSTRAINT [PK_DIM_Product] PRIMARY KEY CLUSTERED 
(
	[pk_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Region]    Script Date: 15/05/2021 0:59:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Region](
	[pk_region] [int] NOT NULL,
	[region] [varchar](100) NULL,
	[country_code2] [varchar](2) NULL,
	[country_code3] [varchar](3) NULL,
	[country_name] [varchar](100) NULL,
 CONSTRAINT [PK_DIM_Region] PRIMARY KEY CLUSTERED 
(
	[pk_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_SDG]    Script Date: 15/05/2021 0:59:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_SDG](
	[pk_sdg] [int] NOT NULL,
	[sdg_name] [varchar](50) NULL,
	[sdg_description] [varchar](500) NULL,
 CONSTRAINT [PK_DIM_SDG] PRIMARY KEY CLUSTERED 
(
	[pk_sdg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DIM_Country]    Script Date: 15/05/2021 0:59:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Country](
	[pk_country] [int] NOT NULL,
	[country_code] [varchar](2) NULL,
	[country_code3] [varchar](3) NULL,
	[country_name_sp] [varchar](100) NULL,
	[country_name_en] [varchar](100) NULL,
	[country_name_fr] [varchar](100) NULL,
	[country_phone_code] [varchar](5) NULL,
 CONSTRAINT [PK_DIM_Country] PRIMARY KEY CLUSTERED 
(
	[pk_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_Date] FOREIGN KEY([fk_date])
REFERENCES [dbo].[DIM_Date] ([pk_date])
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements] CHECK CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_Date]
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_EconomicActivitySector] FOREIGN KEY([fk_activitysector])
REFERENCES [dbo].[DIM_EconomicActivitySector] ([pk_activitysector])
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements] CHECK CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_EconomicActivitySector]
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_Measurement] FOREIGN KEY([fk_measurement])
REFERENCES [dbo].[DIM_Measurement] ([pk_measurement])
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements] CHECK CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_Measurement]
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_Region] FOREIGN KEY([fk_region])
REFERENCES [dbo].[DIM_Region] ([pk_region])
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements] CHECK CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_Region]
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_TypeEquipmentInstallation] FOREIGN KEY([fk_typeequipinstall])
REFERENCES [dbo].[DIM_TypeEquipmentInstallation] ([pk_typeequipinstall])
GO

ALTER TABLE [dbo].[FACT_EnvironmentalMeasurements] CHECK CONSTRAINT [FK_FACT_EnvironmentalMeasurements_DIM_TypeEquipmentInstallation]
GO

ALTER TABLE [dbo].[FACT_EnergyBalances]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnergyBalances_DIM_Country] FOREIGN KEY([pk_fk_country])
REFERENCES [dbo].[DIM_Country] ([pk_country])
GO

ALTER TABLE [dbo].[FACT_EnergyBalances] CHECK CONSTRAINT [FK_FACT_EnergyBalances_DIM_Country]
GO

ALTER TABLE [dbo].[FACT_EnergyBalances]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnergyBalances_DIM_Date] FOREIGN KEY([pk_fk_date])
REFERENCES [dbo].[DIM_Date] ([pk_date])
GO

ALTER TABLE [dbo].[FACT_EnergyBalances] CHECK CONSTRAINT [FK_FACT_EnergyBalances_DIM_Date]
GO

ALTER TABLE [dbo].[FACT_EnergyBalances]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnergyBalances_DIM_Measurement] FOREIGN KEY([pk_fk_measurement])
REFERENCES [dbo].[DIM_Measurement] ([pk_measurement])
GO

ALTER TABLE [dbo].[FACT_EnergyBalances] CHECK CONSTRAINT [FK_FACT_EnergyBalances_DIM_Measurement]
GO

ALTER TABLE [dbo].[FACT_EnergyBalances]  WITH CHECK ADD  CONSTRAINT [FK_FACT_EnergyBalances_DIM_Product] FOREIGN KEY([pk_fk_product])
REFERENCES [dbo].[DIM_Product] ([pk_product])
GO

ALTER TABLE [dbo].[FACT_EnergyBalances] CHECK CONSTRAINT [FK_FACT_EnergyBalances_DIM_Product]
GO

ALTER TABLE [dbo].[DIM_Measurement]  WITH CHECK ADD  CONSTRAINT [FK_DIM_Measurement_DIM_SDG] FOREIGN KEY([fk_sdg])
REFERENCES [dbo].[DIM_SDG] ([pk_sdg])
GO

ALTER TABLE [dbo].[DIM_Measurement] CHECK CONSTRAINT [FK_DIM_Measurement_DIM_SDG]
GO


