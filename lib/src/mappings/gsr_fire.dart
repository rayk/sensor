
import 'package:sensor/src/types/biosignals.dart';


Map fireGsrToBioSignal {

}

Map fireGsrExtractionMap(){

}

Function getFrom(String key){

}

Function refFrom(Device sensor){

}

Map gsrOutput{
  Gsr.dateTime: getFrom('timestamp');
  Gsr.value : getFrom('resistence');
  Gsr.unit : refFrom()
}
