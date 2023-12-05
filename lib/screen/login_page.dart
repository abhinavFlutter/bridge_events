import 'package:bridge_events/screen/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

import 'forgot_password.dart';
import 'home_page.dart';

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

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            body: Form(
              key: loginKey,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
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
                                        return DrawerScreen();
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
              ),
            ),
          );

  }
}
