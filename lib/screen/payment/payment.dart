

import 'package:bridge_events/model/description_model.dart';
import 'package:bridge_events/model/event_carousel_slider_model.dart';
import 'package:bridge_events/screen/Text_button/textButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../confirm_order/confirmOrder.dart';

class PaymentScreen extends StatelessWidget {
  DescriptionModel? get descriptionModel => null;

  EventCategoryModel? get eventCategoryModel => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Total Amount: \$xxxxxx',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            const Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Card Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter card number',
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Expiry Date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'MM/YY',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'CVV',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'CVV',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: MyButton(onTap: () {

              }, child: Center(child: Text('Done',style: TextStyle(color: Colors.white),))),
            )
          ],
        ),
      ),
    );
  }
}
