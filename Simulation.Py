import multiprocessing as mp
from multiprocessing.pool import ThreadPool
import world

import subprocess
import shlex

pool = ThreadPool(mp.cpu_count()*2)

def simulate():
	#cities = []
	results = []
	for city in world.geography:
		print(city['city'])
		#cities.append(city['city'])
		#per day, per city
		results.append(pool.apply_async(simulateCustomer, (city['city'],)))
	pool.close()
	pool.join()
	for result in results:
		out, err = result.get()
		print("out: {} err: {}".format(out, err))
		
def simulateCustomer(city):
    p = subprocess.Popen(shlex.split('python C:/MockTestCompanyDatabase/SimulateCustomer.py ' + city), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = p.communicate()
    return out, err

simulate()