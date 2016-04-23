@TestOn('vm')
@Timeout(const Duration(seconds: 5))
library unit_test_filio;

import 'dart:async';
import 'package:test/test.dart';
import 'package:sensor/src/connectors/filio.dart';
import 'package:sensor/src/connectors/connector_types.dart';

/// Unit test of the
void main() {
  List<String> validPath = ['test', 'data', 'light'];
  List<String> nonExistentPath = ['test', 'data', 'does_not_exist'];
  List<String> validFileNotDirectory = ['test', 'data', 'badStubFile.csv'];

  group('Connects to directory:', () {
    test('Should provide a connector function.', () async {
      Connection lightConnection = await ioDirConnector(validPath);
      expect(lightConnection, isNotNull);
      expect(lightConnection is Connection, isTrue);
    });

    test("Should Error if provide a bad path.", () {
      expect(ioDirConnector(nonExistentPath), throwsArgumentError);
    });

    test('Should Error if provided with a file.', () {
      expect(ioDirConnector(validFileNotDirectory), throwsArgumentError);
    });
  });

  group('Provides a string of sensor data', () {
    test("Should provide a stream of list given vaild input", () async {
      Connection lightSensor = await ioDirConnector(validPath);
      Stream sensorData = lightSensor();
      sensorData.listen(((var datum) {
        
      }));
    });
  });
}
