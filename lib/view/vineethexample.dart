import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Make Phone Call Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              makePhoneCall('+919526648567'); // Replace with your phone number
            },
            child: Text('Call Now'),
          ),
        ),
      ),
    );
  }
}

void makePhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  try {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print('Error launching phone call: $e');
  }
}
