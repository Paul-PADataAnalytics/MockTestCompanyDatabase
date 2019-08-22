import random
import world as world
import database as DB

def newAddress(g, city):
    pc = g.zipcode() 
    output =  g.building_number()
    output += ' '  + g.street_name() 
    output += ', ' + city['city']
    output += ', ' + pc 
    output += ', ' + city['country'][:2]
    return output, pc

def newCustomer(g, city):
    addr, pc = newAddress(g, city)
    custname = g.name()
    email = custname.replace(' ','.') + str(g.random_digit()) + '@' + g.domain_name()
    return custname, addr, city['city'], pc, city['country'], email

def newIDRequest(g, city, customerID, VisitID):
    presentedIdentificationTypes = ['Passport', 'Photo ID', 'Driving Licence', 'Government Papers', 'Visa', 'Other']
    presentedID = random.choice(world.presentedIdentificationTypes)
    print(world.presentedIdentificationValidity[city['country']])

def newBooking(customerID, testCentreID, testCertificationPart, simulationDate):
    #return DB.insertNewBooking(customerID, testCentreID, testCertificationPart, simulationDate)
    print('newBooking')
    
def newCustomerPayment(CustomerBooking):
    customerPaymentAmount = 0
    customerPaymentMethod = ''
    customerPaymentResult = ''
    customerPaymentExternalID = ''

def newCustomerVisit(bookingID):
    customerVisitArrivalTime = 0
    customerVisitArrivalOutcome = 0

def newCustomerTestPartResult(idCustomerVisit):
    customerTestPartResultOutcome = ''
