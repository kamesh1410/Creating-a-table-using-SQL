--create DataBase
create database InsuraunceDB
--create tables
create table patient(PatientID int primary key identity(1,1),
FirstName varchar(50)not null,
Gender char(1),
Date date default getdate());
create table provider(ProviderID int primary key identity(1,1),
ProviderName varchar(50)not null,
License_Number bigint);
create table treatment(TreatmentID int primary key identity(1,1),
Treatment_Code int,
TreatmentName varchar(50)not null);
--create transaction table for mapping one table to other
create table trasactable(Patient_ID int,Provider_ID int,Treatment_ID int,
foreign key (Patient_ID)references patient(PatientID),
foreign key (Provider_ID)references provider(ProviderID),
foreign key (Treatment_ID)references treatment(TreatmentID));
--Data Manipulation on patient table
--Inserting Data into patient table
insert into patient(FirstName,Gender) values('Kamesh','M');
insert into patient(FirstName,Gender) values('Akruth','M');
insert into patient(FirstName,Gender) values('Sai','M');
insert into patient(FirstName,Gender) values('Uma','F');
insert into patient(FirstName,Gender) values('Pavithra','F');
insert into patient(FirstName,Gender) values('Bharathi','F');
insert into patient(FirstName,Gender) values('Dhanush','M');
insert into patient(FirstName,Gender) values('Govind','M');
insert into patient(FirstName,Gender) values('Sravya','F');
insert into patient(FirstName,Gender) values('Saranya','F');
insert into patient(FirstName,Gender) values('Krishna','M');
insert into patient(FirstName,Gender) values('Soyam','F');
insert into patient(FirstName,Gender) values('Kavitha','F');
insert into patient(FirstName,Gender) values('Pooja','F');
insert into patient(FirstName,Gender) values('Sudheer','M');
--Alter age into patient table
alter table patient 
add Age int check(Age<60);
--update null values of age
update patient set Age=35 where PatientID=1;
update patient set Age=40 where PatientID=2;
update patient set Age=37 where patientID=3;
update patient set Age=47 where PatientID=4;
update patient set Age=53 where PatientID=5;
update patient set Age=55 where PatientID=6;
update patient set Age=55 where PatientID=7;
update patient set Age=35 where PatientID=8;
update patient set Age=45 where PatientID=9;
update patient set Age=45 where PatientID=10;
update patient set Age=36 where PatientID=11;
update patient set Age=47 where PatientID=12;
update patient set Age=57 where PatientID=13;
update patient set Age=58 where PatientID=14;
update patient set Age=48 where PatientID=15;
update patient set Age=58 where PatientID=16;
update patient set Age=50 where PatientID=17;
--Update patient table
update patient set FirstName='Sravani' where PatientID=2; 
update patient set Gender='F' where PatientID=2;
update patient set FirstName='Manoj' where PatientID=17;
--Delete from patient table
delete from patient where PatientID=18;
delete from patient where PatientID=19;
delete from patient where PatientID=20;
--Data Manipulation on Provider Table
--insert data into provider Table
insert into provider values('Apollo',25006);
insert into provider values('Fortis',25008);
insert into provider values('Narayana',25007);
insert into provider values('KIMS',25009);
insert into provider values('Medanta',25010);
insert into provider values('Apollo',25006);
insert into provider values('Fortis',25008);
insert into provider values('KIMS',25009);
insert into provider values('Narayana',25007);
insert into provider values('Apollo',25006);
insert into provider values('KIMS',25009);
insert into provider values('Medanta',25010);
insert into provider values('Fortis',25008);
insert into provider values('Apollo',25006);
insert into provider values('Narayana',25007);
insert into provider values('KIMS',25009);
insert into provider values('Fortis',25009);
insert into provider values('Medanta',25011);
insert into provider values('Apollo',25091);

