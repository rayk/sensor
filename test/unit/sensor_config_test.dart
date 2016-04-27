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

  group('Lookup using the descriptor function.', () {
    test("Should get Gsr key for data and Time", () {
      SensorSpec gsrSensor =
          sensorSpecFinder(Device.msBand2Fire, SensorType.galvanic);
      expect(gsrSensor(key:Gsr.datetime), equals('timestamp'));
      expect(gsrSensor(key:Gsr.frequency), equals(200));
    });

    test("Should provide a list of all the keys for the configuration.",(){
      SensorSpec gsrSensor = sensorSpecFinder(Device.msBand2Fire, SensorType.galvanic);
      expect(gsrSensor() is List, isTrue);
      List keys = gsrSensor();
      expect(keys, contains(Gsr.datetime));
      expect(keys, contains(Gsr.resistence));
      expect(keys, contains(Gsr.units));
      expect(keys, contains(Gsr.frequency));
      expect(keys, contains(Gsr.scale));
    });

    test("Should determine an extraction process.",(){
      SensorSpec gsrSensor = sensorSpecFinder(Device.msBand2Fire, SensorType.galvanic);
      expect(gsrSensor() is List, isTrue);
    });

    //test("Should Error out when asking for nonexisten attribute.", () {
      //SensorSpec gsrSensor =
        //  sensorSpecFinder(Device.msBand2Fire, SensorType.galvanic);
    //  expect(()=>gsrSensor(key:Gsr.rawFormat), throwsArgumentError);
    //});
  });

  group('Signal from Map function',(){

    test('Should extract only requested keys extracting ',(){
      Map detect = {'timestamp':1239420397, 'resistence': 892374, 'happy':true};
      SensorSpec gsrSensor = sensorSpecFinder(Device.msBand2Fire, SensorType.galvanic);
      List keys = gsrSensor();
      Function enclose = signalFromMap();
      Map result = enclose(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      for (var key in keys){
        expect(result[key], isNotNull);
      }
      expect(result['happy'], isNull);
    });

    /// Nulling at this level and the sensor will have have this as a bad reading.
    test("Should null the value if it is not in the detection",(){
      Map detect = {'date':1239420397, 'resistence': 892374, 'happy':true};
      SensorSpec gsrSensor = sensorSpecFinder(Device.msBand2Fire, SensorType.galvanic);
      List keys = gsrSensor();
      Function enclose = signalFromMap();
      Map result = enclose(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      expect(result[Gsr.datetime], isNull);
      expect(result['happy'], isNull);
    });

  });


  group("Signal from List Function",(){
    test("Should extract the required keys",(){
      List detect = [178239, 'Not thisone', 'butthisone', false, 'leaveit', 999923];
      SensorSpec gsrSensor = sensorSpecFinder(Device.msBand2Stream, SensorType.galvanic);
      List keys = gsrSensor();
      Function enclose = signalFromList();
      Map result = enclose(detect, keys, gsrSensor);
      expect(result.isNotEmpty, isTrue);
      expect(result[Gsr.datetime], isNotNull);
      expect(result[Gsr.datetime], equals(178239));
      expect(result[Gsr.resistence], equals(999923));
    });


  });
}
