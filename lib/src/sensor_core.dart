library sensor.api;

import 'dart:async';
import 'dart:developer';

import 'package:sensor/sensor.dart';
import 'package:sensor/src/connectors/connectors.dart';
import 'package:sensor/src/sensor_config.dart';
import 'package:sensor/src/sensor_signal.dart';


/// A sensor collects datums from a single source. The collected data is
/// not homegenous and nessary part of the same data demension. It just happens
/// to be from the same phyiscal or logical sensor.

/// Namespace where all the functions of a sensor are assembleed.
/// Takes a type of [Connector] to connect data projection in path, a [SignalDescriptor]
/// which describes the data projection and a SensorSignalFormat that describes
/// what the array would like return on the stream that is also provided.

class Sensor {
  bool _isRunning = false;
  DateTime _lastemmission;
  final Connection _connection;
  final DateTime _sensorStarted = new DateTime.now();
  final SensorSpec _sensorSpecification;
  final Sink _distination;
  int _emmissionCounter = 0;
  Stream _dataProjection;
  StreamSubscription _subs;

  ///Constructor for a sensor passing in it's complete configuration.
  Sensor(this._connection, this._sensorSpecification, this._distination) {
    _dataProjection = _connection();
  }

  /// Premently kills this instance of the sensor.
  void kill() {
    if(_isRunning){
      _subs.cancel();
      _distination.close();
    }
  }

  /// Pause the sensor from detecting.
  void pause() {

  }

  /// Start or restart after a pause the sensor detecting for the defined data projection.
  bool start(){
    if(!_isRunning){
      _isRunning = true;
      _subs = _dataProjection.listen((detection){

      });
    }
    return _isRunning;
  }

  /// Process what ever has been received and does it's best to form
  /// a valid SensorSingal.
  Map _process(detection){
    Map sensorSignal = new Map();
    List keyList = _sensorSpecification();
    assert(keyList.isNotEmpty);

    Function extractor = _sensorSpecification(key:Extract.strategy);

    sensorSignal = extractor(detection, keyList, _sensorSpecification);

    if(sensorSignal.containsValue(null)){
      log('Bad record..');
    } else {
      sensorSignal[SensorSignal.datetime] = new DateTime.now();
      sensorSignal[SensorSignal.sequence] = _emmissionCounter;
      sensorSignal[SensorSignal.last] = _lastemmission;
      sensorSignal[SensorSignal.rate] = _emmissionCounter / _sensorStarted.difference(new DateTime.now()).inMilliseconds;
      _dispatch(sensorSignal);
    }


  }

  void _dispatch(Map signal){
    _distination.add(signal);
    _lastemmission = new DateTime.now();
    _emmissionCounter++;
  }


}
