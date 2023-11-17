//login page
import 'package:flutter/material.dart';

class Bridge extends StatelessWidget {
  const Bridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(232, 232, 228, 175),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(223, 223, 214, 236),
      //   centerTitle: true,
      //   title: const Text("Bridge Event",style: TextStyle(fontSize:27,color: Colors.black)),
      // ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(223, 223, 214, 236)),
        child: ListView(
          children: [
            const Center(
                child: Image(
              image: AssetImage('assets/images/purple.jpg'),
              height: 400,
              width: 400,
            )),
            const Center(
                child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
            const Padding(
              padding: EdgeInsets.only(right: 50, left: 50, top: 25),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'email',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color.fromARGB(76, 76, 0, 153)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 50, left: 50, top: 25),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide( color: Colors.deepPurple),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    hintText: "password",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'password',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color.fromARGB(76, 76, 0, 153)),
              ),
            ),

            TextButton(
                onPressed: () {},
                child: const Text(
                  "forgot password",
                  style: TextStyle(color: Colors.black87,fontSize: 10),
                )),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //     child: Center(
            //       child: SizedBox(
            //           width: 90,
            //           height: 40,
            //           child:

            Center(
              child: Container(
                  height: 40,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(99, 99, 16, 216),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  // color: Colors.deepPurple,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.black,fontSize: 15),
                      ))),
            ),

            TextButton(
                onPressed: () {},
                child: const Text(
                  "new user? create a account",
                  style: TextStyle(color: Colors.black,fontSize: 10),
                )),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                    onPressed: () {},
                    icon: const Image(
                        image: AssetImage('assets/images/phone.png'))),
                IconButton(
                    onPressed: () {},
                    icon: const Image(
                        image: AssetImage('assets/images/google1.png')))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
