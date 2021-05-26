// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

enum DeviceAvailability { NO, MAYBE, YES }

class AvailableDevice extends BluetoothDevice {
  BluetoothDevice device;
  DeviceAvailability availability;
  int? rssi;

  AvailableDevice({
    required this.device,
    required this.availability,
    this.rssi,
  });
}
