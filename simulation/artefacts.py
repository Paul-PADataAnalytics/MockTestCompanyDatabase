import random
import world as world
import database as DB
import datetime as dt
import random

def newAddress(g, city):
    pc = g.postcode()
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
    if (random.random() < 0.029):
        specialneeds = 1
    else:   
        specialneeds = 0    
    return DB.newCustomer(custname, addr, city['city'], pc, city['country'], email, specialneeds)

def newIDRequest(VisitID, shittynessfactor):
    r = random.random()
    if(r > shittynessfactor):
        visitSuccess = True
        notes = ''
    else:
        visitSuccess = False
        notes = world.badIDNotes[random.choice(world.badIDSelection)]
        #print(notes)
    presentedID = random.choice(world.presentedIdentificationTypes)
    DB.newPresentedID(VisitID,presentedID,visitSuccess,notes)
    return visitSuccess
    
def newCustomerPayment(CustomerBooking, value):
    customerPaymentAmount = value
    randomPaymentType = random.choice(world.customerPaymentMethods)
    customerPaymentResult = random.choice(['Success','Success','Success','Success','Success','Success','Success','Failure'])
    customerPaymentExternalID = 'abc123456789' #TODO: make a random string to a mask using Faker
    DB.newPayment(customerPaymentAmount, CustomerBooking, randomPaymentType, customerPaymentResult, customerPaymentExternalID)
    return newCustomerPayment

def newCustomerVisit(bookingID, date, outcome):
    customerVisitArrivalTime = dt.datetime(date.year,date.month,date.day, (8+random.randrange(0,8,1)), random.randrange(0,4,1)*15)
    return DB.newVisit(bookingID,customerVisitArrivalTime, outcome)

def newCustomerTestPartResult(idCustomerVisit):
    #TODO: Implement TestPartResults
    customerTestPartResultOutcome = random.choice(['Success','Success','Success','Success','Success','Success','Success','Failure'])
    DB.newCustomerTestPartResult(idCustomerVisit,customerTestPartResultOutcome)
    return customerTestPartResultOutcome