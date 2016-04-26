/// Connector for firebase.
library connector_fire_base;

import 'dart:async';
import 'dart:io';


import 'package:sensor/src/types/connector_types.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_rest/firebase_rest.dart';

Future<Connection> fireBaseConnector(List<String> pathToDirectory) async {
  p.Context ctx = new p.Context(style: p.Style.url);
  final String protocol = pathToDirectory[0];
  final String pathToFirebase = pathToDirectory[1];
  final String source = pathToDirectory[2];
  final String secertKey = pathToDirectory[3];

  final Uri fbResource = ctx.toUri(ctx.join(protocol, pathToFirebase));

  final Firebase firebase = new Firebase(fbResource, auth: secertKey);
  StreamController sc = new StreamController();

  Stream connection(){

    firebase.child(source).get().then((DataSnapshot snap){
      sc.sink.add(snap.val);
    });

    return sc.stream;
  }

  return connection;


}
