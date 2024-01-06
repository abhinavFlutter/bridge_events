import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../controller/cartController.dart';
import '../../model/description_model.dart';
import '../QR/qrCode.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  late final List<String> selectedItems;

  CartPage({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TicketWidget(
            color: Colors.black,
            width: 340,
            height: 700,
            isCornerRounded: true,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(left: 40,top: 90),
                child: Text("Wedding Date :",style: TextStyle(fontSize: 16,color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Obx(
                  () => ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      DescriptionModel item = cartController.cartItems[index];
                      return Column(
                        children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 50,bottom: 20),
                             child: Text(
                          'Event Category: ${item.descriptioneventname}',
                             style: const TextStyle(color: Colors.white,fontSize: 16),
                         ),
                           ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("Event Items:",style: TextStyle(fontSize: 18,color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45, ),
                            child:
                            Text(
                              item.descriptionItems != null
                                  ? item.descriptionItems!
                                  .map((dynamic item) => '$item\n')
                                  .join()
                                  : '',
                              style: const TextStyle(color: Colors.white,fontSize: 15),
                            ),
                          ),
                          Text( 'Price: ${item.descriptionPrice}',
                            style: TextStyle(color: Colors.white,fontSize: 19),

                          ),
                        ],
                      );

                      //   ListTile(
                      //   title: Text(
                      //     item.descriptionNote ?? '',
                      //     style: const TextStyle(color: Colors.white),
                      //   ),
                      //   subtitle: Text(
                      //     'Price: ${item.descriptioneventname}',
                      //     style: const TextStyle(color: Colors.white),
                      //   ),
                      //   // Add more details as needed
                      // );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(CupertinoIcons.star_fill,
                        color: Colors.orange, size: 20),
                    Icon(CupertinoIcons.star_fill,
                        color: Colors.orange, size: 20),
                    Icon(CupertinoIcons.star_lefthalf_fill,
                        color: Colors.orange, size: 20),
                    Icon(CupertinoIcons.star, color: Colors.orange, size: 20),
                    Icon(CupertinoIcons.star, color: Colors.orange, size: 20),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 30),
                      child: Container(
                        width: 120.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(width: 2.0, color: Colors.green),
                        ),
                        child: const Center(
                          child: Text(
                            "done",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.only(top: 450,left: 50),
                child: Text(selectedItems.join("\n"),
                    style: const TextStyle(color: Colors.white,fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 440, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    QrCodeGenerator(),
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
