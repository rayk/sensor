@TestOn('vm')
@Timeout(const Duration(seconds: 5))
library unit_test_filio;

import 'dart:async';
import 'package:test/test.dart';
import 'package:sensor/src/connectors/connectors.dart';

/// Unit test of the connector.
void main() {
  List<String> validPath = ['test', 'data', 'light'];
  List<String> validPathNoData = ['test', 'data', 'empty'];
  List<String> validWithItemCounnt = ['test', 'data', 'known_count'];//205
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

    test('Should Error if the directory contains not files.',(){
      expect(ioDirConnector(validPathNoData), throwsStateError);
    });
  });

  group('Provides a string of sensor data', () {
    test("Should provide a stream of list given vaild input", () async {
      Connection lightSensor = await ioDirConnector(validWithItemCounnt);
      Stream sensorData = lightSensor();
      sensorData.listen(expectAsync((var datum) {
          expect(datum is String, isTrue);
          expect(datum, isNotEmpty);
          print(datum);
      }, count: 205));
    });
  });
}
