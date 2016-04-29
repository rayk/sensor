library extractor;


/// Used when the connector outs a List;
Map signalFromList(
    List detection, List requiredAttributes, Function mapLookup) {
  Map result = new Map();
  for (var a in requiredAttributes) {
    assert(a != null);
    var target = mapLookup(key: a);
    assert(target != null);
    result[a] = target is List<int> ? detection[target.first] : target;
  }
  return result;
}


/// Used when the connector outputs a Map, looks up the required element and
/// finds it in the detection and place it in the map.
Map signalFromMap(Map detection, List requiredAttributes, Function mapLookUp) {
  Map result = new Map();
  for (var a in requiredAttributes) {
    assert(a != null);
    var target = mapLookUp(key: a);
    result[a] = target is String ? detection[target] : target;
  }
  return result;
}