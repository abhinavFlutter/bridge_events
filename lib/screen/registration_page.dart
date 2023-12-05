import 'package:bridge_events/screen/login_page.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegState();
}

class _RegState extends State<Register> {
  var loginKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var password = TextEditingController();
  var confirm = TextEditingController();

  // var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool passVisible = false;
  bool confirmPassVisible = false;

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
                      controller: name,
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
                      controller: password,
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
                      controller: confirm,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ("Re-enter your password");
                        }
                        if (value != password.text) {
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
                                onPressed: () {
                                  if (loginKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text("Success")));
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
                                    onPressed: () {},
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
