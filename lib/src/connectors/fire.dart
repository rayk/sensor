/// Connector for FireBase that can deliver data a couple of ways.
part of connectors;

/// Connector for FireBase which returns a [Connection] from which you can stream
/// data from the passed in path.
Future<Connection> fireBaseConnector(List<String> pathToDirectory) async {
  p.Context ctx = new p.Context(style: p.Style.url);
  final String root = pathToDirectory[0];
  final String directory = pathToDirectory[1];
  final String source = pathToDirectory[2];
  final String secret = pathToDirectory[3];
  final Uri fbURL = ctx.toUri(ctx.join(root, directory));
  final Firebase fb = new Firebase(fbURL, auth: secret);
  final StreamController sc = new StreamController();

  Stream connection() {
    fb.child(source).get().then((DataSnapshot snap){
      Map sig = snap.val;
      Iterable keys = sig.keys;
      DateTime dt2;
      for (var key in keys){
        int t1 = int.parse(key);
         DateTime dt1 = new DateTime.fromMillisecondsSinceEpoch(t1);
        Duration  df = dt2?.difference(new DateTime.fromMillisecondsSinceEpoch(t1));
        Duration dw = new Duration(milliseconds: 0);
        new Future.delayed(df??dw, ()=> sc.sink.add(sig[key]));
        dt2 = new DateTime.fromMillisecondsSinceEpoch(t1);
      }
    });

    return sc.stream;
  }

  return connection;
}
