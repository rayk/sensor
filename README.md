# Sensor

A sensor is pointed at a data projection, which can be any source that emitted data.

The sensor connects and collects from that source. Transforms the collected data into
a sensor signal Map and streams that to the array.

Each instance of sensor normalizes certain differences in data projection, if
the project needs to be pulled the sensor takes care of that, if it requires
listening, the sensor takes care of that.

The end result is the sensor provides a standard async stream that can be listened
to for sensor signals.

## Sensor Signal

Delivered from the sensor as a enumerated map it contains not only the core signal
but also the meta about source frequency etc. The allows for the signals to be processed
as a stream with the need of looking up more reference data etc.

## Structurally

The sensor packages is imported into another package where the Sensor class is
used to construct instances of sensors via the composition of predefined functions
and enumerations.

Therefore to support a new data projection it could be as simple as composing a
new instance of sensor, of the correct connectors and mappings exist. At the opposite
end of the scale a new data project may require a new connector, mapping and transform.
