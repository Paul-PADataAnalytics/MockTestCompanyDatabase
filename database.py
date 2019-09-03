import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="Butts4141!",
  database='MockTestCompanyMemory'
)
cursor = mydb.cursor(dictionary=True, buffered=True, )

def newCustomer(custname, address, acity, postcode, acountry, email):
    cmd = 'insert into Customer(CustomerName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerEmailAddress, CustomerCountry) VALUES (%s, %s, %s, %s, %s, %s);'
    cursor.execute(cmd, (custname, address, acity, postcode, email, acountry), False)
    mydb.commit()
    return cursor._last_insert_id

def newBooking(customerID, testCentreID, testCertificationPart, simulationDate):
    cmd = 'insert into CustomerBooking(idTestCentre, CustomerBookingDateTime, idTestCertificationPart, idCustomer) VALUES (%(a)s, %(b)s, %(c)s, %(d)s);'
    cursor.execute(cmd, {'a': testCentreID, 'b': simulationDate, 'c':testCertificationPart['idTestCertificationPart'], 'd':customerID}, False)
    mydb.commit()
    return cursor._last_insert_id

def newPayment(customerPaymentAmount, idCustomerBooking, randomPaymentType, customerPaymentResult, customerPaymentExternalID):
    cmd = 'INSERT INTO CustomerPayment (CustomerPaymentAmount, idCustomerBooking, CustomerPaymentMethod, CustomerPaymentResult, CustomerPaymentExternalID) VALUES (%s, %s, %s , %s, %s)'
    cursor.execute(cmd, (customerPaymentAmount, idCustomerBooking, randomPaymentType, customerPaymentResult, customerPaymentExternalID), False)
    mydb.commit()
    return cursor._last_insert_id  

def newPresentedID(visitID, atype, valid, comments):
    cmd = 'INSERT INTO PresentedIdentification (`idCustomerVisit`, `PresentedIdentificationType`, `PresentedIdentificationValid`, `PresentedIdentificationComments`) VALUES (%s, %s, %s ,%s)'
    cursor.execute(cmd, (visitID, atype, valid, comments), False)
    mydb.commit()
    return cursor._last_insert_id

def newVisit(bookingID, arrivalDateTime):
    cmd = 'INSERT INTO CustomerVisit (`idCustomerBooking`, `CustomerVisitArrivalTime`) VALUES (%s, %s)'
    cursor.execute(cmd, (bookingID, arrivalDateTime), False)
    mydb.commit()
    return cursor._last_insert_id

def newCustomerTestPartResult(visitID, outcome):
    cmd = 'INSERT INTO CustomerTestPartResult (`idCustomerVisit`, `CustomerTestPartResultOutcome`) VALUES (%s, %s)'
    cursor.execute(cmd, (visitID, outcome), False)
    mydb.commit()
    return cursor._last_insert_id

def getRandomCustomerIDFromCity(city):
    cursor.execute('SELECT idCustomer FROM Customer where CustomerCity = %(city)s ORDER BY RAND() LIMIT 1', {'city': city['city']}, False)
    output = 0
    for row in cursor:
      output = row['idCustomer']
      break
    return output

def getCertificationNotTaken(customerID):
    print(1)

def getTestCertParts(testCertification):
    cmd = 'SELECT * FROM TestCertificationPart where idTestCertification = %(testcert)s order by TestCertificationPartSequenceNumber asc'
    cursor.execute(cmd, {'testcert': testCertification}, False)
    return cursor
  
def getTestCentre(city):
    cursor.execute('SELECT idTestCentre FROM TestCentre where TestCentre.TestCentreCity = %(country)s ORDER BY RAND() LIMIT 1', {'country': city['city']}, False)
    output = 0
    for row in cursor:
      output = row['idTestCentre']
      break
    return output

def getCertPrice(certificationID):
    cursor.execute('SELECT TestCertifcationPrice FROM TestCertification Where idTestCertification = %(certid)s', {'certid': certificationID}, False)
    output = 0
    for row in cursor:
      output = row['TestCertifcationPrice']
      break
    return output

def getResitPrice(testCertificationPart):
    cursor.execute('SELECT TestCertificationRetestPrice FROM TestCertificationPart where idTestCertificationPart = %(certpart)s', {'certpart': testCertificationPart['idTestCertificationPart']}, False)
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