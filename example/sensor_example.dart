
import 'dart:async';

import 'package:sensor/sensor.dart';

/// Example of Building a Sensor.
main() async {

  StreamController sc = new StreamController();
  Stream gsrSensorReading = sc.stream;
  Connection fbConnection = await fireBaseConnector([
    "https://banddata.firebaseio.com",
    'JL',
    'gsr',
    'XuHBWOngUKU0w7yKiueK3SqMd5bm6qhUumi70mlr'
  ]);

  SensorSpec gsrSensor =
      loadSensorSpec(Device.msBand2Fire, SensorType.galvanic);
  assert (gsrSensor is Function);

  Sensor gsrOnMsBand2FireBase =
      new Sensor(fbConnection, gsrSensor, sc.sink, debug: false);

  if (gsrOnMsBand2FireBase.start()) {
    gsrSensorReading.listen((Map res) => print(res.toString()));
  }

}
