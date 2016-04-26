import 'package:test/test.dart';

import 'package:sensor/sensor.dart';

/// Sensort Intergration test
void main(){

  /// Input Parameters
  ///
  /// Where do we connect to?
  List firebaseDirectory = ['https://banddata.firebaseio.com', 'JL', 'gsr', 'XuHBWOngUKU0w7yKiueK3SqMd5bm6qhUumi70mlr'];

  /// Details about the sensor.
  Map sensorDetails = {
      SensorKey.type: SensorType.skin,
      SensorKey.period: 5,
      SensorKey.frequency: SIUnits.hertz,
      SensorKey.device: Device.msband2,
      SensorKey.subject: 'JL',
  }

  Map sensorOutput = {

  }


  group('Define a new sensor', (){
    test('Should return a sensor,', (){
      Sensor gsrTestSensor = new Sensor(fireBaseConnector, firebaseDirectory);

    });
  });

  group('Enable the Sensor',(){

  });

  group('Verify Sensor Output Readings',(){

  });

}
