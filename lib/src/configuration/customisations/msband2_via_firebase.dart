part of sensor_configuration;

/// Custom Sensor Schema specifically for Microsoft Band 2 data being extracted
/// from fire base.
const LookupMap msBand2FireManifest = const LookupMap(const [], const [
  const LookupMap.pair(SensorType.galvanic, gsrOnMsBand2ViaFireBase),
  const LookupMap.pair(SensorType.accelerometer, accelOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.barometer, baroOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.contact, contactOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.distance, distanceOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.gyroscope, gyroOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.heart, heartOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.light, lightOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.interval, intervalOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.thermometerSkin, skinOnMsBand2ViaFire),
  const LookupMap.pair(SensorType.uv, uvOnMsBand2ViaFire),
]);

/// Lowest level customisation of GSR data coming in and what will be looked
/// for when attempt to put together a sensor signal map for a GSR reading.
const LookupMap gsrOnMsBand2ViaFireBase = const LookupMap(const [
  Gsr.datetime,
  "timestamp",
  Gsr.resistance,
  "resistance",
  Gsr.units,
  SiUnits.ohmKilo,
  Gsr.frequency,
  200,
  Gsr.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);

/// Accelerometer readings from MsBands2 via fileBase
const LookupMap accelOnMsBand2ViaFire = const LookupMap(const [
  Accelerometer.datetime,
  "timestamp",
  Accelerometer.x,
  'accelerationX',
  Accelerometer.y,
  'accelerationY',
  Accelerometer.z,
  'accelerationZ',
  Extract.strategy,
  Accelerometer.units,
  SiUnits.meterPerSecondSquared,
  Accelerometer.frequency,
  8,
  Accelerometer.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap baroOnMsBand2ViaFire = const LookupMap(const [
  Barometer.datetime,
  'timeStamp',
  Barometer.pressure,
  'airPressure',
  Barometer.units,
  SiUnits.pascalHecto,
  ThermometerAir.datetime,
  'timeStamp',
  ThermometerAir.value,
  'temperature',
  ThermometerAir.units,
  SiUnits.celsius,
  Barometer.frequency,
  1,
  Barometer.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap contactOnMsBand2ViaFire = const LookupMap(const [
  Contact.datetime,
  'timestamp',
  Contact.contact,
  'contact',
  Contact.units,
  SiUnits.binary,
  Contact.frequency,
  0,
  Contact.scale,
  SiUnits.binary,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap distanceOnMsBand2ViaFire = const LookupMap(const [
  Distance.datetime,
  "timestamp",
  Distance.motion,
  'motionType',
  Distance.speed,
  'speed',
  Distance.pace,
  'pace',
  Distance.distance,
  'distanceToday',
  Distance.units,
  SiUnits.centimetersPerMinute,
  Distance.frequency,
  1,
  Distance.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap gyroOnMsBand2ViaFire = const LookupMap(const [
  Gyroscope.datetime,
  "timestamp",
  Gyroscope.accX,
  'accelerationX',
  Gyroscope.accY,
  'accelerationY',
  Gyroscope.accZ,
  'accelerationZ',
  Gyroscope.angX,
  'angularVelocityX',
  Gyroscope.angY,
  'angularVelocityY',
  Gyroscope.angZ,
  'angularVelocity',
  Gyroscope.units,
  SiUnits.degreesPerSec,
  Gyroscope.frequency,
  8,
  Gyroscope.units,
  SiUnits.degreesPerSec,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap heartOnMsBand2ViaFire = const LookupMap(const [
  Heart.datetime,
  'timestamp',
  Heart.rate,
  'heartRate',
  Heart.units,
  SiUnits.beatsPerMinute,
  Heart.quality,
  'qua;ity',
  Heart.frequency,
  1,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap lightOnMsBand2ViaFire = const LookupMap(const [
  Light.datetime,
  'timestamp',
  Light.units,
  SiUnits.lux,
  Light.value,
  'brightness',
  Light.frequency,
  2,
  Light.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap intervalOnMsBand2ViaFire = const LookupMap(const [
  Interval.datetime,
  'timestamp',
  Interval.value,
  'interval',
  Interval.units,
  SiUnits.seconds,
  Interval.frequency,
  0,
  Interval.scale,
  0,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap skinOnMsBand2ViaFire = const LookupMap(const [
  ThermometerSkin.datetime,
  'timestamp',
  ThermometerSkin.value,
  'temperature',
  ThermometerSkin.units,
  SiUnits.celsius,
  ThermometerSkin.frequency,
  1,
  ThermometerSkin.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);

const LookupMap uvOnMsBand2ViaFire = const LookupMap(const [
  Uv.datetime,
  'timeStamp',
  Uv.value,
  'uvExposureToday',
  Uv.units,
  SiUnits.waveLength,
  Uv.frequency,
  1,
  Uv.scale,
  SiUnits.hertz,
  Extract.strategy,
  signalFromMap,
]);
