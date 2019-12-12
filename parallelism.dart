import 'dart:io';
import 'dart:isolate';


main() async {
  var threads=5;
  var count = 0;
  var listener=() {
    ++count;
    sleep(Duration(seconds: 1));
    print(count);
  };

  for (var i = 0; i < threads; ++i) {
    var rp = new ReceivePort();
    var iso = await Isolate.spawn(doit, rp.sendPort);
    rp.listen((msg){
      listener();
      rp.close();
    });
  }
}

doit(SendPort sp) {
  /* check cpu parallelism
  while (true) {}
  // */
  sleep(Duration(seconds: 1));
  print('並行');
  sp.send(null);
}
