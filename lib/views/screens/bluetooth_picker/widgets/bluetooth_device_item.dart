import 'package:bluetooth_control/configs/app_size.dart';
import 'package:bluetooth_control/constants/app_color.dart';
import 'package:bluetooth_control/constants/app_font.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceItem extends StatelessWidget {
  final Function()? onTap;
  final BluetoothDevice device;

  const BluetoothDeviceItem({
    Key? key,
    this.onTap,
    required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.bluetooth),
      title: Text(device.name ?? "Unknown device"),
      subtitle: Text(device.address.toString()),
      trailing: buildConnectButton(),
    );
  }

  buildConnectButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultPadding,
        vertical: SizeConfig.defaultSize / 2,
      ),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text("Connect", style: AppFont.bold_white_16),
    );
  }
}
