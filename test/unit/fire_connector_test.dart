@TestOn('vm')
@Timeout(const Duration(seconds: 5))
library unit_test_filio;

import 'dart:async';
import 'package:test/test.dart';
import 'package:sensor/src/connectors/fire.dart';
import 'package:sensor/src/connectors/connector_types.dart';


void main(){

  group('Establish connection with filebase',() async{

    List connectionString = ["https://banddata.firebaseio.com", 'JL', 'gsr', 'XuHBWOngUKU0w7yKiueK3SqMd5bm6qhUumi70mlr'];

    Connection testConnector = await fireBaseConnector(connectionString);

    Stream result = testConnector();

    result.listen((value){
      List entry = new List.from(value.keys);
      print(entry.length);
      var rec = entry.first;
      print(value[rec].runtimeType);
      Map result = new Map.from(value[rec]);
      print(result);

    });

  });

}
