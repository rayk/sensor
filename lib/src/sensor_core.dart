library sensor.api;

import 'dart:async';
import 'dart:developer';

import 'package:sensor/sensor.dart';
import 'package:sensor/src/configuration/sensor_config.dart';
import 'package:sensor/src/connectors/connectors.dart';
import 'package:sensor/src/sensor_signal.dart';
import 'package:sensor/src/tranformers/package_sensor_signal.dart';

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

  /// Returned from connector to the source.
  final DateTime _sensorStarted = new DateTime.now();
  final SensorSpec _sensorSpecification; //Customisation for the device/sensor
  final Sink _destination; // Where we sending the sensor signal.
  int _emitCount = 0; // How Many Signal has this sensor sent
  Stream _dataProjection; // Data from the source
  StreamSubscription _subs; // Our subscription from the data projection.
  Function _extractor; // Function to extract signal from incoming data.
  List _sensorSignalKeys; // Required Keys for the sensor signal output.

  ///Constructor for a sensor passing in it's complete configuration.
  Sensor(this._connection, this._sensorSpecification, this._destination,
      {bool debug: false, String subject}) {
    debugger(when: debug, message: 'Debug Mode');
    _extractor = _sensorSpecification(key: Extract.strategy);
    assert(_extractor is Function);
    _sensorSignalKeys = _sensorSpecification();
    assert(_sensorSignalKeys.isNotEmpty);
  }

  /// Returns bool with the running state of the sensor
  bool get state => _isRunning;

  /// Kills this instance of the sensor.
  void kill() {
    if (_isRunning) {
      _subs.cancel();
      _isRunning = false;
      _destination.close();
    }
  }

  /// Pause the sensor from detecting.
  void pause() {}

  /// Start or restart after a pause the sensor detecting for the defined data projection.
  bool start() {
    if (!_isRunning) {
      _isRunning = true;
      _destination.add(protoMsgSensorStart);
      _lastEmit = new DateTime.now();
      _emitCount++;
      _dataProjection = _connection();
      _subs = _dataProjection.listen((detection) {
        _process(detection);
      });
    }
    return _isRunning;
  }

  /// Calculates the emission rate based on the current state of the
  /// sensor. Duration the sensor has been online divided by the number
  /// of emission made in that time.
  double _calculateEmitRate() {
    double result;
    Duration elapsed = new DateTime.now().difference(_sensorStarted);
    result = (elapsed.inMilliseconds/_emitCount);
    assert(!result.isNegative);
    return result;
  }

  /// Dispatches the sensor signal to the consumer at destination.
  void _dispatch(Map signal) {
    signal[SensorSignal.last] = _lastEmit;
    signal[SensorSignal.sequence] = _emitCount;
    signal[SensorSignal.rate] = _calculateEmitRate();
    _lastEmit = new DateTime.now();
    _destination.add(signal);
  }

  /// Process what ever has been received and does it's best to form
  /// a valid SensorSignal.
  Future<bool> _process(detection) async {
    assert(detection != null);
    Map _rawSignal = new Map();

    _rawSignal = _extractor(detection, _sensorSignalKeys, _sensorSpecification);
    assert(_rawSignal.isNotEmpty);

    List<Map> dispatchableSignal = packageRawSignal(_rawSignal);

    for (Map signal in dispatchableSignal) {
      _dispatch(signal);
    }

    return true;
  }
}
