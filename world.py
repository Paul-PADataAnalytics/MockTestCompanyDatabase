import datetime as dt
import dateutil as du

presentedIdentificationValidity =  {'Resyurdui': 0.1,
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

geography = {		
	'Henna': {	'city': 'Henna', 'country': 'Resyurdui', 'population': '2406219', 'customers': 192498},
	'Jilli': {	'city': 'Jilli', 'country': 'Loytehroa', 'population': '1069431', 'customers': 106943},
	'Proled': {	'city': 'Proled', 'country': 'Pufyoffio', 'population': '1960623', 'customers': 176456},
	'Gumfe': {	'city': 'Gumfe', 'country': 'Semsortee', 'population': '1960623', 'customers': 137244},
	'Wuchu': {	'city': 'Wuchu', 'country': 'Gotyadgee', 'population': '2584457', 'customers': 129223},
	'Sirke': {	'city': 'Sirke', 'country': 'Gotyadgee', 'population': '1425907', 'customers': 128332},
	'Quisxy': {	'city': 'Quisxy', 'country': 'Resyurdui', 'population': '1425907', 'customers': 14259},
	'Qurli': {	'city': 'Qurli', 'country': 'Loytehroa', 'population': '1336788', 'customers': 93575},
	'Wahns': {	'city': 'Wahns', 'country': 'Loytehroa', 'population': '712954', 'customers': 71295},
	'Puwka': {	'city': 'Puwka', 'country': 'Loytehroa', 'population': '2406219', 'customers': 48124},
	'Tamvo': {	'city': 'Tamvo', 'country': 'Loytehroa', 'population': '89119', 'customers': 6238},
	'Bubri': {	'city': 'Bubri', 'country': 'Pufyoffio', 'population': '1069431', 'customers': 32083},
	'Nuvso': {	'city': 'Nuvso', 'country': 'Semsortee', 'population': '445596', 'customers': 31192},
	'Burtie': {	'city': 'Burtie', 'country': 'Semsortee', 'population': '534715', 'customers': 16041},
	'Capdu': {	'city': 'Capdu', 'country': 'Gotyadgee', 'population': '1425907', 'customers': 99813},
	'Zutne': {	'city': 'Zutne', 'country': 'Fopliwfoo', 'population': '891192', 'customers': 62383},
	'Macru': {	'city': 'Macru', 'country': 'Gotyadgee', 'population': '623834', 'customers': 62383},
	'Gerfed': {	'city': 'Gerfed', 'country': 'Fopliwfoo', 'population': '623834', 'customers': 18715},
	'Texgo': {	'city': 'Texgo', 'country': 'Tilpetpae', 'population': '1871503', 'customers': 74860},
	'Layvo': {	'city': 'Layvo', 'country': 'Tilpetpae', 'population': '267358', 'customers': 26736},
	'Pepxi': {	'city': 'Pepxi', 'country': 'Tilpetpae', 'population': '1158550', 'customers': 23171},
}

DateStart = dt.date(2016,1,1)
DateEnd = dt.date(2018,12,31)