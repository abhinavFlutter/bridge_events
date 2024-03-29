  import 'package:bridge_events/screen/Text_button/textButton.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:get/get_core/src/get_main.dart';
  import 'package:table_calendar/table_calendar.dart';

  import '../../controller/cartController.dart';
import '../token/tokenPage.dart';


  class Booking extends StatefulWidget {
    @override
    _BookingState createState() => _BookingState();
  }

  class _BookingState extends State<Booking> {
    CalendarFormat _calendarFormat = CalendarFormat.month;
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;

    var items = [
      // "",
      "Photographer",
      "Cake",
      "Invitation card",
      "Bridal Makeup",
      "Groom Makeup",
    ];


    int selectedTextIndex = 0;
    List<String> selectedItems = [];
    final loginKey = GlobalKey<FormState>();
    var amountController = TextEditingController();
    final FavoritrController2 _cartController = Get.find<FavoritrController2>();
    @override
    Widget build(BuildContext context) {
      // Size size = MediaQuery.of(context).size;
      return Scaffold(
        body: Form(
            key: loginKey,
            child: ListView(children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text("Mark the Date",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 40, left: 40, bottom: 0),
                child: SizedBox(
                  width: 800,
                  height: 400,
                  child: TableCalendar(
                    calendarStyle: const CalendarStyle(
                      todayDecoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          color: Colors.grey),
                      selectedDecoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          color: Colors.black54),
                    ),
                    firstDay: DateTime(1999, 1, 1),
                    lastDay: DateTime(2050, 1, 1),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          print(_selectedDay);
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30,left: 35),
                    child: Center(
                      child: Container(height: 80,width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(width: 4.0, color: Colors.green)),
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          tileColor: Colors.transparent,
                          title: Text(
                            selectedItems.join(" , "),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  tileColor: const Color.fromARGB(80, 80, 80, 80),
                  onTap: () {},
                  title: const Text("Other Services",
                      style: TextStyle(fontSize: 15)),
                  trailing: DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    // dropdownColor: const Color.fromARGB(47, 47, 47, 47),
                    style: const TextStyle(color: Colors.black87),
                    // value: items2[selectedTextIndex],
                    icon: const Icon(Icons.expand_circle_down_outlined,
                        size: 25, color: Colors.red),
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        if (!selectedItems.contains(value)) {
                          selectedItems
                              .add(value!); // Add selected item to the list
                          selectedTextIndex = items.indexOf(value);
                        } else if (selectedItems.contains(value)) {
                          selectedItems.remove(value);
                          selectedTextIndex = items.indexOf(value!);
                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(80, 80, 80, 80),
                    disabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: ("Pay Advance Minimum  ₹5,000/-"),
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter amount";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 150, left: 150),
                child: MyButton(
                  onTap: () {
                    // Navigate to CartPage and pass selected items
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return TockenPage(selectedDay: _selectedDay,
                          selectedItems: selectedItems,
                            amountController:amountController


                        );                    }),
                    );
                  },
                  child: Center(child: const Text("Next", style: TextStyle(color: Colors.white, ))),
                ),
              )
            ])),
      );
    }
  }
