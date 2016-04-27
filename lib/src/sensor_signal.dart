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
  /// what is the current rate at which this signal is being emmitting signals.
  rate,
  /// An optional identifier provided by the arrary that linked to emitted signal.
  subject,
}
