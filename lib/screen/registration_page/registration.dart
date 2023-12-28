
import 'package:bridge_events/controller/email_pass_controller/email_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/google_controller/google_controller_file.dart';
import '../login_page/login.dart';
import 'email_validation.dart';

class Register extends StatefulWidget {
  const Register({super.key});


  @override
  State<Register> createState() => _RegState();
}


class _RegState extends State<Register> {
  var loginKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  // var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool passVisible = false;
  bool confirmPassVisible = false;

  GoogleSignInController googleSignInController=GoogleSignInController();
EmailPassController emailPassController=EmailPassController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Form(
            key: loginKey,
            child: Container(
              height: double.infinity,width: double.infinity,
              color: Colors.white,
              child: ListView(children: [
                const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Register",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900)),
                    )),
                Image(image: AssetImage('assets/images/registerorg.jpg')),

                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 50, left: 50, top: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          hintText: " Name",
                          hintStyle: TextStyle(color: Colors.black),
                          suffixIcon: Icon(Icons.person_add, size: 15),
                          filled: true,
                          fillColor: Color.fromARGB(129, 129, 129, 129)),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ("Please enter your name");
                        }
                        if (!RegExp(r'^[A-Za-z]+([\ A-Za-z]+)$')
                            .hasMatch(value)) {
                          return "Enter your name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 50, left: 50, top: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(color: Colors.black),
                          suffixIcon: Icon(Icons.phone_android, size: 15),
                          filled: true,
                          fillColor: Color.fromARGB(129, 129, 129, 129)),
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ("Please enter your number");
                        }

                        if (!RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$')
                            .hasMatch(value)) {
                          return "Enter phone number";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 50, left: 50, top: 25),
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
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black),
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
                      obscureText: !passVisible,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passVisible = !passVisible;
                                });
                              },
                              icon: Icon(passVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              iconSize: 17),
                          filled: true,
                          fillColor:
                          const Color.fromARGB(129, 129, 129, 129)),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ("Please choose a stronger password.\n Try a mix of letters, numbers and symbols.");
                        }
                        if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                            .hasMatch(value)) {
                          return "Enter  valid password";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 50, left: 50, top: 25),
                    child: TextFormField(
                      maxLength: 12,
                      obscureText: !confirmPassVisible,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(color: Colors.black),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                confirmPassVisible = !confirmPassVisible;
                              });
                            },
                            icon: Icon(confirmPassVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            iconSize: 17,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(129, 129, 129, 129)),
                      controller: confirmController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ("Re-enter your password");
                        }
                        if (value != passwordController.text) {
                          return 'Password must be same';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Row(
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
                                onPressed: () async{
                                  if (loginKey.currentState!.validate()) {
                                    emailPassController.updateLoading();


                                    try {
                                      await emailPassController.signupUser(
                                        emailController.text,
                                        passwordController.text,
                                        nameController.text,
                                      );

                                      if (emailPassController.currentUser !=
                                          null) {
                                        Get.off(
                                                () => EmailValidationScreen(
                                                user: emailPassController
                                                    .currentUser!),
                                            transition:
                                            Transition.leftToRightWithFade);
                                      } else {
                                        // No user is currently authenticated
                                        Get.snackbar('No user is',
                                            'currently authenticated');
                                      }

                                    }
                                    catch(e){

                                    }
                                  }
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(
                            children: [
                              Container(
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(child: Text("Already have an account?")),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Login();
                                },
                              ));
                            });
                          },
                          child: const Text(
                            "Login",
                            style:
                            TextStyle(fontSize: 17, color: Colors.black),
                          ))
                    ],
                  )
                ]),
              ]),
            )));
  }
}
