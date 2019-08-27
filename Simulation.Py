import random
import datetime as dt
from dateutil.rrule import rrule, DAILY

from faker import Faker
from faker.providers import internet

import artefacts as art
import world as world

configState = 'Live' #or Test

def simulate():
	if configState == 'Live':
		import database as DB
	if configState == 'Test': 
		import fakerBase as DB
	for dayDate in rrule(DAILY, dtstart=world.DateStart, until=world.DateStart):
		for city in world.geography:

			#per day, per city
			if(dayDate.isoweekday()>5):
				customers = ((int(city['population'])*3)*.2) / 104 #weekend split 20% of yearly customers over 104 days
			else:
				customers = ((int(city['population'])*3)*.8) / 261 #weekday split 80% of yearly custoemrs over 261 days

			fakeCountry = Faker(world.countryLocales[city['country']]) #object to generate country style fake items

			for x in range(1,int(customers)):
				bookingDate = dayDate

				#per day, per customer, per city
				TestCentre = DB.getTestCentre(city) #need a testcentre to perform our certification in.  stays the same per certification
				#if(random.randrange(1,100)>=95):
				#	customerID = DB.getRandomCustomerIDFromCity(city)
				#else:
				customerID = art.newCustomer(fakeCountry, city)
				#select a certification that the customer has not yet completed and is reasonable for them to do so e.g. level 2 if level 1 complete.
				testCertification = 1
				#for each test part
				for testpart in DB.getTestCertParts(testCertification):
					PartPassed = False
					firstRun = True
					resit = False
					while PartPassed is False:
						#Create a Booking
						bookingID = DB.newBooking(customerID, TestCentre, testpart, bookingDate)
						#Create a payment
						if(firstRun): 
							art.newCustomerPayment(bookingID, DB.getCertPrice(testCertification))
							firstRun = False
						if(resit): art.newCustomerPayment(bookingID, DB.getResitPrice(testpart))
						#Create a visit
						visit = art.newCustomerVisit(bookingID, bookingDate)
						bookingDate =+ random.choice([2,2,2,2,3,3,4,4,5,6,7,8,9])
						#create some identification with a result
						presentedIDSuccess = art.newIDRequest(visit, world.customerGeneralShittyness[city['country']])
						if(presentedIDSuccess):
							#if test result identification was right, create a test outcome
							PartPassed = art.newCustomerTestPartResult(visit)
							if(PartPassed==False): resit = True
							#if the test outcome was bad
								#-do it all again-

simulate()