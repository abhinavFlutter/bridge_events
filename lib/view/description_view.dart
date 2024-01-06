import 'package:bridge_events/controller/desciption_controller.dart';
import 'package:bridge_events/screen/confirm_order/confirmOrder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cartController.dart';
import '../model/description_model.dart';
import '../screen/booking_page/booking.dart';
import '../screen/trash/trash1.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  late List<QueryDocumentSnapshot<Object?>> data;
  Map<int, int> selectedImageIndices = {};
  final DescriptionController descriptionController =
      Get.put(DescriptionController());
  final CartController _cartController = Get.find<CartController>();

  @override
  void initState() {
    super.initState();
    // Fetch the data and initialize the selectedImageIndices
    descriptionController.getDescriptionData().then((result) {
      setState(() {
        data = result;
        for (int i = 0; i < data.length; i++) {
          selectedImageIndices[i] = 0;
        }
      });
    });
  }

  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      print('Marked as favorite!');
    } else {
      print('Unmarked as favorite!');
    }
  }
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
        future: descriptionController.getDescriptionData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Return a loading indicator or placeholder widget
             return CircularProgressIndicator(); // Replace this with your loading indicator
          } else if (snapshot.hasError) {
            // Handle error
            return Text('Error: ${snapshot.error}');
          } else if ( snapshot.data!.isEmpty) {
            // Handle the case where data is null or empty
            return const Text('No data available.');
          }

          // Data has been loaded successfully
          List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
          int dataLength = data.length;

          return ListView.builder(
            itemCount: dataLength,
            itemBuilder: (context, index) {
              DescriptionModel productModel = DescriptionModel(
                descriptionId: data[index]['descriptionId'],
                descriptionNote: data[index]['descriptionNote'],
                descriptionItems: data[index]['descriptionItems'],
                descriptionPrice: data[index]['descriptionPrice'],
                descriptionImages: data[index]['descriptionImage'],
                descriptioneventname: data[index]['descriptioneventname'],
              );
              return Column(
                children: [
                  SizedBox(
                    width: 370,
                    height: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: NetworkImage(
                            productModel.descriptionImages![
                                selectedImageIndices[index] ?? 0],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Icon(Icons.currency_rupee_sharp),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Text(
                                  "${productModel.descriptionPrice}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  size: 30,
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: toggleFavorite,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 105,
                          width: 415,
                          child: Card(
                            color: Colors.white54,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "${productModel.descriptionNote}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: Text(
                            productModel.descriptionItems?.join('\n') ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            ...productModel.descriptionImages
                                    ?.asMap()
                                    .entries
                                    .map(
                                  (entry) {
                                    int imageIndex = entry.key;
                                    String image = entry.value;

                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedImageIndices[index] =
                                              imageIndex;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: SizedBox(
                                          height: 80,
                                          width: 80,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.network(
                                                image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).toList() ??
                                [],
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25, bottom: 10, left: 25, right: 25),
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 150,
                              height: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Colors.black12,
                                elevation: 30,
                                child: const Center(
                                  child: Text(
                                    "Call Now",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Add the item to the cart
                              _cartController.addToCart(productModel);
                              // Show a snackbar or any other feedback
                              Get.snackbar(
                                'Added to Cart',
                                'Item added to the cart',
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 2),
                              );
                              return setState(() {
                                navigator?.push(MaterialPageRoute(
                                  builder: (context) {
                                    return Booking();
                                  },
                                ));
                              });
                            },
                            child: SizedBox(
                              width: 150,
                              height: 70,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Colors.black12,
                                elevation: 30,
                                child: const Center(
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 50,
                    thickness: 3,
                    endIndent: 35,
                    indent: 35,
                  )
                ],
              );
            },
          );
        },
      )
    );
  }
}
