// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class Payment extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('UPI Payment Example'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               initiatePayment(context); // Pass the context here
//             },
//             child: Text('Make UPI Payment'),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void initiatePayment(BuildContext context) async {
//     // Replace 'receiver@upi' with the actual UPI ID of the receiver
//     String upiUrl = 'upi://pay?pa=receiver@upi&pn=Receiver%20Name&mc=yourMerchantCode&tid=yourTransactionId&tr=yourTransactionRefId&tn=Test%20Payment&am=1.00&cu=INR&url=https://your-redirect-url.com';
//
//     if (await canLaunch(upiUrl)) {
//       await launch(upiUrl);
//     } else {
//       showSnackbar(context, 'Could not launch UPI payment URL');
//     }
//   }
//
//   void showSnackbar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(Payment());
// }
