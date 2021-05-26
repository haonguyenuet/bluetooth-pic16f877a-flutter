// @dart = 2.9

import 'package:bluetooth_control/configs/configs.dart';
import 'package:flutter/material.dart';

import 'app_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return AppView();
        });
      },
    );
  }
}
