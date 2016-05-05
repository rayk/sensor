/// Defines the sensor signal the Sensor Array understands.
library sensor_signal;


/// Highest level enums for the sensor signal
enum SensorSignal{
  /// Datetime this signal was prepared for the array. Not the detected time
  datetime,
  /// the raw sequence number of this signal
  sequence,
  /// Specific date time the last signal was sent from this sensor.
  last,
  /// what is the current rate at which this signal is being emitting signals.
  rate,
  /// An optional identifier provided by the array that linked to emitted signal.
  subject,
  /// Type of sensor signal, align to the signal type inventory
  type,
}

/// SignalProtocol are used to inform the listener about sensor
/// operational events. These are generic across all sensor type
/// and always comprise a pair of values. The first one the key is
/// is of type [SignalProtocol] and the second the value of type [ProtoValue].
enum SignalProtocol{
  /// Message Type
  type,
  /// Priority of message
  priority,
  /// Subject of the message
  subject,
  /// Source Sensor
  sensor,
  /// Source Device
  device,
}

/// The value element of a protocol message.
enum ProtoValue{
  /// Indicates this is a Protocol Signal.
  protocolSignal,

  /// Sensor Started Event
  sensorStarted,

  /// Sensor Paused Event
  sensorPaused,

  /// Sensor has been killed.
  sensorTerminated,

  /// Lowest level priority
  informational,

  /// Mid level priority, unusual no operational integrity threat.
  abnormally,

  /// Highest level priority
  investigate,
}

/// Short hand message indicating the sensor has started.
Map protoMsgSensorStart ={
  SignalProtocol.type:ProtoValue.protocolSignal,
  SignalProtocol.priority:ProtoValue.informational,
  SignalProtocol.subject:ProtoValue.sensorStarted,
};
