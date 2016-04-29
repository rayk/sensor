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
  SensorType.altimeter,
  Altimeter.values,
  SensorType.barometer,
  Barometer.values,
  SensorType.contact,
  Contact.values,
  SensorType.gyroscope,
  Gyroscope.values,
  SensorType.distance,
  Distance.values,
  SensorType.thermometerSkin,
  ThermometerSkin.values,
  SensorType.heart,
  Heart.values,
  SensorType.uv,
  Uv.values,
  SensorType.location,
  Location.values,
]);

/// Standardized Accelerometer Data Points.
enum Accelerometer {
  /// Date and Time the device collected the sample.
  datetime,

  /// Acceleration X
  x,

  /// Acceleration Y
  y,

  /// Acceleration Z
  z,

  /// The units used to measure acceleration
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Altimeter Data Points.
enum Altimeter {
  /// Date and Time the device collected the sample.
  datetime,
}

/// Standardized Barometer Data Points
enum Barometer {
  /// Date and Time the device collected the sample.
  datetime,

  /// Air pressure value
  pressure,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Barometer Data Points.
enum Contact {
  /// Date and Time the device collected the sample.
  datetime,

  /// Indication if there contact with the device.
  contact,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Gyroscope
enum Gyroscope {
  /// Date and Time the device collected the sample.
  datetime,

  /// Acceleration X
  accX,

  /// Acceleration Y
  accY,

  /// Acceleration Z
  accZ,

  /// Angular Velocity X
  angX,

  /// Angular Velocity Y
  angY,

  /// Angular Velocity Z
  angZ,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Distance Data Points.
enum Distance {
  /// Date and Time the device collected the sample.
  datetime,

  /// Motion Type
  motion,

  /// Pace
  pace,

  /// Speed
  speed,

  /// Distance Traveled
  distance,

  /// Pace Unit as in how they are measured
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Skin Temperature Data Point.
enum ThermometerSkin {
  /// Date and Time the device collected the sample.
  datetime,

  /// Temperature
  value,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Heart Rate Data Points.
enum Heart {
  /// Date and Time the device collected the sample.
  datetime,

  /// Standard heart rate.
  rate,

  /// Quality of the signal.
  quality,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Light Measure Data Points.
enum Light {
  /// Date and Time the device collected the sample.
  datetime,

  /// Light value.
  value,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Heart Beat Interval Data Points
enum Interval {
  /// Date and Time the device collected the sample.
  datetime,

  /// Heart Rate Interval.
  value,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
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

/// Standardized Ultraviolet Light Data Point.
enum Uv {
  /// Date and Time the device collected the sample.
  datetime,

  /// Heart Rate Interval.
  value,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Air Temperature Measures.
enum ThermometerAir {
  /// Date and Time the device collected the sample.
  datetime,

  /// Temperature
  value,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized Location Data Points
enum Location {
  /// Date and Time the device collected the sample.
  datetime,

  /// The locations latitude.
  latitude,

  /// The locations longitude
  longitude,

  /// The units used to measure the resistance.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}


