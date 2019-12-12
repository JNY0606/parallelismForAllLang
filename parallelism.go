package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {
	threads :=5
	//var wg *sync.WaitGroup=&sync.WaitGroup{}
	wg :=&sync.WaitGroup{}
	wg.Add(threads)

	lobj :=&sync.Mutex{}
	count:=0
	listener:=func() {
		lobj.Lock()

		count++
		time.Sleep(1000*time.Millisecond)
		fmt.Println(count)

		lobj.Unlock()
	}

	for i:=0;i< threads;i++ {
		go doit(wg, listener)
	}

	wg.Wait()
}

func doit(wg *sync.WaitGroup, cb func())  {
	defer func() {
		//fmt.Println("-1")
		wg.Done()
	}()

	/* check cpu parallelism
	for true {}
	// */

	time.Sleep(1000*time.Millisecond)
	fmt.Println("並行")
	cb()
}