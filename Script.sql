USE [GestionCommerciale]
GO
/****** Object:  Table [dbo].[Archivage_Facture]    Script Date: 02/05/2018 05:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archivage_Facture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_article] [int] NOT NULL,
	[id_Ligne_facture] [int] NOT NULL,
	[description_article] [nvarchar](100) NOT NULL,
	[qte] [float] NOT NULL,
	[prix_unitaire] [float] NOT NULL,
	[TVA] [nvarchar](50) NULL,
	[prix_HT] [float] NOT NULL,
 CONSTRAINT [PK_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
CREATE TABLE [dbo].[Article](
	[id_article] [int] IDENTITY(1,1) NOT NULL,
	[id_famille_article] [int] NOT NULL,
	[reference]  AS ('RF'+right('000000S'+CONVERT([varchar](7),upper([id_article])),(9))) PERSISTED NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[prix_unitaire] [real] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[id_article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[reference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authentification]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authentification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Authentification] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[reference]  AS ('RF'+right('000000S'+CONVERT([varchar](7),upper([id_client])),(9))) PERSISTED NOT NULL,
	[raison_social] [nvarchar](50) NOT NULL,
	[adresse_client] [nvarchar](50) NOT NULL,
	[num_registre] [nvarchar](50) NULL,
	[domaine] [nvarchar](50) NULL,
	[ville] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[code_postal] [decimal](18, 0) NULL,
	[compte_bancaire] [decimal](30, 0) NULL,
	[email] [nvarchar](50) NULL,
	[siteWeb] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devis]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_article] [int] NOT NULL,
	[id_ligne_devis] [int] NOT NULL,
	[reference] [nvarchar](100) NOT NULL,
	[qte] [float] NOT NULL,
	[prix_unitaire] [float] NOT NULL,
	[TVA] [nvarchar](50) NULL,
	[prix_HT] [float] NOT NULL,
 CONSTRAINT [PF_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Famille_article]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
CREATE TABLE [dbo].[Famille_article](
	[id_famille_article] [int] IDENTITY(1,1) NOT NULL,
	[reference_famille_article]  AS ('RF'+right('000000S'+CONVERT([varchar](7),upper([id_famille_article])),(9))) PERSISTED NOT NULL,
	[libellé_famille_article] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Famille_article] PRIMARY KEY CLUSTERED 
(
	[id_famille_article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[reference_famille_article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[reference_famille_article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fournisseur]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fournisseur](
	[id_fournisseur] [int] IDENTITY(1,1) NOT NULL,
	[raison_social] [nvarchar](50) NULL,
	[domaine] [nvarchar](50) NULL,
	[adresse] [nvarchar](50) NULL,
	[ville] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[code_postal] [decimal](18, 0) NULL,
	[compte_bancaire] [decimal](30, 0) NULL,
	[email] [nvarchar](50) NULL,
	[siteWeb] [nvarchar](50) NULL,
 CONSTRAINT [PK_Fournisseur] PRIMARY KEY CLUSTERED 
(
	[id_fournisseur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ligne_devis]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ligne_devis](
	[id_ligne_devis] [int] IDENTITY(1,1) NOT NULL,
	[reference] [nvarchar](100) NOT NULL,
	[dateCreation] [date] NOT NULL,
	[dateExpiration] [date] NOT NULL,
	[id_client] [int] NOT NULL,
	[id_reglement] [int] NOT NULL,
	[id_points_livraison] [int] NOT NULL,
	[id_fournisseur] [int] NOT NULL,
	[total_prixHT] [float] NOT NULL,
	[statut] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Ligne_devis] PRIMARY KEY CLUSTERED 
(
	[id_ligne_devis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ligne_facturation]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ligne_facturation](
	[id_Ligne_facture] [int] IDENTITY(1,1) NOT NULL,
	[reference] [nvarchar](100) NOT NULL,
	[dateCreation] [date] NOT NULL,
	[dateExpiration] [date] NOT NULL,
	[id_client] [int] NOT NULL,
	[id_reglement] [int] NOT NULL,
	[id_fournisseur] [int] NOT NULL,
	[total_prixHT] [float] NOT NULL,
	[statut] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Ligne_Facturation] PRIMARY KEY CLUSTERED 
(
	[id_Ligne_facture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Points_livraison]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Points_livraison](
	[id_points_livraison] [int] IDENTITY(1,1) NOT NULL,
	[nom_point_livraison] [nvarchar](50) NULL,
	[ville_livraison] [nvarchar](50) NULL,
	[adresse_livraison] [nvarchar](50) NULL,
	[telephone_point_livraison] [nvarchar](50) NULL,
	[code_postal_points_livraison] [decimal](18, 0) NULL,
	[id_client] [int] NOT NULL,
 CONSTRAINT [PK_Point_livraison] PRIMARY KEY CLUSTERED 
(
	[id_points_livraison] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reglement]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reglement](
	[id_reglement] [int] IDENTITY(1,1) NOT NULL,
	[regle] [nvarchar](50) NOT NULL,
 CONSTRAINT [id_reglement] PRIMARY KEY CLUSTERED 
(
	[id_reglement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_article] [int] NOT NULL,
	[id_ligne_devis] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[qte] [float] NOT NULL,
	[prix_unitaire] [float] NOT NULL,
	[TVA] [nvarchar](50) NULL,
	[prix_HT] [float] NOT NULL,
 CONSTRAINT [PK_Temp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempDevis]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempDevis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_article] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[qte] [float] NOT NULL,
	[prix_unitaire] [float] NOT NULL,
	[TVA] [nvarchar](50) NULL,
	[prix_HT] [float] NOT NULL,
 CONSTRAINT [PK_TempDevis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempFacture]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempFacture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_article] [int] NOT NULL,
	[id_ligne_devis] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[qte_new] [float] NOT NULL,
	[prix_unitaire] [float] NOT NULL,
	[TVA_new] [nvarchar](50) NULL,
	[prix_HT_new] [float] NOT NULL,
 CONSTRAINT [PK_TempFacture] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/05/2018 05:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](250) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Temp] ADD  DEFAULT ((1)) FOR [qte]
GO
ALTER TABLE [dbo].[TempDevis] ADD  DEFAULT ((1)) FOR [qte]
GO
ALTER TABLE [dbo].[TempFacture] ADD  DEFAULT ((1)) FOR [qte_new]
GO
ALTER TABLE [dbo].[Archivage_Facture]  WITH CHECK ADD  CONSTRAINT [FK_Archivage_Ligne_facture] FOREIGN KEY([id_Ligne_facture])
REFERENCES [dbo].[Ligne_facturation] ([id_Ligne_facture])
GO
ALTER TABLE [dbo].[Archivage_Facture] CHECK CONSTRAINT [FK_Archivage_Ligne_facture]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Famille_article] FOREIGN KEY([id_famille_article])
REFERENCES [dbo].[Famille_article] ([id_famille_article])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Famille_article]
GO
ALTER TABLE [dbo].[Devis]  WITH NOCHECK ADD  CONSTRAINT [FK_Ligne_devis_Ligne_devis] FOREIGN KEY([id_ligne_devis])
REFERENCES [dbo].[Ligne_devis] ([id_ligne_devis])
GO
ALTER TABLE [dbo].[Devis] CHECK CONSTRAINT [FK_Ligne_devis_Ligne_devis]
GO
ALTER TABLE [dbo].[Ligne_devis]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_devis_Client] FOREIGN KEY([id_client])
REFERENCES [dbo].[Client] ([id_client])
GO
ALTER TABLE [dbo].[Ligne_devis] CHECK CONSTRAINT [FK_Ligne_devis_Client]
GO
ALTER TABLE [dbo].[Ligne_devis]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_devis_Fournisseur] FOREIGN KEY([id_fournisseur])
REFERENCES [dbo].[Fournisseur] ([id_fournisseur])
GO
ALTER TABLE [dbo].[Ligne_devis] CHECK CONSTRAINT [FK_Ligne_devis_Fournisseur]
GO
ALTER TABLE [dbo].[Ligne_devis]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_devis_Point_livraison] FOREIGN KEY([id_points_livraison])
REFERENCES [dbo].[Points_livraison] ([id_points_livraison])
GO
ALTER TABLE [dbo].[Ligne_devis] CHECK CONSTRAINT [FK_Ligne_devis_Point_livraison]
GO
ALTER TABLE [dbo].[Ligne_devis]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_devis_Reglement] FOREIGN KEY([id_reglement])
REFERENCES [dbo].[Reglement] ([id_reglement])
GO
ALTER TABLE [dbo].[Ligne_devis] CHECK CONSTRAINT [FK_Ligne_devis_Reglement]
GO
ALTER TABLE [dbo].[Ligne_facturation]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_facturation_Client] FOREIGN KEY([id_client])
REFERENCES [dbo].[Client] ([id_client])
GO
ALTER TABLE [dbo].[Ligne_facturation] CHECK CONSTRAINT [FK_Ligne_facturation_Client]
GO
ALTER TABLE [dbo].[Ligne_facturation]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_facturation_Fournisseur] FOREIGN KEY([id_fournisseur])
REFERENCES [dbo].[Fournisseur] ([id_fournisseur])
GO
ALTER TABLE [dbo].[Ligne_facturation] CHECK CONSTRAINT [FK_Ligne_facturation_Fournisseur]
GO
ALTER TABLE [dbo].[Ligne_facturation]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_facturation_Reglement] FOREIGN KEY([id_reglement])
REFERENCES [dbo].[Reglement] ([id_reglement])
GO
ALTER TABLE [dbo].[Ligne_facturation] CHECK CONSTRAINT [FK_Ligne_facturation_Reglement]
GO
ALTER TABLE [dbo].[Points_livraison]  WITH CHECK ADD  CONSTRAINT [FK_Points_livraison_Client] FOREIGN KEY([id_client])
REFERENCES [dbo].[Client] ([id_client])
GO
ALTER TABLE [dbo].[Points_livraison] CHECK CONSTRAINT [FK_Points_livraison_Client]
GO
