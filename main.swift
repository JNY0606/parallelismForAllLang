import Foundation


func doit(cb:()->Void){
    /* check cpu parallelism
    while true {}
    // */
    
    Thread.sleep(forTimeInterval: 1)
    print("並行")
    cb()
}


func main(){
    var threads=5
    var count=0
    var lobj=NSCondition()
    var listener = { () in
        lobj.lock()
        
        count+=1
        Thread.sleep(forTimeInterval: 1)
        print(count)
        
        lobj.unlock()
    }
    
    for _ in 1...threads {
        var t=Thread {
            doit(cb: listener)
        }
        t.start()
    }
    

    while threads != count {
        Thread.sleep(forTimeInterval: 1)
    }
}
main()
