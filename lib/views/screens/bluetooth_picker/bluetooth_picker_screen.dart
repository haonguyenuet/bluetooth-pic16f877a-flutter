import 'dart:async';

import 'package:bluetooth_control/configs/app_size.dart';
import 'package:bluetooth_control/constants/app_font.dart';
import 'package:bluetooth_control/models/available_device.dart';
import 'package:bluetooth_control/views/screens/control/control_screen.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'widgets/bluetooth_device_item.dart';

class BluetoothPickerScreen extends StatefulWidget {
  @override
  _BluetoothPickerScreenState createState() => _BluetoothPickerScreenState();
}

class _BluetoothPickerScreenState extends State<BluetoothPickerScreen> {
  List<AvailableDevice> devices = [];

  // Availability
  StreamSubscription<BluetoothDiscoveryResult>? _discoveryStreamSubscription;
  bool isDiscovering = true;

  @override
  void initState() {
    super.initState();

    startDiscovery();

    // Setup a list of the bonded devices
    FlutterBluetoothSerial.instance.getBondedDevices().then(
      (List<BluetoothDevice> bondedDevices) {
        setState(() {
          devices = bondedDevices
              .map(
                (device) => AvailableDevice(
                  device: device,
                  availability: DeviceAvailability.MAYBE,
                ),
              )
              .toList();
        });
      },
    );
  }

  void restartDiscovery() {
    setState(() {
      isDiscovering = true;
    });

    startDiscovery();
  }

  void startDiscovery() {
    _discoveryStreamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        Iterator i = devices.iterator;
        while (i.moveNext()) {
          var _device = i.current;
          if (_device.device == r.device) {
            _device.availability = DeviceAvailability.YES;
            _device.rssi = r.rssi;
          }
        }
      });
    });

    _discoveryStreamSubscription!.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  @override
  void dispose() {
    _discoveryStreamSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(devices.length, (index) {
              var device = devices[index].device;
              return BluetoothDeviceItem(
                device: device,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ControlScreen(device: device);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text(
        "Bluetooth Device Picker",
        style: AppFont.bold_default_20,
      ),
      actions: [
        isDiscovering
            ? Container(
                padding: EdgeInsets.all(SizeConfig.defaultPadding * 2),
                child: CircularProgressIndicator(),
              )
            : IconButton(
                onPressed: () => restartDiscovery(),
                icon: Icon(Icons.replay),
              )
      ],
    );
  }
}
