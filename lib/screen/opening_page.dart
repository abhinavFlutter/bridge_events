import 'package:bridge_events/screen/login_page.dart';
import 'package:bridge_events/screen/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({super.key});

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  @override
  Widget build(BuildContext context) {
  //  Size size = MediaQuery.of(context).size;
    return  Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [ const SizedBox(height: 70),
            const Text("The first rule for choosing vendors is to avoid ",style: TextStyle(fontSize: 15,color: Colors.black54),),
            const Text(" those who suggest your budget isn’t sufficient.",style: TextStyle(fontSize: 15,color: Colors.black54)),
            const Text(" The planning process should be about taking ",style: TextStyle(fontSize: 15,color: Colors.black54)),
            const Text(" your ideas and making them work.",style: TextStyle(fontSize: 15,color: Colors.black54)),
            const Padding(
              padding: EdgeInsets.only(left: 0,right: 90,),
              child: Image(image: AssetImage('assets/images/let celebreate.webp',)),
            ),
            Container(
              // height: size.height,
              // width: size.width,
              color: Colors.white,
              child: const Center(child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Image(image: AssetImage('assets/images/opn2.jpg')),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(onPressed: () {
                  Fluttertoast.showToast(msg: "login page",fontSize: 10,gravity:ToastGravity.CENTER);
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Login();
                    },));
                  });

                }, child: const Text("Sing In",style: TextStyle(color: Colors.black)),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 90,
                decoration: BoxDecoration( color: Colors.black54,
                borderRadius: BorderRadius.circular(20)
                ),
                
                child: TextButton(onPressed: () {
                  Fluttertoast.showToast(msg: "Registration page",fontSize: 10,gravity: ToastGravity.CENTER, toastLength: Toast.LENGTH_SHORT);
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Register();
                    },));
                  });

                }, child: const Text("Sing Up",style: TextStyle(color: Colors.white),)),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
