import 'package:flutter/material.dart';
import '../bookingPage/booking.dart';

class HinduPage1 extends StatefulWidget {
  const HinduPage1({Key? key}) : super(key: key);

  @override
  State<HinduPage1> createState() => _HinduPage1State();
}

class _HinduPage1State extends State<HinduPage1> {
  List images = [
    'assets/images/img8.jpeg',
    'assets/images/img9.jpeg',
    'assets/images/wd4.jpg',
    'assets/images/wd3.jpg',
  ];
  int selectedImageIndex = 0;

  final List description = [
    "Though it’s the most important part of a wedding day, the ceremony is the space where your guests will spend the least amount of time, so this is not the place to blow your budget.",
    "Though it’s the most important part of a wedding day, the ceremony is the space where your guests will spend the least amount of time, so this is not the place to blow your budget.",
  ];

  final List items = [
    "A tent for an outdoor wedding\n"
        "Lighting\n"
        "Draping\n"
        "Dance floor\n"
        "Hanging decor or installations such as chandeliers\n"
        "Wedding hashtag signage\n"
        "Bar decor\n"
        "Dinner menus \n"
        "Chair decor for the marrying couple\n"
        "Lounge area\n",
    "A tent for an outdoor wedding\n"
        "Lighting\n"
        "Draping\n"
        "Dance floor\n"
        "Hanging decor or installations such as chandeliers\n"
        "Wedding hashtag signage\n"
        "Bar decor\n"
        "Dinner menus \n"
        "Chair decor for the marrying couple\n"
        "Lounge area\n",
  ];

  final List price = ['1,20,000', '1,20,000'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: description.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 900,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 360,
                    height: 330,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(images[selectedImageIndex]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 360,
                  height: 420,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
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
                                price[index],
                                style: TextStyle(
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
                              description[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, left: 10),
                        child: Text(
                          items[index],
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 160,
                              height: 60,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Colors.black12,
                                elevation: 30,
                                child: Center(
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
                              width: 160,
                              height: 60,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Colors.black12,
                                elevation: 30,
                                child: Center(
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
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only( left: 10),
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(images[0]),
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(images[1]),
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(images[2]),
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(images[3]),
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
            ),
          );
        },
      ),
    );
  }
}