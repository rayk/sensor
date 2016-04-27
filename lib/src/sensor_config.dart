/// Contains the constant configuration for all the sensors.
library sensor_configuration;

import 'package:lookup_map/lookup_map.dart';

/// Lookup for devices.
const LookupMap deviceSensors = const LookupMap(const [], const [
  const LookupMap.pair(Device.msBand2Fire, smBand2Fire),
  const LookupMap.pair(Device.msBand2Stream, smBand2Stream)
]);

/// Sensor Schema specificly for Microsoft Band 2 data beind extracted
/// from fire base.
const LookupMap smBand2Fire = const LookupMap(
    const [], const [const LookupMap.pair(SensorType.galvanic, smband2Gsr),]);

const LookupMap smBand2Stream = const LookupMap(
    const [], const [const LookupMap.pair(SensorType.galvanic, smband2GsrST)]);


/// Test Configuration.
const LookupMap smband2GsrST = const LookupMap(const [
  Gsr.datetime,
  const [0],
  Gsr.resistence,
  const [5],
  Gsr.units,
  SiUnits.ohmKilo,
  Gsr.frequency,
  200,
  Gsr.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromList,
]);

/// Gsr Particulars for Microsoft Band 2.
const LookupMap smband2Gsr = const LookupMap(const [
  Gsr.datetime,
  "timestamp",
  Gsr.resistence,
  "resistence",
  Gsr.units,
  SiUnits.ohmKilo,
  Gsr.frequency,
  200,
  Gsr.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap sensorKeyMap = const LookupMap(const [
  SensorType.accelerometer,
  Accelerometer.values,
  SensorType.galvanic,
  Gsr.values,
]);

/// Returns the specific value for the required sensor on the request device.
SensorSpec sensorSpecFinder(Device device, SensorType sensor) {
  LookupMap d = deviceSensors[device];
  LookupMap s = d[sensor];
  List sensorKeyList = sensorKeyMap[sensor];

  /// Closure that answser questions about the sensor specification.
  /// all the routing an cross look is done here. All it without
  /// parameters returns a list of all the keys available
  get({key}) {
    return key == null ? sensorKeyList : s[key];
  }

  return get;
}

/// Returns a sensor specification for the given [SensorType] on the given [Device]
typedef SensorSpec SensorSpecFinder(Device device, SensorType sensor);

/// Specific keys for a particular sensor configuration.
typedef SensorSpec({key});

/// Enumeration indicates what to expect from the connector.
enum Format { list, map, }
enum Extract { strategy, }

/// Enumeration of supportted devices.
enum Device {
  /// Microsoft Band 2 Live Stream.
  msband2Live,

  /// Microsoft Band 2 Firebase Stream.
  msBand2Fire,

  /// Nexus 6 Live Stream
  nexus6Live,

  /// Nexus 6 Firebase Stream.
  nexus6Fire,

  /// Testing Banding
  msBand2Stream,
}

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
  resistence,

  /// The units used to measure the resistence.
  units,

  /// Frequency at which this being sampled.
  frequency,

  /// Unit scale of the frequency.
  scale,
}

/// Standardized enumeration of sensor types
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

Function signalFromMap() {
  Map result = new Map();

  Map extract(Map detection, List requiredAttributes, Function mapLookUp) {
    for (var attribs in requiredAttributes) {
      var one = mapLookUp(key: attribs);
      if (one is String) {
        var value = detection[one];
        result[attribs] = value;
      } else {
        result[attribs] = one;
      }
    }
    return result;
  }
  return extract;
}

Function signalFromList() {
  Map result = new Map();

  Map extract(List detection, List requiredAttributes, Function mapLookup) {
    for (var attribs in requiredAttributes) {
      var one = mapLookup(key: attribs);
      if (one is List<int>) {
        var value = detection[one.first];
        result[attribs] = value;
      } else {
        result[attribs] = one;
      }
    }
    return result;
  }
  return extract;
}
