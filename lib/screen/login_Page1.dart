import 'package:flutter/material.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _RegState();
}

class _RegState extends State<Login1> {
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Form(
                key: loginKey,
                child: Container(
                    // height: size.height,
                    // width: size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(129, 129, 129, 129),
                        image: DecorationImage(
                            alignment: FractionalOffset.bottomCenter,
                            // fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/transparent-wedding-couple-silhouette-651e3032695a91.2840414516964772344315.png'))),
                    child: ListView(children: [
                      const Center(
                          child: Text("Register",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900))),
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Signup to experience in new way",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          )),
                      const Center(
                          child: Text(
                            "Bridge Communication",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          )),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 50, left: 50, top: 25),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.white38),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    hintText: " Name",
                                    hintStyle: TextStyle(color: Colors.black),
                                    labelText: ' Name',
                                    labelStyle: TextStyle(color: Colors.black),
                                    suffixIcon:
                                    Icon(Icons.person_add, size: 15),
                                    filled: true,
                                    fillColor:
                                    Color.fromARGB(129, 129, 129, 129)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ("please enter your name");
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 50, left: 50, top: 25),
                              child: TextFormField(
                                maxLength: 10,
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.white38),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(color: Colors.black),
                                    labelText: 'Mobile Number',
                                    labelStyle: TextStyle(color: Colors.black),
                                    suffixIcon:
                                    Icon(Icons.phone_android, size: 15),
                                    filled: true,
                                    fillColor:
                                    Color.fromARGB(129, 129, 129, 129)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ("please enter your number");
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 40,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                        color: (Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: TextButton(
                                        onPressed: () {
                                          if (loginKey.currentState!
                                              .validate()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content: Text("success")));
                                          }
                                        },
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ]
                      ),

                    ]
                    )
                ))));
  }
}
