USE [ParkingSystemDb]
GO
/****** Object:  Table [dbo].[ParkingEntries]    Script Date: 10/06/2025 3:49:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntryTime] [datetime2](7) NOT NULL,
	[ExitTime] [datetime2](7) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[DiscountApplied] [decimal](18, 2) NULL,
	[VehicleId] [int] NOT NULL,
 CONSTRAINT [PK_ParkingEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupermarketInvoices]    Script Date: 10/06/2025 3:49:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupermarketInvoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](max) NOT NULL,
	[ParkingEntryId] [int] NOT NULL,
 CONSTRAINT [PK_SupermarketInvoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 10/06/2025 3:49:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Plate] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ParkingEntries] ON 

INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (1, CAST(N'2025-06-10T19:29:06.9990000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(-117122831002.83 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (2, CAST(N'2025-06-10T19:38:10.8420000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(-117122831999.88 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (3, CAST(N'2025-06-10T19:49:43.0580000' AS DateTime2), CAST(N'2025-06-10T19:52:17.4160000' AS DateTime2), CAST(282.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (4, CAST(N'2025-06-10T19:53:33.7690000' AS DateTime2), CAST(N'2025-06-10T19:55:44.8430000' AS DateTime2), CAST(240.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (5, CAST(N'2025-06-10T20:07:55.3520000' AS DateTime2), CAST(N'2025-06-10T20:18:41.6040000' AS DateTime2), CAST(829.36 AS Decimal(18, 2)), CAST(355.44 AS Decimal(18, 2)), 1)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (6, CAST(N'2025-06-10T20:08:00.9750000' AS DateTime2), NULL, NULL, NULL, 2)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (7, CAST(N'2025-06-10T20:08:07.6440000' AS DateTime2), NULL, NULL, NULL, 3)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (8, CAST(N'2025-06-10T20:08:13.0500000' AS DateTime2), CAST(N'2025-06-10T20:09:07.1170000' AS DateTime2), CAST(99.12 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (9, CAST(N'2025-06-10T20:15:54.1300000' AS DateTime2), NULL, NULL, NULL, 2)
INSERT [dbo].[ParkingEntries] ([Id], [EntryTime], [ExitTime], [TotalAmount], [DiscountApplied], [VehicleId]) VALUES (10, CAST(N'2025-06-10T20:19:02.7760000' AS DateTime2), CAST(N'2025-06-10T20:19:11.9270000' AS DateTime2), CAST(1.53 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[ParkingEntries] OFF
GO
SET IDENTITY_INSERT [dbo].[SupermarketInvoices] ON 

INSERT [dbo].[SupermarketInvoices] ([Id], [InvoiceNumber], [ParkingEntryId]) VALUES (1, N'001', 5)
INSERT [dbo].[SupermarketInvoices] ([Id], [InvoiceNumber], [ParkingEntryId]) VALUES (2, N'002', 5)
SET IDENTITY_INSERT [dbo].[SupermarketInvoices] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([Id], [Type], [Plate]) VALUES (1, 1, N'NWU63G')
INSERT [dbo].[Vehicles] ([Id], [Type], [Plate]) VALUES (2, 3, N'YPD91E')
INSERT [dbo].[Vehicles] ([Id], [Type], [Plate]) VALUES (3, 2, N'FZW38E')
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
GO
ALTER TABLE [dbo].[ParkingEntries]  WITH CHECK ADD  CONSTRAINT [FK_ParkingEntries_Vehicles_VehicleId] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ParkingEntries] CHECK CONSTRAINT [FK_ParkingEntries_Vehicles_VehicleId]
GO
ALTER TABLE [dbo].[SupermarketInvoices]  WITH CHECK ADD  CONSTRAINT [FK_SupermarketInvoices_ParkingEntries_ParkingEntryId] FOREIGN KEY([ParkingEntryId])
REFERENCES [dbo].[ParkingEntries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupermarketInvoices] CHECK CONSTRAINT [FK_SupermarketInvoices_ParkingEntries_ParkingEntryId]
GO
