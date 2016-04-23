library connector_filio;

import 'package:path/path.dart' as p;
import 'dart:async';
import 'dart:io';

/// Function that retruns a stream with raw sensor data compliant to the
/// exist specified in settings
typedef Stream<String> Connection(Map<String, String> settings);

/// A function type that returns a connector to sensor.
typedef Future<Connection> Connector(List<String> identifier);


/// Connects to a File System Directory the must already exist.
Future<Connection> ioDirConnector(List<String> pathToDirectory) async {
  const String erMsg00 = 'Does not appears to be directory!';
  var ctx = new p.Context();
  var targetPath = ctx.join(ctx.current, ctx.joinAll(pathToDirectory));

  return await FileStat.stat(targetPath).then((FileStat feses) {
    if (feses.type == FileSystemEntityType.DIRECTORY) {

      // Enclosure returned for the streaming of files.
      Stream<String> connection(Map setting){
        Directory source = new Directory(targetPath);
      }

      return connection;

    } else {
      throw new ArgumentError('$targetPath - $erMsg00');
    }
  });
}
