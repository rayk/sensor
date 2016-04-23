/// Connectors are one of the elements that is used to composite sensors.
library connector;

import 'dart:async';

/// Function that retruns a stream with raw sensor data compliant to the
/// optional settings handled in.
/// When not optional settings are passed the stream with contain everything
/// the sensor connection can provide.
typedef Stream<String> Connection({Map<String, String> settings});

/// Returns a [Connection] to a sensor given in the list of string identifiers.
typedef Future<Connection> Connector(List<String> identifier);
