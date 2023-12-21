
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../login_page/login.dart';
import '../registration_page/registration.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({super.key});

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
            children:[ Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "The first rule for choosing vendors is to avoid ",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const Text(" those who suggest your budget isn’t sufficient.",
                    style: TextStyle(fontSize: 17, color: Colors.black)),
                const Text(" The planning process should be about taking ",
                    style: TextStyle(fontSize: 17, color: Colors.black)),
                const Text(" your ideas and making them work.",
                    style: TextStyle(fontSize: 17, color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.only(top: 50,),
                  child: Text("Wedding Planner",
                      style: TextStyle(fontSize: 34, color: Colors.black,fontWeight: FontWeight.w800,letterSpacing: 2)),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 0,
                    right: 90,
                  ),
                ),
                Container(
                  // height: size.height,
                  // width: size.width,
                  color: Colors.white,
                  child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/images/3886130.jpg')),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(100, 50)),
                          backgroundColor: MaterialStatePropertyAll(Colors.grey),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Login page",
                            fontSize: 10,
                            gravity: ToastGravity.CENTER,
                            toastLength: Toast.LENGTH_SHORT);
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ));
                        });
                      },
                      child: Text(
                        "Signin",
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(100, 50)),
                          backgroundColor: MaterialStatePropertyAll(Colors.grey),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Registration page",
                            fontSize: 10,
                            gravity: ToastGravity.CENTER,
                            toastLength: Toast.LENGTH_SHORT);
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Register();
                            },
                          ));
                        });
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      )),
                )
              ],
            ),
            ]
        ),
      ),
    );
  }
}

//
//       body: Stack(
//           children: [SizedBox(
//             height: double.infinity, width: double.infinity,
//             child: Image(
//                 image: AssetImage('assets/images/Wavy_Ppl-10_Single-10.jpg'),
//                 width: double.infinity,
//                 height: double.infinity),
//           ),
//           ]
//       ),
//
//     );
//   }
// }












