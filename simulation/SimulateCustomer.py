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

DB.buildConnection('MockTestCompany')

#cityname = 'Henna'
if (len(sys.argv)>1):
    cityname = sys.argv[1]

localdebug = False

def simulateCity(cityname):
    for cit in world.geography:
        if cit['city'] == cityname: city = cit 
    fakeCountry = Faker(world.countryLocales[city['country']]) #object to generate country style fake items
    return simulateMonths(fakeCountry, city)

def simulateMonths(fakeCountry, city):
    totalcustomers = 0
    monthlyTweakAmount = 0
    for monthDate in rrule(MONTHLY, dtstart=world.DateStart, until=world.DateEnd):
        #if localdebug: print(str(monthDate) + ' ' + str(monthlyTweakAmount))
        if (monthDate.month-1)%3 == 0: 
            if monthlyTweakAmount >= 5:
                monthlyTweakAmount += random.randrange(0,2)-2
                #if localdebug: print('reduce ' + str(monthlyTweakAmount))
            else:
                if monthlyTweakAmount <= (-5):
                    monthlyTweakAmount += random.randrange(0,2)+2
                    #if localdebug: print('increase ' + str(monthlyTweakAmount))
                else:
                    monthlyTweakAmount += int((random.randrange(0,10)-5)/2)
                    #if localdebug: print('else ' + str(monthlyTweakAmount))
        customers = abs(int((int(city['customers'])/6610)+((int(city['customers'])/6610)*(monthlyTweakAmount*0.1))))
        #if localdebug: print(str(monthDate) + ' ' + str(monthlyTweakAmount) + ' ' + str(customers)) 
        totalcustomers += simulateDays(fakeCountry, customers, city, monthDate)
        
def simulateDays(fakeCountry, customers, city, startOfMonth):
    for dayDate in rrule(DAILY, dtstart=startOfMonth, until=last_day_of_month(startOfMonth)):
        if(dayDate.isoweekday()<=5):
            dailycustomers = customers + (random.randrange(0,10,1)-5) 
            for x in range(1,dailycustomers):
                simulateCustomer(fakeCountry, city, dayDate)
    return dailycustomers

def simulateCustomer(fakeCountry, city, date):
    bookingDate = date
    TestCentre = DB.getTestCentre(city)
    customerID = art.newCustomer(fakeCountry, city)
    testCertification = random.randrange(1,8,1)
    for testpart in DB.getTestCertParts(testCertification):
        PartPassed = 'Failure'
        firstRun = True
        resit = False
        while PartPassed is 'Failure':
            bookingID = DB.newBooking(customerID, TestCentre, testpart, bookingDate)
            if(firstRun): 
                art.newCustomerPayment(bookingID, DB.getCertPrice(testCertification))
                firstRun = False
            if(resit): art.newCustomerPayment(bookingID, DB.getResitPrice(testpart))
            if (random.random() <= world.customerGeneralShittyness[city['country']]): 
                visit = art.newCustomerVisit(bookingID, bookingDate, 0)    
                return
            visit = art.newCustomerVisit(bookingID, bookingDate, 1)
            bookingDate = bookingDate + dt.timedelta(days=random.choice([2,2,2,2,3,3,4,4,5,6,7,8,9]))
            presentedIDSuccess = art.newIDRequest(visit, world.customerGeneralShittyness[city['country']])
            if(presentedIDSuccess):
                PartPassed = art.newCustomerTestPartResult(visit)
                if(PartPassed=='Failure'): resit = True

def last_day_of_month(any_day):
    next_month = any_day.replace(day=28) + dt.timedelta(days=4)  # this will never fail
    return next_month - dt.timedelta(days=next_month.day)

if(len(sys.argv)>1):
    a = dt.datetime.now()
    c = simulateCity(cityname)
    b = (dt.datetime.now() - a).total_seconds()
    print(str(c) + ' ' + str(b))