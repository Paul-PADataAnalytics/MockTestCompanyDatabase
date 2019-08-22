import random
import datetime as dt
import dateutil as du

from faker import Faker
from faker.providers import internet

import artefacts as art
import world as world

configState = 'Live' #or Test

def simulate():
	bookingDate = dt.date
	if configState == 'Live':
		import database as DB
	if configState == 'Test': 
		import fakerBase as DB
	for dayDate in du.rrule(du.rrule.DAILY, dtstart=world.DateStart, until=world.DateStart):
		for city in world.geography:
			#per day, per city
			if(dayDate.isoWeekday()>5):
				customers = ((city[1]['customers']*3)*.2) / 104 #weekend split 20% of yearly customers over 104 days
			else:
				customers = ((city[1]['customers']*3)*.8) / 261 #weekday split 80% of yearly custoemrs over 261 days

			fakeCountry = Faker(world.countryLocales[city[1]['country']]) #object to generate country style fake items

			for x in range(1,customers):
				#per day, per customer, per city
				TestCentre = DB.getTestCentre(city[1]) #need a testcentre to perform our certification in.  stays the same per certification
				if(random.randrange(1,100)>=95):
					customerID = getRandomCustomerIDFromCity(city[1])
				else:
					customerID = art.newCustomer(fakeCountry, city[1])
				#select a certification that the customer has not yet completed and is reasonable for them to do so e.g. level 2 if level 1 complete.
				testCertification = 1
				#for each test part
				for testpart in db.getTestCertParts(testCertification):
					PartPassed = False
					firstRun = True
					resit = False
					while PartPassed is False:
						#Create a Booking
						bookingID = art.newBooking(customerID, testCentreID, bookingDate)
						#Create a payment
						if(firstRun): 
							art.newCustomerPayment(bookingID, DB.getCertPrice(testCertification))
							firstRun = False
						if(resit): art.newCustomerPayment(bookingID, DB.getResitPrice(testpart))
						#Create a visit
						visit = newCustomerVisit(bookingID)
						#create some identification with a result
						presentedIDSuccess = False
						while presentedIDSuccess is False:
							presentedIDSuccess = newIDRequest(visit)
							#if test result identification was right, create a test outcome
							PartPassed = newCustomerTestPartResult(visit)
							if(PartPassed==False): resit = True
							#if the test outcome was bad
								#-do it all again-