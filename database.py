import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="Butts4141!",
  database='MockTestCompany'
)
cursor = mydb.cursor(dictionary=True)

def newCustomer(custname, address, acity, postcode, acountry, email):
    cmd = 'insert into customer(CustomerName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerEmailAddress, CustomerCountry) VALUES (%s, %s, %s, %s, %s, %s);'
    cursor.execute(cmd, (custname, address, acity, postcode, acountry, email), False)
    mydb.commit()
    return cursor._last_insert_id

def newBooking(customerID, testCentreID, testCertificationPart, simulationDate):
    cmd = 'insert into CustomerBooking(idTestCentre, CustomerBookingDateTime, idTestCertificationPart, idCustomer) VALUES (%s, %s, %s, %s);'
    cursor.execute(cmd, (testCentreID, simulationDate, testCertificationPart, customerID), False)
    return cursor._last_insert_id

def getRandomCustomerIDFromCity(city):
    cursor.execute('SELECT idCustomer FROM customer where CustomerCity = %(city)s ORDER BY RAND() LIMIT 1', {'city': city['city']}, False)
    output = 0
    for row in cursor:
      output = row['idCustomer']
      break
    return output

def newPayment(customerID, bookingID):
  print(1)

def getCertificationNotTaken(customerID):
    print(1)

def getTestCentre(city):
    cursor.execute('SELECT idTestCentre FROM testcentre where testcentre.TestCentreCity = %(country)s ORDER BY RAND() LIMIT 1', {'country': city['city']}, False)
    output = 0
    for row in cursor:
      output = row['idTestCentre']
      break
    return output

testdata = {'city': 'Tamvo', 'country': 'Loytehroa'}
#print(getRandomCustomerIDFromCity(testdata))
print(getTestCentre(testdata))