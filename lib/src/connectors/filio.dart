/// Connector for a OS directory in a path.
library connector_io_directory;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart' show StreamGroup;
import 'package:path/path.dart' as p;

import 'connector_types.dart';

/// Returns a [Connection] to a File System Directory that must already exist.
/// the connection is capable any CSV UTF-8 file
Future<Connection> ioDirConnector(List<String> pathToDirectory) async {
  const String erMsg00 = 'Does not appears to be directory!';
  var ctx = new p.Context();
  var targetPath = ctx.join(ctx.current, ctx.joinAll(pathToDirectory));

  return await FileStat.stat(targetPath).then((FileStat feses) {
    if (feses.type == FileSystemEntityType.DIRECTORY) {
      Directory dir = new Directory(targetPath);
      List<FileSystemEntity> fse =
          dir.listSync(followLinks: false, recursive: false);
          fse.retainWhere((f)=> f is File);
      List<File> df = new List.from(fse);

      // Enclosure returned for the streaming of files.
      //TODO: Need work out a better way then the cast from UTF8.
      Stream connection(){
        List<Stream> fs = new List();
        df.forEach((f) => fs.add(f
            .openRead()
            .transform(UTF8.decoder)
            .transform(const LineSplitter())));
        return StreamGroup.merge(fs);
      }
      return connection;
    } else {
      throw new ArgumentError('$targetPath - $erMsg00');
    }
  });
}
