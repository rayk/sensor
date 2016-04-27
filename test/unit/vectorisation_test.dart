@TestOn('vm')
@Timeout(const Duration(seconds: 5))
library unit_test_vectorise;

import 'dart:async';
import 'package:test/test.dart';
import 'package:sensor/src/connectors/connectors.dart';
import 'package:sensor/src/tranformers/transformers.dart';

/// Unit test of Vectorisation of unknown stream according to pattern.
void main() {
  group('Able to receive vectorisation configuration.', () {
    List<String> validWithItemCounnt = ['test', 'data', 'known_count'];

    test("Should vectorise the into a list of strings", () async {
      Connection rawSensor1 = await ioDirConnector(validWithItemCounnt);
      Stream sensorData = rawSensor1();
      StreamTransformer vx = new StreamTransformer.fromHandlers(handleData: verctorise);
      sensorData.transform(vx).listen((List datum) {
        expect(datum.length, equals(3));
        print(datum);
      });
    });

    test('Should drop an item out of the list',() async{
      Connection rawSensor2 = await ioDirConnector(validWithItemCounnt);
      Stream<String> sensorData = rawSensor2();
      StreamTransformer vx = new StreamTransformer.fromHandlers(handleData: verctorise);
      StreamTransformer d1 = new StreamTransformer.fromHandlers(handleData: dropItem1);
      sensorData.transform(vx).transform(d1).listen((List datum) {
        expect(datum.length, equals(2));
        print(datum);
      });
    });

  });
}
