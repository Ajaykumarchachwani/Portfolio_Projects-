/*
Created: 4/12/2020
Modified: 4/12/2020
Model: Microsoft SQL Server 2017
Database: MS SQL Server 2017
*/


-- Create tables section -------------------------------------------------

-- Table Account_Fact

drop table BankingSSIS6.[Account_Fact];

CREATE TABLE BankingSSIS6.[Account_Fact]
(
 [account_id] Varchar(max) NOT NULL,
 frequency Varchar(max),
 [district_id] Int NULL,
 [parseddate] Date NULL,
 [year] Int NULL,
 [month] Int NULL,
 [day] Int NULL,
 [freq_id] Int NULL
)
go

-- Add keys for table Account_Fact

-- ALTER TABLE [Account_Fact] ADD CONSTRAINT [PK_Account_Fact] PRIMARY KEY ([account_id],[freq_id])
-- go

-- Table Card_Fact

CREATE TABLE BankingSSIS6.[Card_Fact]
(
 [card_id] Varchar(max) NOT NULL,
 [type] Varchar(max),
 [disp_id] Varchar(max) NULL,
 [year] Int NULL,
 [month] Int NULL,
 [day] Int NULL,
 [fulldate] Date NULL,
 [Type_ID] Int  NULL
)
go

CREATE TABLE BankingSSIS6.Card_Fact_1
(
 [card_id] Varchar(max) NOT NULL,
 [type] Varchar(max),
 [disp_id] Varchar(max) NULL,
 [year] Int NULL,
 [month] Int NULL,
 [day] Int NULL,
 [fulldate] Date NULL,
 [Type_ID] Int  NULL
)
go


-- Add keys for table Card_Fact

-- ALTER TABLE [Card_Fact] ADD CONSTRAINT [PK_Card_Fact] PRIMARY KEY ([card_id],[Type_ID])
-- go

-- -- Table CardType_Dim

-- CREATE TABLE [CardType_Dim]
-- (
 -- [Type_ID] Int NOT NULL,
 -- [Type] Varchar(max) NULL
-- )
-- go

-- Add keys for table CardType_Dim

-- ALTER TABLE [CardType_Dim] ADD CONSTRAINT [PK_CardType_Dim] PRIMARY KEY ([Type_ID])
-- go

-- Table AcctFreq_Dim

-- CREATE TABLE [AcctFreq_Dim]
-- (
 -- [freq_id] Int NOT NULL,
 -- [frequency] Varchar(max) NULL
-- )
-- go

-- Add keys for table AcctFreq_Dim

ALTER TABLE [AcctFreq_Dim] ADD CONSTRAINT [PK_AcctFreq_Dim] PRIMARY KEY ([freq_id])
go

-- Table client_Fact

CREATE TABLE [client_Fact]
(
 [client_id] Char(1) NOT NULL,
 [fulldate] Date NULL,
 [day] Char(1) NULL,
 [month] Char(1) NULL,
 [year] Char(1) NULL,
 [age] Char(1) NULL,
 [social] Char(1) NULL,
 [first] Char(1) NULL,
 [middle] Char(1) NULL,
 [last] Char(1) NULL,
 [phone] Char(1) NULL,
 [email] Char(1) NULL,
 [address_1] Char(1) NULL,
 [address_2] Char(1) NULL,
 [district_id] Char(1) NULL,
 [zipcode] Varchar(max)  NULL,
 [sex] Varchar NULL
)
go

-- Add keys for table client_Fact

ALTER TABLE [client_Fact] ADD CONSTRAINT [PK_client_Fact] PRIMARY KEY ([client_id],[zipcode],[Gender_ID])
go

-- Table Area_Dim

CREATE TABLE [Area_Dim]
(
 [zipcode] Varchar(max) NOT NULL,
 [state] Varchar(max) NULL,
 [city] Varchar(max) NULL,
 [district_id] Int NOT NULL
)
go

-- Add keys for table Area_Dim

ALTER TABLE [Area_Dim] ADD CONSTRAINT [PK_Area_Dim] PRIMARY KEY ([zipcode])
go

-- Table Gender_Dim

CREATE TABLE [Gender_Dim]
(
 [Gender_ID] Int NOT NULL,
 [Gender] Varchar(max) NULL
)
go

-- Add keys for table Gender_Dim

ALTER TABLE [Gender_Dim] ADD CONSTRAINT [PK_Gender_Dim] PRIMARY KEY ([Gender_ID])
go

-- Table Disposition_fact

CREATE TABLE [Disposition_fact]
(
 [disp_id] Varchar(max) NOT NULL,
 [type] Varchar(max) NULL,
 [client_id] Varchar(max) NULL,
 [account_id] Varchar(max) NULL
)
go

-- Add keys for table Disposition_fact

ALTER TABLE [Disposition_fact] ADD CONSTRAINT [PK_Disposition_fact] PRIMARY KEY ([disp_id])
go

-- Table District_dim

CREATE TABLE [District_dim]
(
 [district_id] Int NOT NULL,
 [city] Varchar(max) NULL,
 [state_name] Varchar(max) NULL,
 [state_abbrev] Varchar(max) NULL,
 [region] Varchar(max) NULL,
 [division] Varchar(max) NULL
)
go

