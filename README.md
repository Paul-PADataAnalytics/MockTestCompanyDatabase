# MockTestCompanyDatabase
Mock Test/Certification Company Database

This repo contains my simulation of a test company, their business and their customers.

The story is a follows.

>Mock company receives a mandate to grant certifications on behalf of a professional body.  The mandate governs the available services provided.
>
>Each certification is made up of a number of tests, henceforce known as certification parts, or test parts, taken at an external test centre.  Test centres are operated by one of 5 different companies in the different cities and countries.
>
>There are customers who visit test centres via a booking and take single testing activities which build up into a full certification.  The customer pays the certification price once for all certification part activities.  If the customer fails the part, the can resit it. The customer will pay a resit fee for each attempt.
>
>Payments are stored individually but not details of the payment.  This simulates the process of handling payments in an separate system and isolating this database from the payment security requirements.   !This should be commonplace in businesses!.
>
>Customers must present identification on arrival and we will record what these are.  Customers test attendance is modelled as Attended, Rejected at entrance (where they were not able to prove their identity) and No Show (where they didn't attend).  Non-successful  will result in a rebooking but not a payment of resit fees.  Customers payments are stored and referenced by the booking.
>
>Customers record Pass or Fail for each test. In this simulation the customer will rebook the test part and pay their resit fee.
>
>Customers can take multiple certifications.
>
>Test Centres exist in cities in countries and belong to a company.  Each company has test centres in some of the countries, not all.
>
>Cities and countries have populations that limit the amount of customers available to each test centre.
>
>Companies have different scopes and have been contracted to hold different certifications.
