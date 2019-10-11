import unittest
import Simulation as sim

sim.configState = 'Test'

city = {'city': 'c', 'country': 'defg'}

class FakeFaker:
    def name(self):
        return 'John Smith'
    def building_number(self):
        return '1'
    def street_name(self):
        return 'a b'
    def zipcode(self):
        return '1'
    def random_digit(self):
        return 1
    def domain_name(self):
        return 'email.com'

ffk = FakeFaker()

class AddTests(unittest.TestCase):
    def test_NewCustomer(self):
        custname, address, acity, postcode, acountry, email = sim.art.newCustomer(ffk, city)
        self.assertEqual(custname,'John Smith')
        self.assertEqual(address, '1 a b, c, 1, de')
        self.assertEqual(acity,city['city'])
        self.assertEqual(postcode,'1')
        self.assertEqual(email,'John.Smith1@email.com')
        self.assertEqual(acountry, city['country'])
    
    def test_newAddress(self):
        addr, pc = sim.art.newAddress(ffk, city)
        self.assertEqual(addr, '1 a b, c, 1, de')
        self.assertEqual(pc, '1')