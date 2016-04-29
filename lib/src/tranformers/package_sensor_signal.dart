/// Packages the raw signals into one or more Sensor Signal depending upon
/// it's contains.

library package_sensor_signal_test;

import 'package:sensor/src/sensor_signal.dart';

/// Returns a List of SensorSignals based on the raw signal.
List<Map> packageRawSignal(Map rawSignal){

  List<Map> result = new List();

  Map<Object, List> sensorBreakDown = determineSensorTypes(rawSignal);
  assert (sensorBreakDown.isNotEmpty);

  List<Object> sensorsInvolved = new List.from(sensorBreakDown.keys);
  assert(sensorsInvolved.isNotEmpty);
  assert(sensorsInvolved is List);

  for (Object sensor in sensorsInvolved){
   List sensorKeyList = new List();
    Map sensorSignal = new Map();
   sensorKeyList.addAll(sensorBreakDown[sensor]);

    for (Object key in sensorKeyList){
      sensorSignal[SensorSignal.datetime] = new DateTime.now();
      sensorSignal[SensorSignal.type] = sensor;
      sensorSignal[key] = rawSignal[key];
    }
    result.add(sensorSignal);
  }
  assert (result.isNotEmpty);
  return result;
}


/// Determines the sensor data type contain in a raw signal.
Map<Object, List> determineSensorTypes(Map rawSignal) {
  List keys = new List.from(rawSignal.keys, growable: false);
  Map<Object, List> ckm = new Map();

  void _classify(k) {
    ckm.containsKey(k.runtimeType)
        ? ckm[k.runtimeType].add(k)
        : ckm[k.runtimeType] = new List.from([k]);
  }

  keys.forEach((k) => _classify(k));

  return ckm;
}
