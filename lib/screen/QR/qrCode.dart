import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerator extends StatefulWidget {
  @override
  _QrCodeGeneratorState createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  String data = "Your Unique Data"; // Replace this with your unique data

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QrImageView(
            data: data,
            size: 120,
            version: QrVersions.auto,
            foregroundColor:CupertinoColors.white),
        SizedBox(height: 20.0),
      ],
    );
  }
}
