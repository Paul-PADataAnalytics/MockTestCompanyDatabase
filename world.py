import datetime as dt
import dateutil as du

customerGeneralShittyness =  {'Resyurdui': 0.1,
								'Loytehroa': 0.01,
								'Pufyoffio': 0.2,
								'Semsortee': 0.07,
								'Gotyadgee': 0.05,
								'Fopliwfoo': 0.1,
								'Tilpetpae': 0.125}

countryLocales = {'Resyurdui': 'hr_HR',
				  'Loytehroa': 'dk_DK',
				  'Pufyoffio': 'bg_BG',
				  'Semsortee': 'et_EE',
				  'Gotyadgee': 'cs_CZ',
				  'Fopliwfoo': 'en_GB',
				  'Tilpetpae': 'el_GR'}

#Customers means yearly customers.
geography = [		
	{	'city': 'Henna', 'country': 'Resyurdui', 'population': '2406219', 'customers': 192498},
	{	'city': 'Jilli', 'country': 'Loytehroa', 'population': '1069431', 'customers': 106943},
	{	'city': 'Proled', 'country': 'Pufyoffio', 'population': '1960623', 'customers': 176456},
	{	'city': 'Gumfe', 'country': 'Semsortee', 'population': '1960623', 'customers': 137244},
	{	'city': 'Wuchu', 'country': 'Gotyadgee', 'population': '2584457', 'customers': 129223},
	{	'city': 'Sirke', 'country': 'Gotyadgee', 'population': '1425907', 'customers': 128332},
	{	'city': 'Quisxy', 'country': 'Resyurdui', 'population': '1425907', 'customers': 14259},
	{	'city': 'Qurli', 'country': 'Loytehroa', 'population': '1336788', 'customers': 93575},
	{	'city': 'Wahns', 'country': 'Loytehroa', 'population': '712954', 'customers': 71295},
	{	'city': 'Puwka', 'country': 'Loytehroa', 'population': '2406219', 'customers': 48124},
	{	'city': 'Tamvo', 'country': 'Loytehroa', 'population': '89119', 'customers': 6238},
	{	'city': 'Bubri', 'country': 'Pufyoffio', 'population': '1069431', 'customers': 32083},
	{	'city': 'Nuvso', 'country': 'Semsortee', 'population': '445596', 'customers': 31192},
	{	'city': 'Burtie', 'country': 'Semsortee', 'population': '534715', 'customers': 16041},
	{	'city': 'Capdu', 'country': 'Gotyadgee', 'population': '1425907', 'customers': 99813},
	{	'city': 'Zutne', 'country': 'Fopliwfoo', 'population': '891192', 'customers': 62383},
	{	'city': 'Macru', 'country': 'Gotyadgee', 'population': '623834', 'customers': 62383},
	{	'city': 'Gerfed', 'country': 'Fopliwfoo', 'population': '623834', 'customers': 18715},
	{	'city': 'Texgo', 'country': 'Tilpetpae', 'population': '1871503', 'customers': 74860},
	{	'city': 'Layvo', 'country': 'Tilpetpae', 'population': '267358', 'customers': 26736},
	{	'city': 'Pepxi', 'country': 'Tilpetpae', 'population': '1158550', 'customers': 23171}
]

DateStart = dt.date(2016,1,1)
DateEnd = dt.date(2016,11,30)

presentedIdentificationTypes = ['Passport', 'Photo ID', 'Driving Licence', 'Government Papers', 'Visa', 'Other']
badIDNotes = ["Names didn't match", "ID expired", "Not the customers own ID", "ID in poor condition and couldn't be identified.", "Fake ID"]
badIDSelection = [0,0,1,1,1,1,2,2,3,4]
customerPaymentMethods = ['Debit Card', 'Money Order', 'Credit Order', 'Credit Card', 'Postal Order', 'Cash']