-- Add keys for table District_dim

ALTER TABLE [District_dim] ADD CONSTRAINT [PK_District_dim] PRIMARY KEY ([district_id])
go

-- Table ZipCode_Districts_fact

CREATE TABLE [ZipCode_Districts_fact]
(
 [district_id] Int NOT NULL,
 [zipcode] Varchar(max) NOT NULL
)
go

-- Add keys for table ZipCode_Districts_fact

ALTER TABLE [ZipCode_Districts_fact] ADD CONSTRAINT [PK_ZipCode_Districts_fact] PRIMARY KEY ([district_id],[zipcode])
go

-- Table Loan_fact

CREATE TABLE [Loan_fact]
(
 [loan_id] Varchar(max) NOT NULL,
 [purpose_ID] Int NOT NULL,
 [account_id] Varchar(max) NULL,
 [amount] Float NULL,
 [duration] Int NULL,
 [payments] Float NULL,
 [status] Varchar(max) NULL,
 [year] Int NULL,
 [month] Int NULL,
 [day] Int NULL,
 [fulldate] Date NULL,
 [location] Int NULL,
 [purpose] Varchar(max) NULL
)
go

-- Add keys for table Loan_fact

ALTER TABLE [Loan_fact] ADD CONSTRAINT [PK_Loan_fact] PRIMARY KEY ([loan_id],[purpose_ID])
go

-- Table LoanPurpose_Dim

CREATE TABLE [LoanPurpose_Dim]
(
 [purpose_ID] Int NOT NULL,
 [purpose] Varchar(max) NULL
)
go

-- Add keys for table LoanPurpose_Dim

ALTER TABLE [LoanPurpose_Dim] ADD CONSTRAINT [PK_LoanPurpose_Dim] PRIMARY KEY ([purpose_ID])
go

-- Table loan_to_Account

CREATE TABLE [loan_to_Account]
(
 [account_id] Varchar(max) NOT NULL,
 [freq_id] Int NOT NULL,
 [loan_id] Varchar(max) NOT NULL,
 [purpose_ID] Int NOT NULL
)
go

-- Add keys for table loan_to_Account

ALTER TABLE [loan_to_Account] ADD CONSTRAINT [PK_loan_to_Account] PRIMARY KEY ([account_id],[freq_id],[loan_id],[purpose_ID])
go

-- Table Transaction_order_fact

CREATE TABLE [Transaction_order_fact]
(
 [order_id] Varchar(max) NOT NULL,
 [account_id] Varchar(max) NULL,
 [bank_to] Varchar(max) NULL,
 [account_to] Varchar(max) NULL,
 [amount] Float NULL,
 [k_symbol] Varchar(max) NULL
)
go

-- Add keys for table Transaction_order_fact

ALTER TABLE [Transaction_order_fact] ADD CONSTRAINT [PK_Transaction_order_fact] PRIMARY KEY ([order_id])
go

-- Table account_to_order

CREATE TABLE [account_to_order]
(
 [account_id] Varchar(max) NOT NULL,
 [freq_id] Int NOT NULL,
 [order_id] Varchar(max) NOT NULL
)
go

-- Add keys for table account_to_order

ALTER TABLE [account_to_order] ADD CONSTRAINT [PK_account_to_order] PRIMARY KEY ([account_id],[freq_id],[order_id])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Card_Fact] ADD CONSTRAINT [Relationship1] FOREIGN KEY ([Type_ID]) REFERENCES [CardType_Dim] ([Type_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Account_Fact] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([freq_id]) REFERENCES [AcctFreq_Dim] ([freq_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [client_Fact] ADD CONSTRAINT [Relationship3] FOREIGN KEY ([zipcode]) REFERENCES [Area_Dim] ([zipcode]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [client_Fact] ADD CONSTRAINT [Relationship4] FOREIGN KEY ([Gender_ID]) REFERENCES [Gender_Dim] ([Gender_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ZipCode_Districts_fact] ADD CONSTRAINT [Relationship14] FOREIGN KEY ([district_id]) REFERENCES [District_dim] ([district_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ZipCode_Districts_fact] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([zipcode]) REFERENCES [Area_Dim] ([zipcode]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Loan_fact] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([purpose_ID]) REFERENCES [LoanPurpose_Dim] ([purpose_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [loan_to_Account] ADD CONSTRAINT [Relationship17] FOREIGN KEY ([account_id], [freq_id]) REFERENCES [Account_Fact] ([account_id], [freq_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [loan_to_Account] ADD CONSTRAINT [Relationship18] FOREIGN KEY ([loan_id], [purpose_ID]) REFERENCES [Loan_fact] ([loan_id], [purpose_ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [account_to_order] ADD CONSTRAINT [Relationship19] FOREIGN KEY ([account_id], [freq_id]) REFERENCES [Account_Fact] ([account_id], [freq_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [account_to_order] ADD CONSTRAINT [Relationship20] FOREIGN KEY ([order_id]) REFERENCES [Transaction_order_fact] ([order_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




