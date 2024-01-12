import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/cartController.dart';
import '../../model/description_model.dart';
import '../QR/qrCode.dart';
import '../Text_button/textButton.dart';
import '../homePage/navigation_page/navigation.dart';

class TockenPage extends StatelessWidget {
  final FavoritrController2 cartController = Get.put(FavoritrController2());
  final DateTime? selectedDay;

  final List<String> selectedItems; // Add this parameter
  final TextEditingController amountController; // Add this parameter

  TockenPage(
      {Key? key,
      this.selectedDay,
      required this.selectedItems,
      required this.amountController})
      : super(key: key);

  void initiatePayment(BuildContext context) async {
    String receiverUpiId = 'abhinavsug007-2@okaxis';
    String receiverName = 'Abhinav R';
    String merchantCode = 'yourMerchantCode';
    String transactionId = 'yourTransactionId';
    String transactionRefId = 'yourTransactionRefId';
    String transactionNote = 'Test Payment';
    double amount = 1.00;
    String currency = 'INR';
    String redirectUrl = 'https://your-redirect-url.com';

    String upiUrl =
        'upi://pay?pa=$receiverUpiId&pn=$receiverName&mc=$merchantCode&tid=$transactionId&tr=$transactionRefId&tn=$transactionNote&am=$amount&cu=$currency&url=$redirectUrl';

    if (await canLaunch(upiUrl)) {
      await launch(upiUrl);

      await Future.delayed(const Duration(seconds: 2));


      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NavigationScreen()),
            (route) => false,
      );
    } else {
      showSnackbar(context, 'Could not launch UPI payment URL');
  }
  }


  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TicketWidget(
          color: Colors.black,
          width: 340,
          height: 700,
          isCornerRounded: true,
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 40, top: 90),
                  child: Text(
                    "Wedding Date : ${selectedDay!.day}/${selectedDay!.month}/${selectedDay!.year}",
                    // child:Text("Wedding Date : ${DateFormat.yMd().format(selectedDay!)}",
                    style: TextStyle(color: Colors.white),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    ProductModel item = cartController.cartItems[0];
                    List? descriptionItems = item.descriptionItems;

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50, bottom: 20),
                          child: Text(
                            'Event Category: ${item.descriptioneventname}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Event Items:",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Column(
                            // Display all description items
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: descriptionItems
                                    ?.map((itemDescription) => Text(
                                          itemDescription,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ))
                                    .toList() ??
                                [],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Adv Price : ₹${amountController.text}",
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 40, right: 20),
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
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    child: Container(
                      width: 120.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 2.0, color: Colors.green),
                      ),
                      child: const Center(
                        child: Text(
                          "Your Token",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 450, left: 50),
                child: Column(
                  children: [
                    Text(
                      "Other Service :",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Align items to the left
                      children: selectedItems
                          .map((item) => Text(item,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 440, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    QrCodeGenerator(),
                  ],
                ),
              ),
              Positioned(
                top: 640,
                left: 105,
                child: InkWell(
                  onTap: () {
                    initiatePayment(context);
                  },
                  child: Container(
                    width: 120.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(width: 2.0, color: Colors.green),
                    ),
                    child: const Center(
                      child: Text(
                        "Pay",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
