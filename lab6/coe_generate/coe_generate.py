import random

with open('coe.txt', 'w') as f:
    for x in range(2**11):
        s = (hex(random.randint(0,15)).split('x')[1]).zfill(8)
        print (s)
        f.write(s+'\n')


