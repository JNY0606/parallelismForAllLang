const { Worker, isMainThread, parentPort, workerData } = require('worker_threads')
const th = require('ut/thread')

async function doit() {
    /* check cpu parallelism
    while (true) { }
    //*/

    // await th.sleep2(1000)
    for (let i = 0; i < 2000000000; ++i) { }
    console.log(workerData)
    parentPort.postMessage(null)
}


function main() {
    if (isMainThread) {
        var threads=5
        let count = 0
        let listener = async function (msg) {
            ++count
            for (let i = 0; i < 2000000000; ++i) { }
            // await th.sleep2(1000)
            console.log(count)
        }

        for (let i = 0; i < threads; ++i) {
            let w = new Worker(__filename, {workerData:'並行'});
            w.on('message', listener)
        }

    } else {
        doit()
    }
}
main()