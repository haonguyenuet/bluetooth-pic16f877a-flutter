import 'dart:convert';
import 'dart:typed_data';

import 'package:bluetooth_control/configs/app_size.dart';
import 'package:bluetooth_control/constants/app_color.dart';
import 'package:bluetooth_control/constants/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ControlScreen extends StatefulWidget {
  final BluetoothDevice device;

  const ControlScreen({required this.device});

  @override
  _ControlScreen createState() => new _ControlScreen();
}

class _ControlScreen extends State<ControlScreen> {
  BluetoothConnection? connection;
  bool get isConnected => connection != null && connection!.isConnected;

  bool turnOnLCD = true;

  @override
  void initState() {
    super.initState();
    connectDevice();
  }

  void connectDevice() {
    BluetoothConnection.toAddress(widget.device.address).then((_connection) {
      setState(() {
        connection = _connection;
      });
    });
  }

  @override
  void dispose() {
    if (isConnected) {
      connection?.dispose();
      connection = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HC05", style: AppFont.bold_default_20)),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: isConnected
              ? Column(
                  children: [
                    buildLcdDisplay(),
                    SizedBox(height: 50),
                    buildControlButton(),
                  ],
                )
              : Center(child: Text("Disconnected")),
        ),
      ),
    );
  }

  buildLcdDisplay() {
    return Container(
      width: SizeConfig.screenWidth * 0.8,
      height: SizeConfig.defaultSize * 15,
      padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
      decoration: BoxDecoration(
        color: Colors.green[900],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.black, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColor.cardShadowColor,
            blurRadius: 10,
            offset: Offset(1, 10),
            spreadRadius: 1,
          )
        ],
      ),
      child: AnimatedContainer(
        duration: Duration(microseconds: 500),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: turnOnLCD ? Colors.green[400] : Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.borderColor, width: 1),
        ),
      ),
    );
  }

  buildControlButton() {
    return Column(
      children: [
        CupertinoSwitch(
          value: turnOnLCD,
          onChanged: (value) {
            if (isConnected) {
              setState(() {
                setState(() {
                  turnOnLCD = !turnOnLCD;
                });
              });
              sendMessage();
            }
          },
          trackColor: AppColor.cardShadowColor,
        ),
        SizedBox(height: 10),
        Text(
          "${turnOnLCD ? 'ON' : 'OFF'}",
          style: AppFont.bold_default_24,
        )
      ],
    );
  }

  void sendMessage() async {
    try {
      String msg = turnOnLCD ? "1" : "2";
      var data = Uint8List.fromList(utf8.encode(msg));
      connection!.output.add(data);
      await connection!.output.allSent;
    } catch (e) {
      setState(() {});
    }
  }
}
