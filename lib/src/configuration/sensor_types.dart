part of sensor_configuration;

/// Standardized enumeration of sensor types. The types are very stable different
/// instances of sensors may operate differently and have different implementations
/// this list represents the current universe of known sensors.

enum SensorType {
  /// Measures the acceleration of a moving or vibrating body.
  accelerometer,

  /// Measures altitude of a body
  altimeter,

  /// Measures measure atmospheric pressure.
  barometer,

  /// Contact sensor, that indicates if a contact with a body.
  contact,

  /// Measure of distance travelled.
  distance,

  /// Measure of autonomic nerve responses as parameter of sweat gland function.
  galvanic,

  /// Gravity centric movement across X,Y,Z with angle.
  gyroscope,

  /// Measure of heart rate.
  heart,

  /// Measures heart period variability.
  interval,

  /// Measures ambient light.
  light,

  /// Positioning of Latitude and Longitude.
  location,

  /// Measure of noise exposure.
  doseMeter,

  /// Measure of steps taken.
  pedometer,

  /// Measure air temperature.
  thermometerAir,

  /// Measure skin temperature.
  thermometerSkin,

  /// Measure Ultraviolet light.
  uv,
}