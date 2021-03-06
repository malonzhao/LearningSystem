--2016-02-27

/*学员问题反馈表的修改*/
alter table [Message] add [St_ID] [int] NULL
go
update [Message] set [St_ID]=1
go
alter table [Message] ALTER COLUMN [St_ID] [int] NOT NULL
go
alter table [Message] add [Msg_QQ] [nvarchar](255) NULL
go
alter table [Message] add[Msg_Phone] [nvarchar](255) NULL
go
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Message__Acc_Id__078C1F06]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Message] DROP CONSTRAINT [DF__Message__Acc_Id__078C1F06]
END
alter table [Message] drop column [Acc_Id] 
go
alter table [Message] drop column [Acc_Name] 
go
alter table [Message] add [Msg_ReContext] [nvarchar](1000) NULL
go
alter table  [Message] add [Msg_IsReply] [bit] NULL
go
update [Message] set [Msg_IsReply]=1
go
alter table [Message] ALTER COLUMN [Msg_IsReply] [bit] NOT NULL
go

/*支付记录的字段修改*/
alter table [MoneyAccount] add [Ma_IsSuccess] [bit] NULL
go
update [MoneyAccount] set [Ma_IsSuccess]=1
go
alter table [MoneyAccount] ALTER COLUMN [Ma_IsSuccess] [bit] NOT NULL
go
alter table [MoneyAccount] add [Ma_From] [int] NULL
go
update [MoneyAccount] set [Ma_From]=1
go
alter table [MoneyAccount] ALTER COLUMN [Ma_From] [int] NOT NULL
go

/* 支付接口管理 */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PayInterface](
    [Pai_ID] [int] IDENTITY(1,1) NOT NULL,
    [Pai_Name] [nvarchar](255) NULL,
    [Pai_Pattern] [nvarchar](255) NULL,
    [Pai_Tax] [int] NOT NULL,
    [Pai_Intro] [nvarchar](1000) NULL,
    [Pai_Currency] [nvarchar](255) NULL,
    [Pai_Platform] [nvarchar](255) NULL,
    [Pai_ParterID] [nvarchar](255) NULL,
    [Pai_Key] [nvarchar](255) NULL,
    [Pai_InterfaceType] [nvarchar](255) NULL,
    [Pai_Feerate] [real] NOT NULL,
    [Pai_Config] [nvarchar](max) NULL,
    [Pai_IsEnable] [bit] NOT NULL,
    [Org_ID] [int] NOT NULL,
 CONSTRAINT [PK_PayInterface] PRIMARY KEY CLUSTERED 
(
    [Pai_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/*修改所有课程为免费*/
go
UPDATE [Course]   SET [Cou_IsFree] = 1