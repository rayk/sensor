// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// Simple library to build harper sensors.
///
/// The structure of each sensor is simple, this packages, just composite together
/// function that define a sensor.
library sensor;

import 'package:sensor/src/connectors/connectors.dart';
import 'package:sensor/src/configuration/sensor_config.dart';
import 'package:sensor/src/sensor_signal.dart';

export 'src/sensor_core.dart';
export 'src/connectors/connectors.dart';
export 'src/sensor_signal.dart';
export 'package:sensor/src/configuration/sensor_config.dart'
    show SensorSpec, SensorType, SensorSpecFinder, loadSensorSpec, Device;
