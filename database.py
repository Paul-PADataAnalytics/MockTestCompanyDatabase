import mysql.connector
import artefacts as art

from faker import Faker
from faker.providers import internet

Pufyoffio = Faker('bg_BG')
city = {'city': 'c', 'country': 'defg'}

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",#Butts4141!",
  database='MockTestCompany'
)

def insertNewCustomer(g, city, test):
    cursor = mydb.cursor(prepared=True)
    cmd = 'insert into customer(CustomerName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerEmailAddress, CustomerCountry) VALUES (%s, %s, %s, %s, %s, %s); SELECT last_insert_id()'
    if(test == True):
        return cmd
    else:
        TEST = cursor.execute(cmd , art.newCustomer(g, city), True)
        mydb.commit()
    return TEST

print(art.newCustomer(Pufyoffio, city))
print(insertNewCustomer(Pufyoffio, city, False))