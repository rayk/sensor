/// Connector for FireBase that can deliver data a couple of ways.
part of connectors;

/// Connector for FireBase which returns a [Connection] from which you can stream
/// data from the passed in path.
Future<Connection> fireBaseConnector(List<String> pathToDirectory, {int speedUp}) async {
  p.Context ctx = new p.Context(style: p.Style.url);
  final String root = pathToDirectory[0];
  final String directory = pathToDirectory[1];
  final String source = pathToDirectory[2];
  final String secret = pathToDirectory[3];
  final Uri fbURL = ctx.toUri(ctx.join(root, directory));
  final Firebase fb = new Firebase(fbURL, auth: secret);
  final StreamController sc = new StreamController();

  Stream connection() {
    fb.child(source).get().then((DataSnapshot snap) {
      Map sig = snap.val;
      Iterable keys = sig.keys;
      DateTime currentSignalDateTime;
      DateTime previousSignDateTime;
      Duration actualDelay;
      Duration streamDelay;
      int speedUpRate = speedUp;

      for (var key in keys) {
        int t1 = int.parse(key);
       currentSignalDateTime = new DateTime.fromMillisecondsSinceEpoch(t1);

        if(previousSignDateTime == null){
          sc.sink.add(sig[key]);
          previousSignDateTime = new DateTime.fromMillisecondsSinceEpoch(t1);
        } else {
          actualDelay = currentSignalDateTime.difference(previousSignDateTime);
          int d = (actualDelay.inMilliseconds / speedUpRate).toInt();
          streamDelay = new Duration(milliseconds: d);
          new Future.delayed(streamDelay, ()=> sc.add(sig[key]));
          previousSignDateTime = new DateTime.fromMillisecondsSinceEpoch(t1);
        }
      }
    });

    return sc.stream;
  }

  return connection;
}
