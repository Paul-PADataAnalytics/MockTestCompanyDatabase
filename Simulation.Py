import multiprocessing as mp
from multiprocessing.pool import ThreadPool
import world

import subprocess
import shlex
import datetime

pool = ThreadPool(mp.cpu_count()-1)

def simulate():
	a = datetime.datetime.now()
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
	print(datetime.datetime.now() - a)
		
def simulateCustomer(city):
    p = subprocess.Popen(shlex.split('python ./SimulateCustomer.py ' + city), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = p.communicate()
    return out, err

simulate()