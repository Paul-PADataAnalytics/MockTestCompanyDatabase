SET FOREIGN_KEY_CHECKS=0;
insert into mocktestcompany1.customer SELECT * FROM mocktestcompany.customer;
insert into mocktestcompany1.customerbooking SELECT * FROM mocktestcompany.customerbooking;
insert into mocktestcompany1.customerpayment SELECT * FROM mocktestcompany.customerpayment;
insert into mocktestcompany1.customertestpartresult SELECT * FROM mocktestcompany.customertestpartresult;
insert into mocktestcompany1.customervisit SELECT * FROM mocktestcompany.customervisit;
insert into mocktestcompany1.presentedidentification SELECT * FROM mocktestcompany.presentedidentification;
SET FOREIGN_KEY_CHECKS=1;

SELECT count(*) val, 'customers' TableName FROM mocktestcompany1.customer UNION ALL
SELECT Count(*) val, 'CustomerBooking' TableName FROM mocktestcompany1.customerbooking UNION ALL
SELECT count(*) val, 'customerPayment' TableName FROM mocktestcompany1.customerpayment UNION ALL
SELECT count(*) val, 'customertestpartresult' TableName FROM mocktestcompany1.customertestpartresult UNION ALL
SELECT count(*) val, 'customervisit' TableName FROM mocktestcompany1.customervisit UNION ALL
SELECT count(*) val, 'presentedIdentification' TableName FROM mocktestcompany1.presentedidentification;
/*
INSERT INTO MockTestCompany1.TestMandate (TestMandateName, TestMandateProfessionalBody) VALUES
('Certification and Classifications', 'Certification Operations Ltd'),
('Authorised Peat Moss Operations', 'Peat Moss Guild'),
('Potato Certified Professional', 'Pot-ayy-toe Ltd');

INSERT INTO `MockTestCompany1`.`TestCertification`
(`TestCertifcationName`,
`TestCertifcationPrice`,
`idTestMandate`)
VALUES
('Certification in Certifiying and Classification Lv1', 199.99, 1),
('Classification of Classifications Lv1', 99, 1),
('Certification Certifiying and Classification Lv2', 499.99, 1),
('Classification of Classifications Lv2', 399.99, 1),
('Renewable Peat Moss Certifier', 1000.00, 2),
('Non-Renewable Peat Moss Certifier', 2000.00, 2),
('Potato Identification Lv1', 10.00, 3),
('Potato Identification Lv2', 100.00,3),
('Potato Identification Lv3', 1000.00, 3);

INSERT INTO `MockTestCompany1`.`TestCertificationPart`
(`idTestCertification`,
`TestCertificationPartName`,
`TestCertificationRetestPrice`,
`TestCertificationPartSequenceNumber`)
VALUES
(1,'Introduction to Classifications LV1', 100, 1),
(1,'Introduction to Certifying LV1', 100, 2),
(1,'Certifying Classifications LV1', 100, 3),
(1,'Classifying Certifications LV1', 100, 4),
(2,'Introduction to Classifications LV1', 100, 1),
(2,'Certifying Classifications LV1', 100, 2),
(2,'Classifying Certifications LV1', 100, 3),
(3,'Introduction to Classifications LV2', 100, 1),
(3,'Introduction to Certifying LV2', 100, 2),
(3,'Certifying Classifications LV2', 100, 3),
(3,'Classifying Certifications LV2', 100, 4),
(4,'Introduction to Classifications LV3', 100, 1),
(4,'Certifying Classifications LV3', 100, 2),
(4,'Classifying Certifications LV3', 100, 3),
(5,'Identifying Why Peat Moss Smells So Bad', 100, 1),
(5,'Eating Peat Moss', 100, 2),
(5,'Just Peat Moss Things', 100, 3),
(6,'Non-Renewable Peat Moss Issues', 100, 1),
(6,'Baking Non-Renewable Peat Moss', 100, 2),
(6,'Confusing Peat Moss with Pete Boss', 100, 3),
(7,'Is this a Potato?', 10,1),
(7,'Why is it Green?', 10,2),
(7,'Part-Boiling is best',10,3),
(8,'Potato Classification', 50,1),
(8,'Potato Certification', 50,2),
(9,'Secret Potato Techiques', 300,1),
(9,'Potato Mastery', 300,2);


INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Wuchu', 'Wuchu', 'Gotyadgee', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Sirke', 'Sirke', 'Gotyadgee', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Jilli', 'Jilli', 'Loytehroa', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Capdu', 'Capdu', 'Gotyadgee', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Qurli', 'Qurli', 'Loytehroa', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Wahns', 'Wahns', 'Loytehroa', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Zutne', 'Zutne', 'Fopliwfoo', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Macru', 'Macru', 'Gotyadgee', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Puwka', 'Puwka', 'Loytehroa', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Gerfed', 'Gerfed', 'Fopliwfoo', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Abcd Tamvo', 'Tamvo', 'Loytehroa', 'Abcd');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Jilli', 'Jilli', 'Loytehroa', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Qurli', 'Qurli', 'Loytehroa', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Wahns', 'Wahns', 'Loytehroa', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Puwka', 'Puwka', 'Loytehroa', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Tamvo', 'Tamvo', 'Loytehroa', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Henna', 'Henna', 'Resyurdui', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Proled', 'Proled', 'Pufyoffio', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Gumfe', 'Gumfe', 'Semsortee', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Bubri', 'Bubri', 'Pufyoffio', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Nuvso', 'Nuvso', 'Semsortee', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Burtie', 'Burtie', 'Semsortee', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Feerds Quisxy', 'Quisxy', 'Resyurdui', 'Feerds');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Henna', 'Henna', 'Resyurdui', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Gumfe', 'Gumfe', 'Semsortee', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Nuvso', 'Nuvso', 'Semsortee', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Burtie', 'Burtie', 'Semsortee', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Quisxy', 'Quisxy', 'Resyurdui', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Wuchu', 'Wuchu', 'Gotyadgee', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Sirke', 'Sirke', 'Gotyadgee', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Capdu', 'Capdu', 'Gotyadgee', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Zutne', 'Zutne', 'Fopliwfoo', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Macru', 'Macru', 'Gotyadgee', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Gerfed', 'Gerfed', 'Fopliwfoo', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Texgo', 'Texgo', 'Tilpetpae', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Layvo', 'Layvo', 'Tilpetpae', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pruisly Pepxi', 'Pepxi', 'Tilpetpae', 'Pruisly');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Henna', 'Henna', 'Resyurdui', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Quisxy', 'Quisxy', 'Resyurdui', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Jilli', 'Jilli', 'Loytehroa', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Qurli', 'Qurli', 'Loytehroa', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Wahns', 'Wahns', 'Loytehroa', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Puwka', 'Puwka', 'Loytehroa', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Tamvo', 'Tamvo', 'Loytehroa', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Proled', 'Proled', 'Pufyoffio', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Mertuf Bubri', 'Bubri', 'Pufyoffio', 'Mertuf');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pestrofed Henna', 'Henna', 'Resyurdui', 'Pestrofed');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pestrofed Jilli', 'Jilli', 'Loytehroa', 'Pestrofed');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pestrofed Proled', 'Proled', 'Pufyoffio', 'Pestrofed');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pestrofed Gumfe', 'Gumfe', 'Semsortee', 'Pestrofed');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pestrofed Wuchu', 'Wuchu', 'Gotyadgee', 'Pestrofed');
INSERT INTO `MockTestCompany`.`TestCentre` (`TestCentreName`, `TestCentreCity`, `TestCentreCountry`, `TestCentreCompany`) VALUES ('Pestrofed Sirke', 'Sirke', 'Gotyadgee', 'Pestrofed');

*/

