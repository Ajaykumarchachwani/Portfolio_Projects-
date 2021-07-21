SELECT * FROM sys.schemas;

CREATE SCHEMA BankingSSIS6;

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


select * from BankingSSIS6.[Account_Fact]




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


select * from BankingSSIS6.[Card_Fact]





drop table BankingSSIS6.Card_Fact_1

CREATE TABLE BankingSSIS6.Card_Fact_1
(
 [card_id] Varchar(max) NOT NULL,
 [type] Varchar(max),
 [disp_id] Varchar(max) NULL,
 [year]  Varchar(max)  NULL,
 [month]  Varchar(max)  NULL,
 [day]  Varchar(max)  NULL,
 [fulldate]  Varchar(max)  NULL,
 [Type_ID] Int  NULL
)
go


select * from BankingSSIS6.Card_Fact



drop table BankingSSIS6.[client_Fact]
CREATE TABLE BankingSSIS6.[client_Fact]
(
 [client_id] Varchar(max) NOT NULL,
 [fulldate] Varchar(max) NULL,
 [day] Varchar(max) NULL,
 [month] Varchar(max) NULL,
 [year] Varchar(max) NULL,
 [age] Varchar(max) NULL,
 [social] Varchar(max) NULL,
 [first] Varchar(max) NULL,
 [middle] Varchar(max) NULL,
 [last] Varchar(max) NULL,
 [phone] Varchar(max) NULL,
 [email] Varchar(max) NULL,
 [address_1] Varchar(max) NULL,
 [address_2] Varchar(max) NULL,
 [district_id] Varchar(max) NULL,
 [zipcode] Varchar(max)  NULL,
 [Gender_ID] Varchar(max)  NULL,
  [state] Varchar(max) NULL,
 [city] Varchar(max) NULL
)
go


select * from BankingSSIS6.[client_Fact]



CREATE TABLE BankingSSIS6.[Disposition_fact]
(
 [disp_id] Varchar(max) NOT NULL,
 [type] Varchar(max) NULL,
 [client_id] Varchar(max) NULL,
 [account_id] Varchar(max) NULL
)
go


select * from BankingSSIS6.[Disposition_fact]



CREATE TABLE BankingSSIS6.[District_dim]
(
 [district_id] Int NOT NULL,
 [city] Varchar(max) NULL,
 [state_name] Varchar(max) NULL,
 [state_abbrev] Varchar(max) NULL,
 [region] Varchar(max) NULL,
 [division] Varchar(max) NULL
)
go

select * from BankingSSIS6.[District_dim]


drop table  BankingSSIS6.[Loan_fact];
CREATE TABLE BankingSSIS6.[Loan_fact]
(
 [loan_id] Varchar(max) NOT NULL,
 [purpose_ID] Int NULL,
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


select * from BankingSSIS6.[Loan_fact]



CREATE TABLE BankingSSIS6.[Transaction_order_fact]
(
 [order_id] Varchar(max) NOT NULL,
 [account_id] Varchar(max) NULL,
 [bank_to] Varchar(max) NULL,
 [account_to] Varchar(max) NULL,
 [amount] Float NULL,
 [k_symbol] Varchar(max) NULL
)
go


select * from  BankingSSIS6.[Transaction_order_fact]
FOR XML PATH('payment'), ROOT('order')

select k_symbol,count(*) from BankingSSIS6.[Transaction_order_fact] where k_symbol != ''  group by k_symbol 


select * from BankingSSIS6.[Loan_fact]

select loan_id,duration from BankingSSIS6.[Loan_fact]

select duration, count(*) as cnt from BankingSSIS6.[Loan_fact] group by duration


select * from BankingSSIS6.[Account_Fact]


select * from BankingSSIS6.[Card_Fact]

select type, count(*) as yur from BankingSSIS6.[Card_Fact] group by type


select * from BankingSSIS6.[client_Fact]

select city,count(*) from BankingSSIS6.[client_Fact] group by city

select * from BankingSSIS6.[District_dim]

select * from BankingSSIS6.[Disposition_fact]