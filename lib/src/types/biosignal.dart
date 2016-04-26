/// Enumerated Keys used in sensor outs and the rules associated with each.
/// A sensor emit a particular type of signal at a given frequency. The [Sensor]
/// itself does not know about the human it is detecting signals from. In fact
/// the sensor has a very limited window of state and processes each signal as
/// it arrive and outputs reading.

/// Keys used to describe a sensor.
enum SensorKey{
  device,
  frequency,
  period, // The rate at which the sensor is set to sample, this is value.
  subject,
  type,// The Sensor Type
}

/// Device that the particular sensor is located on.
enum Device{
  msband2,
  phone,
}



/// Keys used to describe a particular signal.
enum Signal{
  fireGsr,
}

enum fireGsr{
  value, // Where is the value reading located.
  timestamp, // Where is the signal time located.
}

/// Keys used to describe a paticular reading, which encapsulates a signal.
/// outputted from the sensor.
enum Reading{

}

enum Gsr{
  dateTime,
  value,
  unit,
}

/// Derived International System of Units.
enum SIUnits{

}