select *from provider
--update provider table
update provider set ProviderName='Apollo' where ProviderID=5;
update provider set License_Number=25006 where ProviderID=5;
update provider set License_Number=25010 where ProviderID=19;
update provider set License_Number=25006 where ProviderID=20
--Delete provider table
delete from provider where ProviderID=18;
delete from provider where ProviderID=19;
delete from provider where ProviderID=20;
--Data manipulation on treatment table
--inserting values
insert into treatment values(11,'Fever');
insert into treatment values(12,'Dialysis');
insert into treatment values(13,'Blood Transfusion');
insert into treatment values(14,'Chemotherapy');
insert into treatment values(15,'Bypass Surgery');
insert into treatment values(12,'Dialysis');
insert into treatment values(11,'Fever');
insert into treatment values(15,'Bypass Surgery');
insert into treatment values(16,'Radiation Therapy');
insert into treatment values(12,'Dialysis');
insert into treatment values(13,'Blood Transfusion');
insert into treatment values(17,'MRI Scan');
insert into treatment values(8,'CT Scan');
insert into treatment values(1,'Dialysis');
insert into treatment values(13,'MRI Scan');
insert into treatment values(2,'Fever');
insert into treatment values(11,'Fever');
insert into treatment values(12,'Dialysis');
--update on treatment table
update treatment set Treatment_Code=18 where TreatmentID=13;
update treatment set Treatment_Code=14 where TreatmentID=14;
update treatment set Treatment_Code=17 where TreatmentID=15;
update treatment set Treatment_Code=11 where TreatmentID=16;
--delete on treatment table
delete from treatment where TreatmentID=18;
delete from treatment where TreatmentID=19;
--inserting data into transactable
insert into trasactable(Patient_ID,Provider_ID,Treatment_ID)values(1,1,1);
insert into trasactable values(2,2,2);
insert into trasactable values(3,3,3);
insert into trasactable values(4,4,4);
insert into trasactable values(5,5,5);
insert into trasactable values(6,6,6);
insert into trasactable values(7,7,7);
insert into trasactable values(8,8,8);
insert into trasactable values(9,9,9);
insert into trasactable values(10,10,10);
insert into trasactable values(11,11,11);
insert into trasactable values(12,12,12);
insert into trasactable values(13,13,13);
insert into trasactable values(14,14,14);
insert into trasactable values(15,15,15);  select *from patient
insert into trasactable values(16,16,16);
insert into trasactable values(17,17,17);
select *from trasactable
--create table for insurance
create table insurance(insurance_ID varchar(50) primary key,
patientID int not null, 
insuranceName varchar(100),
policyNumber varchar(100),
coverageType varchar(50),
foreign key (patientID) references patient(PatientID));
--inserting values through data manipulation into insurance table
insert into insurance(insurance_ID,patientID,insuranceName,policyNumber,coverageType)
values('INS001',1,'ShieldCare Insurance','POL2501','Full Cover')
insert into insurance values('INS002',2,'WellGaurd Health','POL2502','Full Cover')
insert into insurance values('INS003',3,'PrimaryCover Corp','POL2503','Dental Coverage')
insert into insurance values('INS004',4,'LifeSecure Policies','POL2504','Semi-Coverage')
insert into insurance values('INS005',5,'Gaurdian Assurance','POL2505','Dental Coverage')
insert into insurance values('INS006',6,'HealthCare Insurance','POL2506','Full Cover')
insert into insurance values('INS007',7,'CareFirst Insurance','POL2507','Semi-Coverage')
insert into insurance values('INS008',8,'ShieldCare Insurance','POL2508','Semi-Coverage')
insert into insurance values('INS009',9,'PrimaryCover Corp','POL2509','Full Cover')
insert into insurance values('INS010',10,'Gaurdian Assurance','POL2510','Full Cover')
insert into insurance values('INS011',11,'ShieldCare Insurance','POL2511','Semi-Coverage')
insert into insurance values('INS012',12,'WellGaurd Health','POL2512','Dental Coverage')
insert into insurance values('INS013',13,'HealthCare Insurance','POL2513','Full Cover')
insert into insurance values('INS014',14,'Gaurdian Assurance','POL2514','Full Cover')
insert into insurance values('INS015',15,'PrimaryCover Corp','POL2515','Dental Coverage')
insert into insurance values('INS016',16,'ShieldCare Insurance','POL2516','Full Cover')
insert into insurance values('INS017',17,'WellGaurd','POL2517','Semi-Coverage')
--clustered and non clustered indexes for patient table
create nonclustered index
idx_FirstName on patient(FirstName);
create nonclustered index
idx_ProviderName on provider(ProviderName);
create nonclustered index
idx_TreatmentName on treatment(TreatmentName);
create nonclustered index
idx_insuranceName on insurance(insuranceName);
--joins cross join
select 
p.PatientID,p.FirstName,
pr.ProviderID,pr.ProviderName,
tr.Treatment_Code,tr.TreatmentName
from 
patient p
cross join
provider pr
cross join
treatment tr;
--Inner join
select p.FirstName,p.Gender,
pr.ProviderName,pr.License_Number,
tr.TreatmentName,tr.Treatment_Code
from trasactable t
inner join patient p on t.Patient_ID=p.PatientID
inner join provider pr on t.Provider_ID=pr.ProviderID
inner join treatment tr on t.Treatment_ID=tr.TreatmentID
where TreatmentName='Fever' and ProviderName='Apollo'
--Left join--It ensures all the rows data on left and ensures all the data on right side if doesnt exist by taking null values.
select p.FirstName,p.Gender,
pr.ProviderName,pr.License_Number,
tr.TreatmentName,tr.Treatment_Code
from trasactable t
left join patient p on t.Patient_ID=p.PatientID
left join provider pr on t.Provider_ID=pr.ProviderID
left join treatment tr on t.Treatment_ID=tr.TreatmentID
where ProviderName='Apollo'
--Right join
select p.FirstName,p.Gender,
pr.ProviderName,pr.License_Number,
tr.TreatmentName,tr.Treatment_Code
from trasactable t
right join patient p on t.Patient_ID=p.PatientID
right join provider pr on t.Provider_ID=pr.ProviderID
right join treatment tr on t.Treatment_ID=tr.TreatmentID
-- full outer join
select
p.FirstName,p.Gender,P.Age,
pr.ProviderName,pr.License_Number,
tr.TreatmentName,tr.Treatment_Code
from trasactable t
full join patient p on t.Patient_ID=p.PatientID
full join provider pr on t.Provider_ID=pr.ProviderID
full join treatment tr on t.Treatment_ID=tr.TreatmentID
--self join
select p.FirstName,p.Gender,p.Age
from insurance i
inner join patient p on i.patientID=p.PatientID
select i.insurance_ID,i.patientID,i.insuranceName,i.policyNumber,i.coverageType,
p.FirstName,p.Gender,p.Age,
pr.ProviderName,pr.License_Number,
tr.TreatmentName,tr.Treatment_Code
from trasactable t
inner join patient p on t.Patient_ID=p.PatientID
inner join insurance i on t.Patient_ID=i.patientID
inner join provider pr on t.Provider_ID=pr.ProviderID
inner join treatment tr on t.Treatment_ID=tr.TreatmentID
where providerName='KIMS' and TreatmentName='Fever'
