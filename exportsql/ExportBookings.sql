SELECT
	CB.idCustomerBooking,
	CB.CustomerBookingDateTime,
    C.CustomerAddress,
    C.CustomerCity,
    C.CustomerCountry,
    C.CustomerEmailAddress,
    C.CustomerName,
    C.CustomerPostCode,
    C.CustomerSpecialNeeds,
    CP.CustomerPaymentAmount,
    CP.CustomerPaymentExternalID,
    CP.CustomerPaymentMethod,
    CP.CustomerPaymentResult,
    TC.TestCentreName,
    TCP.TestCertificationPartName,
    TCert.TestCertifcationName
FROM
	CustomerBooking CB
		LEFT JOIN
	Customer C
		on CB.idCustomer = C.idCustomer
		LEFT JOIN
	CustomerPayment CP
		on CB.idCustomerBooking = CP.idCustomerBooking
		LEFT JOIN
	TestCentre TC
		on CB.idTestCentre = TC.idTestCentre
		LEFT JOIN
	TestCertificationPart TCP
		ON CB.idTestCertificationPart = TCP.idTestCertificationPart
        LEFT OUTER JOIN
	TestCertification TCert
		on TCP.idTestCertification = TCert.idTestCertification
Limit 100
;