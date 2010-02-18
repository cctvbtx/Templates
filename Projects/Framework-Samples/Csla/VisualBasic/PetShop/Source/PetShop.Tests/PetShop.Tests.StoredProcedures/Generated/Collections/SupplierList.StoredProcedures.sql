--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[CSLA_Supplier_Insert]') IS NOT NULL
	DROP PROCEDURE [dbo].[CSLA_Supplier_Insert]

IF OBJECT_ID(N'[dbo].[CSLA_Supplier_Update]') IS NOT NULL
	DROP PROCEDURE [dbo].[CSLA_Supplier_Update]

IF OBJECT_ID(N'[dbo].[CSLA_Supplier_Delete]') IS NOT NULL
	DROP PROCEDURE [dbo].[CSLA_Supplier_Delete]

IF OBJECT_ID(N'[dbo].[CSLA_Supplier_Select]') IS NOT NULL
	DROP PROCEDURE [dbo].[CSLA_Supplier_Select]

--endregion

GO

--region [dbo].[CSLA_Supplier_Insert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   Blake Niemyjski using CodeSmith: v5.2.1, CSLA Templates: v1.5.0.0, CSLA Framework: v3.8.0
-- Procedure Name: [dbo].[CSLA_Supplier_Insert]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[CSLA_Supplier_Insert]
	@p_SuppId int,
	@p_Name varchar(80),
	@p_Status varchar(2),
	@p_Addr1 varchar(80),
	@p_Addr2 varchar(80),
	@p_City varchar(80),
	@p_State varchar(80),
	@p_Zip varchar(5),
	@p_Phone varchar(40)
AS

INSERT INTO [dbo].[Supplier] (
	[SuppId],
	[Name],
	[Status],
	[Addr1],
	[Addr2],
	[City],
	[State],
	[Zip],
	[Phone]
) VALUES (
	@p_SuppId,
	@p_Name,
	@p_Status,
	@p_Addr1,
	@p_Addr2,
	@p_City,
	@p_State,
	@p_Zip,
	@p_Phone
)

--endregion

GO

--region [dbo].[CSLA_Supplier_Update]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   Blake Niemyjski using CodeSmith: v5.2.1, CSLA Templates: v1.5.0.0, CSLA Framework: v3.8.0
-- Procedure Name: [dbo].[CSLA_Supplier_Update]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[CSLA_Supplier_Update]
	@p_SuppId int,
	@p_Name varchar(80),
	@p_Status varchar(2),
	@p_Addr1 varchar(80),
	@p_Addr2 varchar(80),
	@p_City varchar(80),
	@p_State varchar(80),
	@p_Zip varchar(5),
	@p_Phone varchar(40)
AS

UPDATE [dbo].[Supplier] SET
	[Name] = @p_Name,
	[Status] = @p_Status,
	[Addr1] = @p_Addr1,
	[Addr2] = @p_Addr2,
	[City] = @p_City,
	[State] = @p_State,
	[Zip] = @p_Zip,
	[Phone] = @p_Phone
WHERE
	[SuppId] = @p_SuppId

--endregion

GO

--region [dbo].[CSLA_Supplier_Delete]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   Blake Niemyjski using CodeSmith: v5.2.1, CSLA Templates: v1.5.0.0, CSLA Framework: v3.8.0
-- Procedure Name: [dbo].[CSLA_Supplier_Delete]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[CSLA_Supplier_Delete]
	@p_SuppId int
AS

DELETE FROM
    [dbo].[Supplier]
WHERE
	[SuppId] = @p_SuppId

--endregion

GO

--region [dbo].[CSLA_Supplier_Select]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   Blake Niemyjski using CodeSmith: v5.2.1, CSLA Templates: v1.5.0.0, CSLA Framework: v3.8.0
-- Procedure Name: [dbo].[CSLA_Supplier_Select]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[CSLA_Supplier_Select]
	@p_SuppId int = NULL,
	@p_Name varchar(80) = NULL,
@p_NameHasValue BIT = 0,
	@p_Status varchar(2) = NULL,
	@p_Addr1 varchar(80) = NULL,
@p_Addr1HasValue BIT = 0,
	@p_Addr2 varchar(80) = NULL,
@p_Addr2HasValue BIT = 0,
	@p_City varchar(80) = NULL,
@p_CityHasValue BIT = 0,
	@p_State varchar(80) = NULL,
@p_StateHasValue BIT = 0,
	@p_Zip varchar(5) = NULL,
@p_ZipHasValue BIT = 0,
	@p_Phone varchar(40) = NULL,
@p_PhoneHasValue BIT = 0
AS

SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[SuppId],
	[Name],
	[Status],
	[Addr1],
	[Addr2],
	[City],
	[State],
	[Zip],
	[Phone]
FROM
    [dbo].[Supplier]
WHERE
	([SuppId] = @p_SuppId OR @p_SuppId IS NULL)
	AND ([Name] = @p_Name OR (@p_Name IS NULL AND @p_NameHasValue = 0))
	AND ([Status] = @p_Status OR @p_Status IS NULL)
	AND ([Addr1] = @p_Addr1 OR (@p_Addr1 IS NULL AND @p_Addr1HasValue = 0))
	AND ([Addr2] = @p_Addr2 OR (@p_Addr2 IS NULL AND @p_Addr2HasValue = 0))
	AND ([City] = @p_City OR (@p_City IS NULL AND @p_CityHasValue = 0))
	AND ([State] = @p_State OR (@p_State IS NULL AND @p_StateHasValue = 0))
	AND ([Zip] = @p_Zip OR (@p_Zip IS NULL AND @p_ZipHasValue = 0))
	AND ([Phone] = @p_Phone OR (@p_Phone IS NULL AND @p_PhoneHasValue = 0))

--endregion

GO
