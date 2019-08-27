import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="Butts4141!",
  database='MockTestCompany'
)
cursor = mydb.cursor(dictionary=True, buffered=True)

def newCustomer(custname, address, acity, postcode, acountry, email):
    cmd = 'insert into customer(CustomerName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerEmailAddress, CustomerCountry) VALUES (%s, %s, %s, %s, %s, %s);'
    cursor.execute(cmd, (custname, address, acity, postcode, acountry, email), False)
    mydb.commit()
    return cursor._last_insert_id

def newBooking(customerID, testCentreID, testCertificationPart, simulationDate):
    cmd = 'insert into CustomerBooking(idTestCentre, CustomerBookingDateTime, idTestCertificationPart, idCustomer) VALUES (%(a)s, %(b)s, %(c)s, %(d)s);'
    cursor.execute(cmd, {'a': testCentreID, 'b': simulationDate, 'c':testCertificationPart['idTestCertificationPart'], 'd':customerID}, False)
    return cursor._last_insert_id

def getRandomCustomerIDFromCity(city):
    cursor.execute('SELECT idCustomer FROM customer where CustomerCity = %(city)s ORDER BY RAND() LIMIT 1', {'city': city['city']}, False)
    output = 0
    for row in cursor:
      output = row['idCustomer']
      break
    return output

def newPayment(customerPaymentAmount, idCustomerBooking, randomPaymentType, customerPaymentResult, customerPaymentExternalID):
    cmd = 'INSERT INTO customerpayment (CustomerPaymentAmount, idCustomerBooking, CustomerPaymentMethod, CustomerPaymentResult, CustomerPaymentExternalID) VALUES (%s, %s, %s , %s, %s)'
    cursor.execute(cmd, (customerPaymentAmount, idCustomerBooking, randomPaymentType, customerPaymentResult, customerPaymentExternalID), False)
    return cursor._last_insert_id  

def newPresentedID(visitID, atype, valid, comments):
    cmd = 'INSERT INTO presentedidentification (`idCustomerVisit`, `PresentedIdentificationType`, `PresentedIdentificationValid`, `PresentedIdentificationComments`) VALUES (%s, %s, %s ,%s)'
    cursor.execute(cmd, (visitID, atype, valid, comments), False)
    return cursor._last_insert_id

def newVisit(bookingID, arrivalDateTime):
    cmd = 'INSERT INTO customervisit (`CustomerVisitArrivalTime`, `idCustomerBooking`) VALUES (%s, %s)'
    cursor.execute(cmd, (bookingID, arrivalDateTime), False)
    return cursor._last_insert_id

def newTestOutcome(visitID, outcome):
    cmd = 'INSERT INTO customertestpartresult (`idCustomerVisit`, `CustomerTestPartResultOutcome`) VALUES (%s, %s)'
    cursor.execute(cmd, (visitID, outcome), False)
    return cursor._last_insert_id

def getCertificationNotTaken(customerID):
    print(1)

def getTestCertParts(testCertification):
    cmd = 'SELECT * FROM mocktestcompany.testcertificationpart where idTestCertification = %(testcert)s order by TestCertificationPartSequenceNumber asc'
    cursor.execute(cmd, {'testcert': testCertification}, False)
    return cursor
  
def getTestCentre(city):
    cursor.execute('SELECT idTestCentre FROM testcentre where testcentre.TestCentreCity = %(country)s ORDER BY RAND() LIMIT 1', {'country': city['city']}, False)
    output = 0
    for row in cursor:
      output = row['idTestCentre']
      break
    return output

def getCertPrice(certificationID):
    cursor.execute('SELECT TestCertifcationPrice FROM testcertification Where idTestCertification = %(certid)s', {'certid': certificationID}, False)
    output = 0
    for row in cursor:
      output = row['TestCertifcationPrice']
      break
    return output

def getResitPrice(certificationPartID):
    cursor.execute('SELECT TestCertificationRetestPrice FROM testcertificationpart where idTestCertificationPart = %(certpart)s', {'certpart': certificationPartID}, False)
    output = 0
    for row in cursor:
      output = row['TestCertificationRetestPrice']
      break
    return output

testdata = {'city': 'Tamvo', 'country': 'Loytehroa'}
#print(getRandomCustomerIDFromCity(testdata))
#print(getTestCentre(testdata))
#print(getCertPrice(4))
#print(getResitPrice(27))

#print(getTestCertParts(1))