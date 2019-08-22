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

def newIDRequest(customerID, VisitID):
    #TODO: Implement new ID request
    presentedIdentificationTypes = ['Passport', 'Photo ID', 'Driving Licence', 'Government Papers', 'Visa', 'Other']
    visitSuccess = True
    presentedID = random.choice(world.presentedIdentificationTypes)
    print(world.presentedIdentificationValidity[city['country']])
    return visitSuccess

def newBooking(customerID, testCentreID, testCertificationPart, simulationDate):
    #TODO: implement new Booking
    #return DB.insertNewBooking(customerID, testCentreID, testCertificationPart, simulationDate)
    print('newBooking')
    
def newCustomerPayment(CustomerBooking, value):
    #TODO: Implement payment types, selection and success or failure with external ID
    customerPaymentAmount = value
    customerPaymentMethods = ['Debit Card', 'Money Order', 'Credit Order', 'Credit Card', 'Postal Order', 'Cash']
    customerPaymentResult = ''
    customerPaymentExternalID = ''

def newCustomerVisit(bookingID):
    #TODO: Implement Visit
    customerVisitArrivalTime = 0
    customerVisitArrivalOutcome = 0

def newCustomerTestPartResult(idCustomerVisit):
    #TODO: Implement TestPartResults
    customerTestPartResultOutcome = ''
