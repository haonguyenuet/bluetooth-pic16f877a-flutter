import 'package:bluetooth_control/configs/app_theme.dart';
import 'package:bluetooth_control/views/screens/bluetooth_picker/bluetooth_picker_screen.dart';
import 'package:bluetooth_control/views/screens/disable_bluetooth/disable_bluetooth_screen.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.currentTheme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return DisableBlutoothScreen();
          } else {
            return BluetoothPickerScreen();
          }
        },
        // child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
