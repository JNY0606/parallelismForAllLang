import kotlin.concurrent.thread

fun doit(cb: () -> Unit) {
    /* check cpu parallelism
    while (true){}
    // */

    Thread.sleep(1000)
    println("並行")
    cb()
}

fun main(args: Array<String>) {
    var threads = 5
    var lobj = Object()
    var count = 0
    var listener = fun() {
        synchronized(lobj) {
            ++count
            Thread.sleep(1000)
            println(count)
        }
    }

    for (i in 0..threads - 1) {
        thread {
            doit(listener)
        }
    }
}

