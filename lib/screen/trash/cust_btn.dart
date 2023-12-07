import 'package:flutter/material.dart';




class IconButtonWidget extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  final VoidCallback onPressed;
  final IconData trailingIcon;


  IconButtonWidget({super.key,
    required this.buttonText,
    required this.iconData,
    required this.onPressed,
    required this.trailingIcon
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData),
          SizedBox(width: 8), // Add some space between icon and text
          Text(buttonText),
          Icon(trailingIcon)
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Custom Button with Icon'),
      ),
      body: Center(
        child: IconButtonWidget(
          buttonText: 'Press me',
          iconData: Icons.star,
          trailingIcon: Icons.cable,
          onPressed: () {
            // Custom button with icon pressed
            print('Button with icon pressed!');
          },
        ),
      ),
    ),
  ));
}