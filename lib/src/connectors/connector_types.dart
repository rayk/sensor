/// Connectors are one of the elements that is used to composite sensors.
library connector;

import 'dart:async';


/// Function that retruns a stream with raw sensor data compliant to the
/// to the passed Codec that used get from the file format to stream of strings.
typedef Stream Connection();

/// Returns a [Connection] to a sensor given in the list of string identifiers.
typedef Future<Connection> Connector(List<String> identifier);
