/// Contains the constant configuration for all the sensors.
library sensor_configuration;

import 'package:lookup_map/lookup_map.dart';

/// Standardized enumeration of sensor types
enum SensorType{
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
  /// Measures heart period variablity.
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
/// International Standard Units base and derived.
enum SiUnits {
  /// Beats Per Minute
  beatsPerMinute,
  ///
  calorie,
  ///
  calorieKilo,
  /// Temperature
  celsius,
  /// Meausre unit of Frequency Units
  hertz,
  /// Measure unit of Frequency at a multiple factor of 10 to the thrid.
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
  /// Measure unit of Length at a multiple factor of 10 to the thrid.
  metersKilo,
  /// Measure unit of electrical resistence.
  ohm,
  /// Measure unit of electrical resistence at a multiple factor of 10 to the thrid.
  ohmKilo,
  /// Measure unit of electrical resistence at a fraction factor of 10 to the minus three.
  ohmMilli,
  /// Measure unit of pressure
  pascal,
  /// Measure unit of pressure at a multiple factor of 10 to the second.
  pascalHecto,
  ///
  radian,
  /// Unit measure of time.
  seconds,
  /// Unit measure of time at a fraction factor of 10 to the minus sixth..
  secondsMicro,
  /// Unit mesasure of time to a fraction factor of 10 to the minus three.
  secondsMilli,
  /// Unit measure of power.
  watts,
  /// Unit mesure of power to a fraction factor of 10 to the minus three.
  wattsMilli,
}

/// Standardized Galvanic Skin Response Required Data Points.
enum Gsr{
  /// Data and Time the device collected the sample.
  datetime,
  /// Value of the GSR reading.
  resistence,
  /// The units used to measure the resistence.
  units,
  /// Frequency at which this being sampled.
  frequency,
  /// Unit scale of the frequency.
  scale,

}

/// Enumeration of supportted devices.
enum Device{
  /// Microsoft Band 2 Live Stream.
  msband2Live,
  /// Microsoft Band 2 Firebase Stream.
  msBand2Fire,
  /// Nexus 6 Live Stream
  nexus6Live,
  /// Nexus 6 Firebase Stream.
  nexus6Fire,
}


/// Lookup for devices.
const LookupMap deviceSensors = const LookupMap(const[], const[
  const LookupMap.pair(Device.msBand2Fire, smBand2Fire),
]);

/// Sensor Schema specificly for Microsoft Band 2 data beind extracted
/// from fire base.
const LookupMap smBand2Fire = const LookupMap(const[], const[
  const LookupMap.pair(SensorType.galvanic, smband2Gsr),
]);

/// Gsr Particulars for Microsoft Band 2.
const LookupMap smband2Gsr = const LookupMap(const[
  Gsr.datetime, "timestamp",
  Gsr.resistence, "resistence",
  Gsr.units, SiUnits.ohmKilo,
  Gsr.frequency, "200",
  Gsr.scale, SiUnits.hertz,
]);
