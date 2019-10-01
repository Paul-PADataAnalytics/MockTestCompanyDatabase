import SimulateCustomer as sc

sc.world.DateStart = dt.date(2016,12,1)
sc.world.DateEnd = dt.date(2016,12,30)

DBDestination='MockTestCompanyMonthly'

for city in sc.world.geography:
    print(city['city'])
    sc.simulateCity(city['city'])

#Extract a table containing all the Bookings, with customer and certification details in a shitty CSV format;
#   only keyed to booking ID, no other keys, Dump as CSV "Bookings <startDate> <EndDate>.csv"
#Extract a table containing all visits and presented identification, visits keyed to bookings.
#   Dump as CSV "Visits <startDate> <EndDate>.csv"
