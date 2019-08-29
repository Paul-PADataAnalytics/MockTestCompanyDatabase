import random
import datetime as dt

from faker import Faker
from faker.providers import internet
from dateutil.rrule import rrule, DAILY
import datetime as dt

#my stuff
import artefacts as art
import world as world
import database as DB
import sys

cityname = sys.argv[1] #'Henna'

def simulateCustomers(cityname):
    totalcustomers = 0
    for cit in world.geography:
        if cit['city'] == cityname: city = cit 
    fakeCountry = Faker(world.countryLocales[city['country']]) #object to generate country style fake items
    for dayDate in rrule(DAILY, dtstart=world.DateStart, until=world.DateEnd):
        if(dayDate.isoweekday()<=5): #don't simulate on weekends
            customers = int(int(city['customers'])/261)  #weekday split 80% of yearly custoemrs over 261 days
            customers = customers - random.randrange(0,int(customers/2),1)
            totalcustomers = totalcustomers + customers
            for x in range(1,customers):
                bookingDate = dayDate
                #per day, per customer, per city
                TestCentre = DB.getTestCentre(city) #need a testcentre to perform our certification in.  stays the same per certification
                #TODO get an existing customer and choose a new qualification for them.
                customerID = art.newCustomer(fakeCountry, city)
                #TODO make it so the code gets a different certification for each person and takes account of the certs a person has.
                testCertification = random.randrange(1,8,1)
                for testpart in DB.getTestCertParts(testCertification):
                    PartPassed = 'Failure'
                    firstRun = True
                    resit = False
                    while PartPassed is 'Failure':
                        #Create a Booking
                        bookingID = DB.newBooking(customerID, TestCentre, testpart, bookingDate)
                        #Create a payment
                        if(firstRun): 
                            art.newCustomerPayment(bookingID, DB.getCertPrice(testCertification))
                            firstRun = False
                        if(resit): art.newCustomerPayment(bookingID, DB.getResitPrice(testpart))
                        #Create a visit
                        visit = art.newCustomerVisit(bookingID, bookingDate)
                        bookingDate = bookingDate + dt.timedelta(days=random.choice([2,2,2,2,3,3,4,4,5,6,7,8,9]))
                        #create some identification with a result
                        presentedIDSuccess = art.newIDRequest(visit, world.customerGeneralShittyness[city['country']])
                        if(presentedIDSuccess):
                            #if test result identification was right, create a test outcome
                            PartPassed = art.newCustomerTestPartResult(visit)
                            if(PartPassed=='Failure'): resit = True
                            #if the test outcome was bad
                                #-do it all again-
    return totalcustomers
        
a = dt.datetime.now()
c = simulateCustomers(cityname)
b = (dt.datetime.now() - a).total_seconds()
print(str(c) + ' ' + str(b))