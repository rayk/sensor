library sensor.api;

import 'dart:async';
import 'dart:developer';

import 'package:sensor/sensor.dart';
import 'package:sensor/src/configuration/sensor_config.dart';
import 'package:sensor/src/connectors/connectors.dart';
import 'package:sensor/src/sensor_signal.dart';

/// A sensor collects datums from a single source. The collected data is
/// not homogeneous and necessary part of the same data dimension. It just happens
/// to be from the same physical or logical sensor.

/// Namespace where all the functions of a sensor are assembled.
/// Takes a type of [Connector] to connect data projection in path, a [SignalDescriptor]
/// which describes the data projection and a SensorSignalFormat that describes
/// what the array would like return on the stream that is also provided.

class Sensor {
  bool _isRunning = false;
  DateTime _lastEmit;
  final Connection _connection;
  final DateTime _sensorStarted = new DateTime.now();
  final SensorSpec _sensorSpecification;
  final Sink _destination;
  int _emitCount = 1;
  Stream _dataProjection;
  StreamSubscription _subs;

  ///Constructor for a sensor passing in it's complete configuration.
  Sensor(this._connection, this._sensorSpecification, this._destination,
      {bool debug: false, String subject}) {
    debugger(when: debug, message: 'Debug Mode');
  }

  /// Kills this instance of the sensor.
  void kill() {
    if (_isRunning) {
      _subs.cancel();
      _destination.close();
    }
  }

  /// Pause the sensor from detecting.
  void pause() {}

  /// Start or restart after a pause the sensor detecting for the defined data projection.
  bool start() {
    if (!_isRunning) {
      _isRunning = true;
      log('Commencing to listen to dataProjection');

      _dataProjection = _connection();
      _dataProjection.listen((detection) {
        _process(detection);
      });
    }
    return _isRunning;
  }

  void _dispatch(Map signal) {
    _lastEmit = new DateTime.now();
    _emitCount++;
    _destination.add(signal);
  }

  /// Process what ever has been received and does it's best to form
  /// a valid SensorSignal.
  void _process(detection) {
    Map sensorSignal = new Map();
    List keyList = _sensorSpecification();
    assert(keyList.isNotEmpty);
    assert(detection != null);

    _lastEmit ??= new DateTime.now();

    Function extractor = _sensorSpecification(key: Extract.strategy);

    sensorSignal = extractor(detection, keyList, _sensorSpecification);
    assert(sensorSignal.isNotEmpty);

    sensorSignal[SensorSignal.datetime] = new DateTime.now();
    sensorSignal[SensorSignal.sequence] = _emitCount;
    sensorSignal[SensorSignal.last] = _lastEmit;
    sensorSignal[SensorSignal.rate] =
        new DateTime.now().difference(_sensorStarted).inMilliseconds /
            _emitCount;
    _dispatch(sensorSignal);
  }
}
