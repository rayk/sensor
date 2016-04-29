import 'package:test/test.dart';
import 'dart:async';
import 'package:sensor/sensor.dart';
import 'package:sensor/src/configuration/sensor_config.dart';

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

    test('Should return a new sensor.', (){
      Sensor gsrTestSensor = new Sensor(fbConnection,gsrSensor,sc.sink);
      expect(gsrTestSensor, isNotNull, reason: 'No Sensor');
      expect(gsrTestSensor.state, isFalse);
    });

    test("Should return stream a protocol signal indicatoring the sensor started.",(){
      StreamController sc2 = new StreamController();
      Sensor gsrTestSensor = new Sensor(fbConnection,gsrSensor,sc2.sink);
      expect(gsrTestSensor.start(), isTrue);
      sc2.stream.listen(expectAsync((Map msg){

        expect(msg[SignalProtocol.type], equals(ProtoValue.protocolSignal));
        expect(msg[SignalProtocol.priority], equals(ProtoValue.informational));
        expect(msg[SignalProtocol.subject], equals(ProtoValue.sensorStarted));

      }, count: 1));
      expect(gsrTestSensor.state, isTrue, reason: 'Should be in a running state');
      gsrTestSensor.kill();
      expect(gsrTestSensor.state, isFalse, reason:'It has been terminated after test');
    });

    test("Should return sensor signal on provided streams.",()async{
      Connection fbCon2 = await fireBaseConnector(fireBaseDirectory);
      SensorSpec gsrSensor = loadSensorSpec(Device.msBand2Fire, SensorType.galvanic);
      StreamController testStream = new StreamController();
      Sensor gsrTestSensor = new Sensor(fbCon2,gsrSensor,testStream.sink, debug: false);

      testStream.stream.listen(expectAsync((Map sig){

        if(sig[SignalProtocol.type]  == ProtoValue.protocolSignal){
          print('Sensor Start Message Receive!');
          expect(sig[SignalProtocol.type], equals(ProtoValue.protocolSignal), reason: 'Protocol Start Msg Fail - Type');
          expect(sig[SignalProtocol.priority], equals(ProtoValue.informational), reason: 'Protocol Start Msg Fail - priority');
          expect(sig[SignalProtocol.subject], equals(ProtoValue.sensorStarted), reason: 'Protocol Start Msg Fail - subject');
        }

        if(sig[SensorSignal.type] is Gsr){
          print('Got a gsr message');
        }


      }, max: 5000));

      gsrTestSensor.start();
      expect(gsrTestSensor.state, isTrue, reason:"Sensor does not appear to run");
    });

  });


}
