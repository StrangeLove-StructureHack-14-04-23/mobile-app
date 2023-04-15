import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/ui/buttons.dart';
import 'package:mobile_app/utils/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';

import '../../ui/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return WifiPage();
  }
}

class WifiPage extends StatefulWidget {
  const WifiPage({super.key});
  @override
  State<WifiPage> createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  WifiInfoWrapper? _wifiObject;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    WifiInfoWrapper? wifiObject;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      wifiObject = await WifiInfoPlugin.wifiDetails;
    } on PlatformException {}
    if (!mounted) return;

    setState(() {
      _wifiObject = wifiObject;
    });
  }

  @override
  Widget build(BuildContext context) {
    String ipAddress =
        _wifiObject != null ? _wifiObject!.ipAddress.toString() : "...";
    String macAddress =
        _wifiObject != null ? _wifiObject!.macAddress.toString() : '...';
    String connectionType = _wifiObject != null
        ? _wifiObject!.connectionType.toString()
        : 'unknown';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return CardWidget(
                name: '',
                phone: '',
                role: '',
                telegram: '',
                vk: '',
              );
            },
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: PrimaryButton(
              color: AppColors.color12D18E,
              height: 50,
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Your Qr-code'),
                  content: _buildQrCode('hello'),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              width: 300,
              child: Text('Create qr-code'),
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildQrCode(String data) {
    try {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200.0,
            height: 200.0,
            child: QrImage(
              errorStateBuilder: (context, error) => Text(error.toString()),
              data: '$data',
            ),
          ),
        ],
      );
    } catch (e) {
      return null;
    }
  }
}
