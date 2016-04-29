part of sensor_configuration;

/// International Standard Units bases and variations. Again very stable and
/// should not need to for functional reasons.

enum SiUnits {
  /// Beats Per Minute
  beatsPerMinute,

  /// Binary used when a measure of on or Off
  binary,

  ///
  calorie,

  ///
  calorieKilo,

  /// Temperature
  celsius,

  /// Measure unit of noise.
  decibel,

  /// Measure of velocity
  degreesPerSec,

  /// Measure unit of Frequency Units
  hertz,

  /// Measure unit of Frequency at a multiple factor of 10 to the 3rd.
  hertzKilo,

  /// Measure unit of Frequency at a multiple factor of 10 to the sixth.
  hertzMega,

  /// Measure unit of Frequency at a fraction factor of 10 to the minus sixth.
  hertzMicro,

  /// Measure unit of Frequency at a fraction factor of 10 to the minus three.
  hertzMilli,

  /// illuminance units lx
  lux,

  /// Measure unit of Length at a fraction factor of 10 to the minus three.
  metermilli,

  /// Measure of a unit of acceleration
  meterPerSecondSquared,

  /// Length units
  meters,

  /// Measure unit of Length at a fraction factor of 10 to the minus two.
  meterscenti,

  /// Unit measure of acceleration
  centimetersPerMinute,

  /// Measure unit of Length at a multiple factor of 10 to the 3rd.
  metersKilo,

  /// Measure unit of electrical resistance.
  ohm,

  /// Measure unit of electrical resistance at a multiple factor of 10 to the 3rd.
  ohmKilo,

  /// Measure unit of electrical resistance at a fraction factor of 10 to the minus three.
  ohmMilli,

  /// Measure unit of pressure
  pascal,

  /// Measure unit of pressure at a multiple factor of 10 to the second.
  pascalHecto,

  /// Unit of Angular Measure
  radian,

  /// Unit measure of time.
  seconds,

  /// Unit measure of time at a fraction factor of 10 to the minus sixth..
  secondsMicro,

  /// Unit measure of time to a fraction factor of 10 to the minus three.
  secondsMilli,

  /// Unit measure of power.
  watts,

  /// Unit measure of power to a fraction factor of 10 to the minus three.
  wattsMilli,

  /// Unit of measure of UV light.
  waveLength,
}