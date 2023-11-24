import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Phone Number Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {
                print(phone.completeNumber); // Get complete phone number
              },
            ),
          ),
        ),
      ),
    );
  }
}