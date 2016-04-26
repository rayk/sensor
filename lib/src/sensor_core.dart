library sensor.api;

import 'dart:async';
import 'package:sensor/sensor.dart';
import 'package:sensor/src/types/connector_types.dart';

/// A sensor collects datums from a single source. The collected data is
/// not homegenous and nessary part of the same data demension. It just happens
/// to be from the same phyiscal or logical sensor.

/// Namespace where all the functions of a sensor are assembleed.
class Sensor{
  Connector connector;
  Connection connection;
  List<String> path;
  Map signalDescriptor;
  Map outputDescriptor;
  ///Constructor for a sensor specifiing the functions ti be used.
  Sensor(this.connector,this.path, this.signalDescriptor, this.outputDescriptor){

  }

  Future<Stream<String>>Sense()async{
    connection = await connector(path);
    Stream<String> raw = connection();
    return raw;
  }

  /// Returns the core signal element of an observation.
  /// Source is the incoming Linked hash Map, the destination specifics what it
  /// could like extracted from the source.
  Map _extractSignal(Map source, Map coreSignalDescription){

    Map result = new Map();

    List attributes = new List.from(coreSignalDescription.keys);
    List<Function> valueFunctions = new List.from(coreSignalDescription.values);
    assert(attributes.length == valueFunctions.length);

    for (int i=0; valueFunctions.length < i; i++){
      Function val = valueFunctions[i];
      result[attributes[i]] = val();
    }

    return result;
  }

  Map _prepareReading (){

  }

}
