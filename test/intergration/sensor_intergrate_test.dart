import 'package:test/test.dart';
import 'dart:async';
import 'package:sensor/sensor.dart';

/// Sensor Integration Test
main()async{

  /// Input Parameters
  ///
  /// Where do we connect to?
  List fireBaseDirectory = ['https://banddata.firebaseio.com', 'JL', 'gsr', 'XuHBWOngUKU0w7yKiueK3SqMd5bm6qhUumi70mlr'];
  Connection fbConnection = await fireBaseConnector(fireBaseDirectory);
  SensorSpec gsrSensor = loadSensorSpec(Device.msBand2Fire, SensorType.galvanic);
  StreamController sc = new StreamController();

  group('New Sensor:', (){
    test('Should return a sensor', (){
      Sensor gsrTestSensor = new Sensor(fbConnection,gsrSensor,sc.sink);
      expect(gsrTestSensor, isNotNull);
    });

    test("Should return true when sensor start.",(){
      Sensor gsrTestSensor = new Sensor(fbConnection,gsrSensor,sc.sink);
      expect(gsrTestSensor.start(), isTrue);
    });

    test("Should return sensor signal on provided streams.",()async{
      Connection fbCon2 = await fireBaseConnector(fireBaseDirectory);
      SensorSpec gsrSensor = loadSensorSpec(Device.msBand2Fire, SensorType.galvanic);
      StreamController testStream = new StreamController();
      Sensor gsrTestSensor = new Sensor(fbCon2,gsrSensor,testStream.sink, debug: false);
      testStream.stream.listen(expectAsync((Map sig){
        expect(sig[SensorSignal.datetime], isNotNull, reason:'Date:${sig.toString()}');
        expect(sig[SensorSignal.sequence], isNotNull, reason:'Seq:${sig.toString()}');
        expect(sig[SensorSignal.last], isNotNull, reason:'Last:${sig.toString()}');
        expect(sig[SensorSignal.rate], isNotNull, reason:'Rate:${sig.toString()}');
      }, max: 5000));

      gsrTestSensor.start();
    });

  });


}
