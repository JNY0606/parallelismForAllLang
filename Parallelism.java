package jvjv;

public class Parallelism {

    interface ICB {
        void call() throws InterruptedException;
    }

    //無法放到main裡, lambda不能對區域變數作寫操作
    static int count = 0;

    public static void main(String[] args) {
        var threads = 5;
        var lobj = new Object();
        ICB listener = () -> {
            synchronized (lobj) {
                ++count;
                Thread.sleep(1000);
                System.out.println(count);
            }
        };

        for (var i = 0; i < threads; ++i) {
            var t = new Thread(() -> {
                try {
                    doit(listener);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            });
            t.start();
        }
    }

    static void doit(ICB cb) throws InterruptedException {
        /* check cpu parallelism
        while (true){}
        //*/

        //*
        Thread.sleep(1000);
        System.out.println("並行");
        cb.call();
        // */
    }
}
