part of sensor_configuration;

/// Test Configuration.
const LookupMap gsrOnMsBand2FakeMapTest = const LookupMap(const [
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
  signalFromList,
]);

/// LookUps the particular sensor configuration. Here is the Fake
/// MSBands that outputs as list.
const LookupMap msBand2FakeMapSensorManifest = const LookupMap(const [],
    const [const LookupMap.pair(SensorType.galvanic, gsrOnMsBand2FakeMapTest)]);
