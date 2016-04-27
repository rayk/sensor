/// Connectors allow a sensor to connect to an external source, be that a http
/// endpoint, websocket, service or any other locations.
/// Connectors establish connections which they maintain. The only modification
/// that a connection may carry to the data that passed via are encoding changes.
library connectors;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart' show StreamGroup;
import 'package:firebase_rest/firebase_rest.dart';
import 'package:path/path.dart' as p;

part 'filio.dart';
part 'fire.dart';

/// Function that retruns a stream with raw sensor data compliant to the
/// to the passed Codec that used get from the file format to stream of strings.
typedef Stream Connection();

/// Returns a [Connection] to a sensor given in the list of string identifiers.
typedef Future<Connection> Connector(List<String> identifier);
