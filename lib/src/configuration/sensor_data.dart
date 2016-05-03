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
  /// Date and Time the device collected the sample. (13 bytes)
  datetime,

  /// Acceleration X (15 bytes)
  x,

  /// Acceleration Y (15 bytes)
  y,

  /// Acceleration Z (15 bytes)
  z,

  /// The units used to measure acceleration (4 bytes)
  units,

  /// Frequency at which this being sampled.(4 bytes)
  frequency,

  /// Unit scale of the frequency. (4 bytes)
  scale,
}

/// Standardized Altimeter Data Points.
enum Altimeter {
  /// Date and Time the device collected the sample.
  datetime,
}

/// Standardized Barometer Data Points
enum Barometer {
  /// Date and Time the device collected the sample. (13 bytes)
  datetime,

  /// Air pressure value (18 bytes)
  pressure,

  /// The units used to measure the resistance. (4 bytes)
  units,

  /// Frequency at which this being sampled. (4 bytes)
  frequency,

  /// Unit scale of the frequency.(4 bytes)
  scale,
}

/// Standardized Barometer Data Points.
enum Contact {
  /// Date and Time the device collected the sample.(13 bytes)
  datetime,

  /// Indication if there contact with the device. (10 Bytes)
  contact,

  /// The units used to measure the resistance.(4 bytes)
  units,

  /// Frequency at which this being sampled.(4 bytes)
  frequency,

  /// Unit scale of the frequency.(4 bytes)
  scale,
}

/// Standardized Gyroscope
enum Gyroscope {
  /// Date and Time the device collected the sample. (13 bytes)
  datetime,

  /// Acceleration X (18 bytes)
  accX,

  /// Acceleration Y (18 bytes)
  accY,

  /// Acceleration Z (18 bytes)
  accZ,

  /// Angular Velocity X (22 bytes)
  angX,

  /// Angular Velocity Y (22 bytes)
  angY,

  /// Angular Velocity Z (22 bytes)
  angZ,

  /// The units used to measure the resistance. (4 bytes)
  units,

  /// Frequency at which this being sampled. (4 bytes)
  frequency,

  /// Unit scale of the frequency. (4 bytes)
  scale,
}

/// Standardized Distance Data Points.
enum Distance {
  /// Date and Time the device collected the sample.(13 bytes)
  datetime,

  /// Motion Type (10 bytes)
  motion,

  /// Pace (7 bytes)
  pace,

  /// Speed  (7 bytes)
  speed,

  /// Distance Traveled (10 bytes)
  distance,

  /// Pace Unit as in how they are measured (4 bytes)
  units,

  /// Frequency at which this being sampled. (4 bytes)
  frequency,

  /// Unit scale of the frequency. (4 bytes)
  scale,
}

/// Standardized Skin Temperature Data Point.
enum ThermometerSkin {
  /// Date and Time the device collected the sample. (13 bytes)
  datetime,

  /// Temperature (18 bytes)
  value,

  /// The units used to measure the resistance.(4 bytes)
  units,

  /// Frequency at which this being sampled.(4 bytes)
  frequency,

  /// Unit scale of the frequency.(4 bytes)
  scale,
}

/// Standardized Heart Rate Data Points.
enum Heart {
  /// Date and Time the device collected the sample. (13 bytes)
  datetime,

  /// Standard heart rate. (4 bytes)
  rate,

  /// Quality of the signal. (7 bytes)
  quality,

  /// The units used to measure the resistance.(4 bytes)
  units,

  /// Frequency at which this being sampled.(4 bytes)
  frequency,

  /// Unit scale of the frequency.(4 bytes)
  scale,
}

/// Standardized Light Measure Data Points.
enum Light {
  /// Date and Time the device collected the sample.(13 bytes)
  datetime,

  /// Light value. (3 bytes)
  value,

  /// The units used to measure the resistance.(4 bytes)
  units,

  /// Frequency at which this being sampled.(4 bytes)
  frequency,

  /// Unit scale of the frequency.(4 bytes)
  scale,
}

/// Standardized Heart Beat Interval Data Points
enum Interval {
  /// Date and Time the device collected the sample. (13 bytes)
  datetime,

  /// Heart Rate Interval. (8 bytes)
  value,

  /// The units used to measure the resistance.(4 bytes)
  units,

  /// Frequency at which this being sampled.(4 bytes)
  frequency,

  /// Unit scale of the frequency.(4 bytes)
  scale,
}

/// Standardized Galvanic Skin Response Required Data Points.
enum Gsr {
  /// Data and Time the device collected the sample.(13 bytes)
  datetime,

  /// Value of the GSR reading. (6 bytes)
  resistance,

  /// The units used to measure the resistance.(4 bytes)
  units,

  /// Frequency at which this being sampled.(4 bytes)
  frequency,

  /// Unit scale of the frequency.(4 bytes)
  scale,
}

/// Standardized Ultraviolet Light Data Point.
enum Uv {
  /// Date and Time the device collected the sample.(13 bytes)
  datetime,

  /// Uv Exposure. (2 bytes)
  value,

  /// The units used to measure the resistance. (4 bytes)
  units,

  /// Frequency at which this being sampled.(4 bytes)
  frequency,

  /// Unit scale of the frequency.(4 bytes)
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


