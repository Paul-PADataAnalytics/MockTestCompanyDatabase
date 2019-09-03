import random
import datetime as dt

from faker import Faker
from faker.providers import internet
from dateutil.rrule import rrule, DAILY, MONTHLY
import datetime as dt

#my stuff
import artefacts as art
import world as world
import database as DB
import sys

cityname = sys.argv[1]
#cityname = 'Henna'
localdebug = False

def simulateCustomers(cityname):
    totalcustomers = 0
    monthlyTweakAmount = 0
    for cit in world.geography:
        if cit['city'] == cityname: city = cit 
    fakeCountry = Faker(world.countryLocales[city['country']]) #object to generate country style fake items
    for monthDate in rrule(MONTHLY, dtstart=world.DateStart, until=world.DateEnd):
        if localdebug: print(str(monthDate) + ' ' + str(monthlyTweakAmount))
        if monthlyTweakAmount >= 5:
            monthlyTweakAmount += random.randrange(0,2)-2
            if localdebug: print('reduce ' + str(monthlyTweakAmount))
        else:
            if monthlyTweakAmount <= (-5):
                monthlyTweakAmount += random.randrange(0,2)+2
                if localdebug: print('increase ' + str(monthlyTweakAmount))
            else:
                monthlyTweakAmount += int((random.randrange(0,10)-5)/2)
                if localdebug: print('else ' + str(monthlyTweakAmount))
        customers = abs(int((int(city['customers'])/2610)+((int(city['customers'])/2610)*(monthlyTweakAmount*0.1))))
        if localdebug: print(str(monthDate) + ' ' + str(monthlyTweakAmount) + ' ' + str(customers)) 
        for dayDate in rrule(DAILY, dtstart=monthDate, until=last_day_of_month(monthDate)):
            if(dayDate.isoweekday()<=5): #don't simulate on weekends
                dailycustomers = customers + (random.randrange(0,10,1)-5) 
                totalcustomers = totalcustomers + customers  
                #if localdebug: print('DayDate ' + str(dayDate) + ' ' + str(customers) + ' ' + str(dailycustomers))
                for x in range(1,dailycustomers):
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

def last_day_of_month(any_day):
    next_month = any_day.replace(day=28) + dt.timedelta(days=4)  # this will never fail
    return next_month - dt.timedelta(days=next_month.day)

a = dt.datetime.now()
c = simulateCustomers(cityname)
b = (dt.datetime.now() - a).total_seconds()
print(str(c) + ' ' + str(b))