INSERT INTO MockTestCompany.TestMandate (TestMandateName, TestMandateProfessionalBody) VALUES
('Certification and Classifications', 'Certification Operations Ltd'),
('Authorised Peat Moss Operations', 'Peat Moss Guild'),
('Potato Certified Professional', 'Pot-ayy-toe Ltd');

INSERT INTO `MockTestCompany`.`TestCertification`
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