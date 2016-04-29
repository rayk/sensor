library extractor_test;

import 'package:test/test.dart';
import 'package:sensor/src/configuration/sensor_config.dart';
import 'package:sensor/src/extractor/extractor.dart';

main() {
  group('Extract singal from Map:', () {
    test('Should extract only requested keys. ', () {
      Map detect = {
        'timestamp': 1239420397,
        'resistance': 892374,
        'happy': true
      };
      SensorSpec gsrSensor =
          loadSensorSpec(Device.msBand2TestFakeMap, SensorType.galvanic);
      List keys = gsrSensor();
      Map result = signalFromMap(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      for (var key in keys) {
        expect(result[key], isNotNull);
      }
      expect(result['happy'], isNull);
    });

    test('Should extract only required keys in a verbose payload.', () {
      Map detect = {
        'timestamp': 1461854345811,
        'resistance': 1145,
        'happy': true,
        'otherUnknown': 3893,
        'moreUnknowns': 'String'
      };
      SensorSpec gsrSensor =
          loadSensorSpec(Device.msBand2TestFakeMap, SensorType.galvanic);
      List keys = gsrSensor();
      Map result = signalFromMap(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      for (var key in keys) {
        expect(result[key], isNotNull);
      }
      expect(result[Gsr.datetime], equals(1461854345811),
          reason: 'Date stuffed');
      expect(result[Gsr.resistance], equals(1145),
          reason: 'Resistance stuffed');
      expect(result[Gsr.units], equals(SiUnits.ohmKilo),
          reason: 'Wrong unit of measure');
      expect(result.length, equals(5), reason: 'Too much in payload');
    });

    /// Null at this level and the sensor will have mark this as a bad reading.
    test("Should null the value if it is not in the detection payload.", () {
      Map detect = {'date': 1239420397, 'resistance': 892374, 'happy': true};
      SensorSpec gsrSensor =
          loadSensorSpec(Device.msBand2TestFakeMap, SensorType.galvanic);
      List keys = gsrSensor();
      Map result = signalFromMap(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      expect(result[Gsr.datetime], isNull);
      expect(result['happy'], isNull);
      expect(result.length, equals(5), reason: 'Too much in payload');
    });

    test("Should null all keys whos values can not be found in payload.", () {
      Map detect = {
        'Nothing': 1239420397,
        'Like': 892374,
        'described': true,
        'payload': "could be all out of shape"
      };
      SensorSpec gsrSensor =
          loadSensorSpec(Device.msBand2TestFakeMap, SensorType.galvanic);
      List keys = gsrSensor();
      Map result = signalFromMap(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      expect(result[Gsr.datetime], isNull);
      expect(result[Gsr.resistance], isNull);
      expect(result.length, equals(5), reason: 'Too much in payload');
    });

    test('Should break extracted just just handed a group of nulls.', () {
      Map detect = {'timestamp': null, null: null, 'resistance': null};
      SensorSpec gsrSensor =
          loadSensorSpec(Device.msBand2TestFakeMap, SensorType.galvanic);
      List keys = gsrSensor();
      Map result = signalFromMap(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      expect(result[Gsr.datetime], isNull);
      expect(result[Gsr.resistance], isNull);
      expect(result[Null], isNull);
      expect(result.length, equals(5), reason: 'Too much in payload');
    });

    test("Should return cirrectly no matter the positing or ordering.", () {
      Map detect = {
        'sometimes': 'crapgetsin',
        'changeswhere': true,
        'resistance': 892374,
        'data': false,
        'islocated': 02938923,
        'timestamp': 1239420397,
        'happy': false
      };
      SensorSpec gsrSensor =
          loadSensorSpec(Device.msBand2TestFakeMap, SensorType.galvanic);
      List keys = gsrSensor();
      Map result = signalFromMap(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      expect(result[Gsr.datetime], equals(1239420397));
      expect(result[Gsr.resistance], equals(892374));
      expect(result.length, equals(5), reason: 'Too much in payload');
    });
  });

  group("Extract singal from List:", () {
    test("Should extract the required keys", () {
      List detect = [
        178239,
        'Not thisone',
        'butthisone',
        false,
        'leaveit',
        999923
      ];
      SensorSpec gsrSensor =
          loadSensorSpec(Device.msBand2TestFakeList, SensorType.galvanic);
      List keys = gsrSensor();
      Map result = signalFromList(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      expect(result[Gsr.datetime], isNotNull);
      expect(result[Gsr.datetime], equals(178239));
      expect(result[Gsr.resistance], equals(999923));
    });

    test("Should null when there is no value is specificed positions", () {
      List detect = [
        null,
        'Not thisone',
        'butthisone',
        false,
        'leaveit',
        null,
      ];
      SensorSpec gsrSensor =
      loadSensorSpec(Device.msBand2TestFakeList, SensorType.galvanic);
      List keys = gsrSensor();
      Map result = signalFromList(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      expect(result[Gsr.datetime], isNull);
      expect(result[Gsr.resistance], isNull);
      expect(result[Gsr.units], equals(SiUnits.ohmKilo));
      expect(result[Gsr.frequency], equals(200));
      expect(result[Gsr.scale], equals(SiUnits.hertz));
    });

  });
}
