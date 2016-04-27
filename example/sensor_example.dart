// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:sensor/sensor.dart';

main() async {
  StreamController sc = new StreamController();
  Connection fbConnection = await fireBaseConnector(["https://banddata.firebaseio.com", 'JL', 'gsr', 'XuHBWOngUKU0w7yKiueK3SqMd5bm6qhUumi70mlr']);
  SensorSpec gsrSensor =
      sensorSpecFinder(Device.msBand2Fire, SensorType.galvanic);

  sc.stream.listen((var res){
    print(res);
  });

  Sensor gsrOnMsBand2Firebase =
      new Sensor(fbConnection, gsrSensor, sc.sink);

  gsrOnMsBand2Firebase.start();



}
