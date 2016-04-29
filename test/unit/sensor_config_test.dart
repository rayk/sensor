@TestOn('vm')
@Timeout(const Duration(seconds: 5))
library unit_test_filio;

import 'dart:async';
import 'package:sensor/src/configuration/sensor_config.dart';
import 'package:test/test.dart';

void main() {
  group('Lookup Configurations', () {
    test('Should get Gsr key for the Date and time Key.', () {
      var device = sensorManifest[Device.msBand2Fire];
      var sensor = device[SensorType.galvanic];
      var gsrDateTimeKey = sensor[Gsr.datetime];
      expect(gsrDateTimeKey, equals('timestamp'));
      expect(sensor[Gsr.resistance], equals('resistance'));
      expect(sensor[Gsr.units], equals(SiUnits.ohmKilo));
    });
  });

  group('Lookup using the descriptor function.', () {
    test("Should get Gsr key for data and Time", () {
      SensorSpec gsrSensor =
          loadSensorSpec(Device.msBand2Fire, SensorType.galvanic);
      expect(gsrSensor(key:Gsr.datetime), equals('timestamp'));
      expect(gsrSensor(key:Gsr.frequency), equals(200));
    });

    test("Should provide a list of all the keys for the configuration.",(){
      SensorSpec gsrSensor = loadSensorSpec(Device.msBand2Fire, SensorType.galvanic);
      expect(gsrSensor() is List, isTrue);
      List keys = gsrSensor();
      expect(keys, contains(Gsr.datetime));
      expect(keys, contains(Gsr.resistance));
      expect(keys, contains(Gsr.units));
      expect(keys, contains(Gsr.frequency));
      expect(keys, contains(Gsr.scale));
    });

    test("Should determine an extraction process.",(){
      SensorSpec gsrSensor = loadSensorSpec(Device.msBand2Fire, SensorType.galvanic);
      expect(gsrSensor() is List, isTrue);
    });

    //test("Should Error out when asking for nonexisten attribute.", () {
      //SensorSpec gsrSensor =
        //  sensorSpecFinder(Device.msBand2Fire, SensorType.galvanic);
    //  expect(()=>gsrSensor(key:Gsr.rawFormat), throwsArgumentError);
    //});
  });


}
