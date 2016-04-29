@TestOn('vm')
@Timeout(const Duration(seconds: 10))
library unit_test_filio;

import 'dart:async';
import 'package:test/test.dart';
import 'package:sensor/src/connectors/connectors.dart';

void main(){

  group('Establish connection with filebase',(){

    test('Should connection to file back',() async {

      List connectionString = ["https://banddata.firebaseio.com", 'JL', 'gsr', 'XuHBWOngUKU0w7yKiueK3SqMd5bm6qhUumi70mlr'];
      Connection fbConnection = await fireBaseConnector(connectionString);
      expect(fbConnection is Connection, isTrue);

      Stream result = fbConnection();
      expect(result, isNotNull);


      result.listen(expectAsync((Map value){

        print(value);

      }, max: 50000));
    });



  });

}
