
def newAddress(g, city):
    pc = g.zipcode() 
    output =  g.building_number()
    output += ' '  + g.street_name() 
    output += ', ' + city['city']
    output += ', ' + pc 
    output += ', ' + city['country'][:2]
    return output, pc

def newCustomer(g, city):
    addr, pc = newAddress(g, city)
    custname = g.name()
    email = custname.replace(' ','.') + str(g.random_digit()) + '@' + g.domain_name()
    return custname, addr, city['city'], pc, city['country'], email