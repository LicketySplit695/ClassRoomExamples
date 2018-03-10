-- CUSTOMER RAGISTRATION
create table customer_registration(
Customer_Id int PRIMARY KEY,
Name CHARACTER(30)NOT NULL,
Password VARCHAR(20) NOT NULL,
Address VARCHAR(100) NOT NULL,
Country bigint NOT NULL references countrymaster(countryId),
State int NOT NULL,
City int NOT NULL,
PinCode INT NOT NULL,
Email VARCHAR(20)NOT NULL,
Gender int NOT NULL references gender(Gender_Id),
Contact_No BIGINT NOT NULL,
DOB DATETIME not null,
Customer_Type CHAR NOT NULL,
Active CHAR NOT NULL);

-- GENDER 
create table gender(Gender_Id int primary key,
name varchar(50) not null);

-- countrymaster
create table countrymaster
(countryId bigint primary key, --changed from int(20) to bigint
countryName varchar(50) not null);

-- state master
create table statemaster
(countryId bigint not null references countrymaster(countryId),  --changed from int(20) to bigint
 stateId bigint primary key,  --changed from int(20) to bigint
);
 
-- city master 
 create table citymaster
 (cityId bigint primary key,   --changed from int(20) to bigint
 countryId bigint not null,	    --changed from int(20) to bigint
 stateId bigint not null references statemaster(stateId),   --changed from int(20) to bigint
 cityName varchar(20) not null);
 
 -- policy claim  --drop table policyclaim
 create table policyclaim
 (CustomerId int not null references customer_registration(Customer_Id),
 name varchar(50),
 policyNo bigint,  --changed from int(50) to bigint
 claimId bigint not null references claim_type(ClaimId), --changed from int(50) to bigint
 deathCertificate varchar(50),
 policeverificationDocument varchar(50));
 
 -- claim type
 create table claim_type
 (ClaimId bigint primary key,
 claimtype varchar(50) not null,
 polAmount bigint not null, --changed from int(50) to bigint
 amount bigint not null --changed from int(50) to bigint
 );

-- weightage
create table weightage
(premiumType varchar(50) primary key,
weightage varchar(50) not null,
percentage bigint);   --changed from int(20) to bigint

-- duration weightage --drop table durationweightage
create table durationweightage
(
durationId bigint primary key,   --changed from int(20) to bigint
duration bigint not null, --changed from int(50) to bigint
discountWeightage bigint not null); --changed from int(50) to bigint

-- policy amount
create table policyamount
(insTypeId int not null,
insType varchar(50) not null,
polAmount bigint primary key, --changed from int(50) to bigint
duration bigint not null --changed from int(50) to bigint
);

-- insurance type
create table insurancetype
(insId bigint not null,   --changed from int(20) to bigint
insType varchar(50),
insName varchar(50) primary key
);

-- policy registration
create table policy_registration
(customerId int not null references customer_registration(customer_id),
insuranceName varchar(50) not null references insurancetype(insName),
policyAmount bigint not null  references policyamount(polAmount), --changed from int(50) to bigint
policyDuration bigint not null references durationweightage(durationId), --changed from int(50) to bigint
premiumType varchar(50) references weightage(premiumType) not null,
policyStart_Date DATE not null,
discount bigint not null, --changed from int(50) to bigint
premiumAmount bigint not null, --changed from int(50) to bigint
maturityDate DATE not null,
updateBy bigint not null, --changed from int(50) to bigint
updateOn DATE not null
);