import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/utils/app_colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../ui/text_fields.dart';

class QrCodeGenerationPage extends StatefulWidget {
  const QrCodeGenerationPage({super.key});

  @override
  State<QrCodeGenerationPage> createState() => _QrCodeGenerationPageState();
}

class _QrCodeGenerationPageState extends State<QrCodeGenerationPage> {
  TextEditingController _qrCodeDataController = TextEditingController();
  String outQrData = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PrimaryTextField(
              controller: _qrCodeDataController,
              labelStyle: TextStyle(fontSize: 15),
              labelText: 'qr data',
              validator: (e) {},
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.color12D18E,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    outQrData = _qrCodeDataController.text;
                    print(outQrData);
                  });
                },
                child: Text('generate'),
              ),
            ),
          ),
          Spacer(),
          QrImage(
            data: '$outQrData',
            size: 250,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
