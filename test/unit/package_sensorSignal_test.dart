library sensor_signal_test;


import 'package:sensor/src/configuration/sensor_config.dart';

import 'package:sensor/src/tranformers/package_sensor_signal.dart';
import 'package:test/test.dart';

main() {
  group('Sensor Signal Types:', () {
    test("Should determine multiples type in raw signal.", (){
      Map manyTypes = {
        Gsr.datetime: 1461854345811,
        Gsr.resistance: 1292,
        Gsr.units: SiUnits.ohmKilo,
        Gsr.frequency: 200,
        Contact.contact : true,
        Contact.frequency :200,
        Distance.pace: 3223,
      };
      Map result = determineSensorTypes(manyTypes);

      print(result);

      //List<Object> sensorList = new List.from(result.keys);

      expect(result.keys.length, equals(3));
      expect(result[Gsr] is List, isTrue);
      expect(result[Contact] is List, isTrue);
      expect(result[Distance] is List, isTrue);

    });

    test('Should populate the type list witht he actual keys.',(){
      Map manyTypes = {
        Gsr.datetime: 1461854345811,
        Gsr.resistance: 1292,
        Gsr.units: SiUnits.ohmKilo,
        Gsr.frequency: 200,
        Contact.contact : true,
        Contact.frequency :200,
        Distance.pace: 3223,
      };
      Map<Object, List> result = determineSensorTypes(manyTypes);
      expect(result[Gsr].length, equals(4));
      expect(result[Distance].length, equals(1));
      expect(result[Contact].length, equals(2));
    });

    test("Should determine single type in raw message.",(){
      Map oneType = {
        Gsr.datetime: 1461854345811,
        Gsr.resistance: 1292,
        Gsr.units: SiUnits.ohmKilo,
        Gsr.frequency: 200,
      };
      Map<Object, List> result = determineSensorTypes(oneType);
      expect(result.length, equals(1));
      expect(result[Gsr] is List, isTrue);
      expect(result[Gsr].length, equals(4));
    });
  });

  group('Package Raw Sensor Signal.',(){

    test('Should receive one Sensor Signal',(){
      Map oneType = {
        Gsr.datetime: 1461854345811,
        Gsr.resistance: 1292,
        Gsr.units: SiUnits.ohmKilo,
        Gsr.frequency: 200,
      };

      List<Map> results = packageRawSignal(oneType);
      expect(results, isNotNull);

    });

  });
}
