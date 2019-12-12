using System;
using System.Threading;

namespace cscs
{
    class Parallelism
    {
        static void Main(string[] args)
        {            
            var lobj = new Object();
            var threads = 5;
            var count = 0;
            Action listener = () => {
                lock (lobj)
                {
                    ++count;
                    Thread.Sleep(1000);
                    Console.WriteLine(count);
                }
            };

            for (var i = 0; i < threads; ++i)
            {
                var t = new Thread(doit);
                t.Start(listener);
            }
        }

 
        static void doit(Object cb)
        {
            /* check cpu parallelism
            while (true){ }
            //*/

            Thread.Sleep(1000);
            var _cb = cb as Action;
            Console.WriteLine("並行");
            _cb();
        }
    }
}
