import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/utils/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.name,
    required this.role,
    // required this.imageUrl,
    required this.phone,
    required this.telegram,
    required this.vk,
    required this.userId,
  });

  final String name;
  final String role;
  // final Image image;
  final String phone;
  final String telegram;
  final String vk;
  final String userId;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
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

    return Container(
      width: 334,
      height: 178,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.color303030,
            AppColors.color696969,
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Your Qr-code'),
              content: _buildQrCode('I`m $widget.userId'),
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.role,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // height: 65,
                      width: 196,
                      decoration: BoxDecoration(
                          color: AppColors.color535353,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.phone,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 19,
                                ),
                                InkWell(
                                    child: Text(
                                  widget.phone,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ))
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.telegram, color: Colors.white,),
                                const SizedBox(
                                  width: 19,
                                ),
                                InkWell(
                                    child: Text(
                                  widget.telegram,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ))
                              ],
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.message, color: Colors.white),
                                SizedBox(
                                  width: 19,
                                ),
                                InkWell(
                                    child: Text(
                                  widget.vk,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 88,
                  height: 132,
                  child: Image.network(
                    'https://img.freepik.com/free-photo/3d-render-smartphone-with-hand-fill-online-survey_107791-15912.jpg?w=1060&t=st=1681601760~exp=1681602360~hmac=352547b5544e4320752dc978b56e052f458d1681abd198efeb000948caa03477',
                    fit: BoxFit.fitWidth,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ),
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
