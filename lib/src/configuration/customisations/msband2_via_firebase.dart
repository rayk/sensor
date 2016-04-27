part of sensor_configuration;

/// Custom Sensor Schema specifically for Microsoft Band 2 data being extracted
/// from fire base.
const LookupMap msBand2FireManifest = const LookupMap(const [], const [
  const LookupMap.pair(SensorType.galvanic, gsrOnMsBand2ViaFireBase),
]);

/// Lowest level customisation of GSR data coming in and what will be looked
/// for when attempt to put together a sensor signal map for a GSR reading.
const LookupMap gsrOnMsBand2ViaFireBase = const LookupMap(const [
  Gsr.datetime,
  "timestamp",
  Gsr.resistance,
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
