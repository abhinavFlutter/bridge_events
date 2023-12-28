import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:bridge_events/screen/QR/qrCode.dart';
import '../../model/cart_model/cartModel.dart';
import '../../model/description_model.dart';
import '../../model/event_carousel_slider_model.dart';
// Import the CartModel class

class OrderConfirm extends StatefulWidget {
  // final CartModel cartModel; // Add this line to accept CartModel


//
// OrderConfirm({required this.cartModel}); // Add this line to accept CartModel

  @override
  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TicketWidget(
          color: Colors.black,
          width: 340.0,
          height: 600.0,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 2.0, color: Colors.green),
                      ),
                      child: Center(
                        child: Text("done"
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.star_fill,
                            color: Colors.orange, size: 20),
                        Icon(CupertinoIcons.star_fill,
                            color: Colors.orange, size: 20),
                        Icon(CupertinoIcons.star_lefthalf_fill,
                            color: Colors.orange, size: 20),
                        Icon(CupertinoIcons.star,
                            color: Colors.orange, size: 20),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Booking Confirmed',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 330, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      QrCodeGenerator(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
