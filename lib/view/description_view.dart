import 'package:bridge_events/controller/desciption_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../model/description_model.dart';
import '../screen/booking_page/booking.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {

  int selectedImageIndex = 0;

  final DescriptionController _descriptionController =
      Get.put(DescriptionController());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
            future: _descriptionController.getDescriptionData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return a loading indicator or placeholder widget
                return const SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                // Handle error
                return Text('Error: ${snapshot.error}');
              } else {
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
                      descriptionImages: data[index]['descriptionImages'],
                    );
                    return Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: SizedBox(
                            width: 360,
                            height: 350,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child:  Image.network(
                                "${productModel.descriptionImages?[index]}",
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
                                padding: EdgeInsets.only(top: 10,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: Text(
                                        "Description",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 40),
                                      child: Icon(Icons.currency_rupee_sharp),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: Text(
                                        "${productModel.descriptionPrice}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
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
                                padding: EdgeInsets.only(top: 15, left: 10),
                                child: Text(
                                  "${productModel.descriptionItems?.join('\n') ?? ''}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                child: SingleChildScrollView(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: 150,
                                          height: 70,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return Booking();
                                              },
                                            ),
                                          );
                                        },
                                        child: SizedBox(
                                          width: 150,
                                          height: 70,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            color: Colors.black12,
                                            elevation: 30,
                                            child: const Center(
                                              child: Text(
                                                "Book Now",
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
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedImageIndex = 0;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
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
                                              BorderRadius.circular(20),
                                          child:  Image.network(
                                            "${productModel.descriptionImages?[0]}",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedImageIndex = 1;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
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
                                              BorderRadius.circular(20),
                                          child:  Image.network(
                                            "${productModel.descriptionImages?[1]}",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedImageIndex = 2;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
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
                                              BorderRadius.circular(20),
                                          child:  Image.network(
                                            "${productModel.descriptionImages?[2]}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedImageIndex = 3;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
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
                                              BorderRadius.circular(20),
                                          child:  Image.network(
                                            "${productModel.descriptionImages?[3]}",
                                            fit: BoxFit.fill,
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
                      ],
                    );
                  },
                );
              }
            }));
  }
}
