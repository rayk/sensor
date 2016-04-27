/// Inventory of the standard data values required for particular [SensorTypes].
/// these are all independent from of specific sensors. The keys in each
/// enumeration will be extract from the sensor data or custom lookup map
/// configuration of a the [SensorType] on a given [Device].
part of sensor_configuration;

/// Given the [SensorType] this maps to the standard keys/data expected from that
/// sensor. Data Variations between similar sensor types can be handled by additional
/// SensorType only if it's values can not be harmonised into the the existing definitions.
const LookupMap sensorDataValues = const LookupMap(const [
  SensorType.accelerometer,
  Accelerometer.values,
  SensorType.galvanic,
  Gsr.values,
]);

enum Accelerometer {
  //
  x,
  //
  y,
}


/// Standardized Galvanic Skin Response Required Data Points.
enum Gsr {
  /// Data and Time the device collected the sample.
  datetime,

  /// Value of the GSR reading.
  resistance,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}