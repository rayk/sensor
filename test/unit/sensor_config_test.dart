@TestOn('vm')
@Timeout(const Duration(seconds: 5))
library unit_test_filio;

import 'dart:async';
import 'package:sensor/src/sensor_config.dart';
import 'package:test/test.dart';

void main() {
  group('Lookup Configurations', () {
    test('Should get Gsr key for the Date and time Key.', () {
      var device = deviceSensors[Device.msBand2Fire];
      var sensor = device[SensorType.galvanic];
      var gsrDateTimeKey = sensor[Gsr.datetime];
      expect(gsrDateTimeKey, equals('timestamp'));
      expect(sensor[Gsr.resistence], equals('resistence'));
      expect(sensor[Gsr.units], equals(SiUnits.ohmKilo));
    });

  
  });
}
