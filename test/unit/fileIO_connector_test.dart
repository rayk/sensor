@TestOn('vm')
library unit_test_filio;

import 'package:test/test.dart';
import 'package:sensor/src/connectors/filio.dart';

/// Unit test of the
void main(){

  group('Connects to directory:',(){

    List<String> validPath = ['test', 'data', 'light'];
    List<String> nonExistentPath = ['test', 'data', 'does_not_exist'];
    List<String> validFileNotDirectory = ['test', 'data', 'badStubFile.csv'];

    test('Should provide a connector function.',() async {
      Connection lightConnection = await ioDirConnector(validPath);
      expect(lightConnection, isNotNull);
      expect(lightConnection is Connection, isTrue);
    });

    test("Should Error if provide a bad path.",(){
      expect(ioDirConnector(nonExistentPath), throwsArgumentError);
    });

    test('Should Error if provided with a file.',(){
      expect(ioDirConnector(validFileNotDirectory), throwsArgumentError);
    });

  });

}
