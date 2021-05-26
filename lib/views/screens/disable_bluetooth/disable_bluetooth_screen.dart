import 'package:bluetooth_control/configs/app_size.dart';
import 'package:flutter/material.dart';

class DisableBlutoothScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Center(
          child: Icon(
            Icons.bluetooth_disabled,
            size: SizeConfig.defaultSize * 20,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
