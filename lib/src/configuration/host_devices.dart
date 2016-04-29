part of sensor_configuration;

/// All the devices which host Sensors.
/// Included here are fake test devices.
enum Device {
  /// Microsoft Band 2 Live Stream.
  msband2Live,

  /// Microsoft Band 2 FireBase Source.
  msBand2Fire,

  /// Nexus 6 Live Stream
  nexus6Live,

  /// Nexus 6 FireBase Source.
  nexus6Fire,

  /// Fake Test Band Configured as FireBase outputting Maps.
  msBand2TestFakeMap,

  /// Fake Test Band Configured as FireBase outputting List.
  msBand2TestFakeList,
}
