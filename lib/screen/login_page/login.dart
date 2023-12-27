
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/email_password_controller/emailPassword.dart';
import '../forgot_page/forgot.dart';
import '../homePage/drawer_page/drawer.dart';
import '../homePage/navigation_page/navigation.dart';
import '../registration_page/registration.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _BridgeState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();
bool passVisible = false;

class _BridgeState extends State<Login> {
  final loginKey = GlobalKey<FormState>();

  GoogleSignInController googleSignInController=GoogleSignInController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginKey,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 1)), // Add delay here
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return the shimmer effect while waiting
                return Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade300,
                  child: ListView(
                    children: [
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Bridge Events",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w900)),
                          )),
                      const Center(
                          child: Image(
                            image: AssetImage(
                                'assets/images/loginorg.png'),
                            // height: 400,
                            // width: 400,
                          )),
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'welcome Back!',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )),
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                                "welcome back to the best. we're\n always here, waiting for you!",
                                style: TextStyle(wordSpacing: 2,fontSize: 16),
                                textAlign: TextAlign.center),
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 50, left: 50, top: 15),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white38),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                hintText: " Email",
                                hintStyle: TextStyle(color: Colors.black),
                                // labelText: ' Email',
                                // labelStyle: TextStyle(color: Colors.black),
                                suffixIcon: Icon(Icons.alternate_email, size: 15),
                                filled: true,
                                fillColor: Color.fromARGB(129, 129, 129, 129)),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ("Please enter your email");
                              }
                              if (!RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(value)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 50, left: 50, top: 25),
                        child: TextFormField(
                            maxLength: 12,
                            decoration:  InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white38),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                hintText: " Password",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: IconButton(onPressed: () {
                                  setState(() {
                                    passVisible=!passVisible;
                                  });
                                }, icon: Icon(passVisible
                                    ?Icons.visibility
                                    :Icons.visibility_off
                                ),iconSize: 17),
                                filled: true,
                                fillColor: Color.fromARGB(129, 129, 129, 129)),
                            controller: passwordController,
                            obscureText: !passVisible,
                            obscuringCharacter: "*",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ("Please enter your password");
                              }
                              if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                                  .hasMatch(value)) {
                                return "Enter valid password";
                              }
                              return null;
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const ForgotPass();
                                    },
                                  ));
                                });
                              },
                              child: const Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: 40,
                              width: 70,
                              decoration: const BoxDecoration(
                                  color: (Colors.black),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                              child: TextButton(
                                  onPressed: () {
                                    if (loginKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text("success")));
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return const DrawerScreen();
                                        },));
                                      });
                                    }
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Not have an account?"),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return Register();
                                    },
                                  ));
                                });
                              },
                              child: const Text(
                                "Sign Up? ",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                // Return your actual content once the delay is over
                return  ListView(
                  children: [
                    const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Bridge Events",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900)),
                        )),
                    const Center(
                        child: Image(
                          image: AssetImage(
                              'assets/images/loginorg.png'),
                          // height: 400,
                          // width: 400,
                        )),
                    const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'welcome Back!',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )),
                    const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                              "welcome back to the best. we're\n always here, waiting for you!",
                              style: TextStyle(wordSpacing: 2,fontSize: 16),
                              textAlign: TextAlign.center),
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 50, left: 50, top: 15),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              hintText: " Email",
                              hintStyle: TextStyle(color: Colors.black),
                              // labelText: ' Email',
                              // labelStyle: TextStyle(color: Colors.black),
                              suffixIcon: Icon(Icons.alternate_email, size: 15),
                              filled: true,
                              fillColor: Color.fromARGB(129, 129, 129, 129)),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("Please enter your email");
                            }
                            if (!RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 50, left: 50, top: 25),
                      child: TextFormField(
                          maxLength: 12,
                          decoration:  InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              hintText: " Password",
                              hintStyle: TextStyle(color: Colors.black),
                              suffixIcon: IconButton(onPressed: () {
                                setState(() {
                                  passVisible=!passVisible;
                                });
                              }, icon: Icon(passVisible
                                  ?Icons.visibility
                                  :Icons.visibility_off
                              ),iconSize: 17),
                              filled: true,
                              fillColor: Color.fromARGB(129, 129, 129, 129)),
                          controller: passwordController,
                          obscureText: !passVisible,
                          obscuringCharacter: "*",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("Please enter your password");
                            }
                            if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                                .hasMatch(value)) {
                              return "Enter valid password";
                            }
                            return null;
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // IconButtonWidget(buttonText: "Hello btn", iconData: Icons.add, onPressed: () {
                        //
                        // }, trailingIcon: Icons.wifi),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const ForgotPass();
                                  },
                                ));
                              });
                            },
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            )),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: const BoxDecoration(
                                color: (Colors.black),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                                onPressed: () {
                                  if (loginKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("success")));
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return NavigationScreen();
                                      },));
                                    });
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            width: 40,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    googleSignInController.signInWithGoogle();

                                  });


                                },
                                icon: const Image(
                                    image: AssetImage(
                                      'assets/images/google.png',
                                    ))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not have an account?"),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Register();
                                  },
                                ));
                              });
                            },
                            child: const Text(
                              "Sign Up? ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ],
                    ),
                  ],

                );
              }
            },
          ),
        ),
      ),
    );



  }
}
