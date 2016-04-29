/// Contains the constant configuration for all supported sensors.
///
/// The configuration hierarchy starts with [Device] then [SensorType] this
/// then returns a LookupMap for that particular sensor on that particular
/// device. Contained in this final map is everything that is needs configure
/// a Sensor and a strategy [Extract.strategy] to map the raw sensor data
/// into a Sensor Signal.
///
/// It should be noted that [SensorType] has a mapping to Keys which are
/// considered standard available values from this particular sensor type.
/// These are all contained in [sensorDataValues].
///
/// Note the underlying lookupMap is shakeable, so these configs don't have
/// to be regularly.
library sensor_configuration;

import 'package:lookup_map/lookup_map.dart';
import 'package:sensor/src/extractor/extractor.dart';

part 'customisations/msband2_test_fake_list.dart';
part 'customisations/msband2_test_fake_map.dart';
part 'customisations/msband2_via_firebase.dart';
part 'host_devices.dart';
part 'measure_units.dart';
part 'sensor_data.dart';
part 'sensor_types.dart';

/// Maps from a devices to an inventory of sensors on that device. If devices
/// sensor can be accessed via different methods, then extend the list of devices
const LookupMap sensorManifest = const LookupMap(const [], const [
  const LookupMap.pair(Device.msBand2Fire, msBand2FireManifest),
  const LookupMap.pair(Device.msBand2TestFakeMap, msBand2FakeMapSensorManifest),
  const LookupMap.pair(Device.msBand2TestFakeList, msBand2FakeListSensorManifest),
]);

/// Returns the specific value for the required sensor on the request device.
SensorSpec loadSensorSpec(Device device, SensorType sensor) {
  LookupMap d = sensorManifest[device];
  LookupMap s = d[sensor];
  List sensorKeyList = sensorDataValues[sensor];

  /// Closure that answer questions about the sensor specification.
  /// all the routing an cross look is done here. All it without
  /// parameters returns a list of all the keys available
  get({key}) {
    return key == null ? sensorKeyList : s[key];
  }

  return get;
}

/// Specific keys for a particular sensor configuration.
typedef SensorSpec({key});

/// Returns a sensor specification for the given [SensorType] on the given [Device]
typedef SensorSpec SensorSpecFinder(Device device, SensorType sensor);

/// Enumeration the extraction key.
enum Extract { strategy, }

/// Enumeration indicates what to expect from the connector.
enum Format { list, map, }
