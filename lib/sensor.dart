// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// Simple library to vuild harper sensors.
///
/// The structure of each sensor is simple, this packages, just composite together
/// function that define a sensor.
library sensor;

import 'package:sensor/src/types/connector_types.dart';
import 'package:sensor/src/types/biosignal.dart';

export 'src/sensor_core.dart';
export 'package:sensor/src/types/connector_types.dart';
export 'package:sensor/src/connectors/fire.dart';
export 'package:sensor/src/types/biosignal.dart';

// TODO: Export any libraries intended for clients of this package.
