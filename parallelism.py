import multiprocessing as p
import time


def doit():
    ''' check CPU parallelism
    while True:
        pass
    #'''

    time.sleep(1)
    print('並行')

count=0
def main():
    def listener(x):
        global count

        count+=1
        time.sleep(1)
        print(count)


    threads=5
    pool=p.Pool()
    for i in range(threads):
        pool.apply_async(doit, callback=listener)


    # '''
    while threads!=count:
        time.sleep(1)
    #'''
main()