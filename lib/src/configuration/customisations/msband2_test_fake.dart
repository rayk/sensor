part of sensor_configuration;


/// Test Configuration.
const LookupMap smband2GsrST = const LookupMap(const [
  Gsr.datetime,
  const [0],
  Gsr.resistance,
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

const LookupMap msBand2FakeSensorManifest = const LookupMap(
    const [], const [const LookupMap.pair(SensorType.galvanic, smband2GsrST)]);