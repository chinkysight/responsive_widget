import 'package:flutter/material.dart';
import '../utils/device_enums.dart';

class DeviceType extends StatefulWidget {
  final Widget Function(Device device) builder;

  final double breakpointForTablet;

  const DeviceType(
      {Key? key, required this.builder, this.breakpointForTablet = 600.0})
      : super(key: key);

  @override
  _DeviceTypeState createState() => _DeviceTypeState();
}

class _DeviceTypeState extends State<DeviceType> {
  late  double deviceShortestSide;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceShortestSide = MediaQuery.of(context).size.shortestSide;
  }

  @override
  Widget build(BuildContext context) {
    if (deviceShortestSide < widget.breakpointForTablet) {
      return widget.builder(Device.Mobile);
    }
    return widget.builder(Device.Tablet);
  }
}