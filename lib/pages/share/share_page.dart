import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/ui/buttons.dart';
import 'package:mobile_app/utils/app_colors.dart';
import 'dart:async';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';

import 'qr_code_generation.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return SafeArea(
        child: PageView(
      controller: controller,
      children: const <Widget>[
        WifiPage(),
        QrCodeGenerationPage(),
      ],
    ));
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
      child: Column(
        children: [
          Text('Share'),
          Container(
            height: 500,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  onTap: () {},
                );
              },
            ),
          ),
          PrimaryButton(
            color: AppColors.color12D18E,
            height: 50,
            onTap: () {},
            width: 300,
            child: Text('Send with WI-fi'),
          ),
          SizedBox(
            height: 10,
          ),
          PrimaryButton(
            color: AppColors.color12D18E,
            height: 50,
            onTap: () {},
            width: 300,
            child: Text('Create qr-code'),
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({super.key, required this.onTap});
  final VoidCallback onTap;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 200,
            width: 300,
          ),
        ),
      ),
    );
  }
}
