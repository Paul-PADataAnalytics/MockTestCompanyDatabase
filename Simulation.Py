import random
import datetime as dt
import dateutil as du

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
	for x in range(world.DateStart, world.DateEnd):
		for city in world.geography:
			fakeCountry = Faker(world.countryLocales[city[1]['country']])
			print(city[0] + ', ' + city[1]['country'])
			for x in range(1,city[1]['customers']):
				print(x)
				randomTestCentre = DB.getTestCentre(city[1])
				if(random.randrange(1,100)>=95):
					customerID = getRandomCustomerIDFromCity(city[1])
					#Customerid = get random customer from same city
				else:
					customerid = art.newCustomer(fakeCountry, city[1])
					#customerID = New Customer
				#select a certification that the customer has not yet completed and is reasonable for them to do so e.g. level 2 if level 1 complete.
				testCertification = 1
				for testpart in getTestCertParts(testCertification)
				#for each test part
					#Create a Booking
					bookingID = art.newBooking(customerID, testCentreID, )
					art.newCustomerPayment(bookingID)
					#Create a payment
						#Select a test centre at random
						#Select a date in the future
						#Create a visit
							#create some identification with a result
							#if test result identification was right, create a test outcome
							#if the test outcome was bad
								#-do it all again-