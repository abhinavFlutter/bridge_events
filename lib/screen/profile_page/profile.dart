import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final loginKey = GlobalKey<FormState>();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: loginKey,
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 650,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/front-view-angry-model.jpg'),colorFilter: ColorFilter.mode(Colors.black45, BlendMode.colorBurn),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    "Profile",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900,color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 470),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                width: 300,
                                height: 280,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                child: Column(
                                  verticalDirection: VerticalDirection.down,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, left: 0, top: 27),
                                      child: SizedBox(
                                        height: 40,width: 250,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            hintText: " Name",
                                            hintStyle: TextStyle(color: Colors.black),
                                            suffixIcon: Icon(
                                              Icons.drive_file_rename_outline,
                                              size: 15,
                                            ),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Enter your name";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                      EdgeInsets.only(right: 0, left: 0, top: 15),
                                      child: SizedBox(
                                        height: 60,width: 250,
                                        child: IntlPhoneField(
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            hintText: " Mobile",
                                            hintStyle: TextStyle(color: Colors.black,),
                                            suffixIcon: Icon(Icons.phone_android, size: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                          initialCountryCode: 'IN',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, left: 0, top: 09),
                                      child: SizedBox(
                                        height: 40,width: 250,
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: const InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            hintText: " Email",
                                            hintStyle: TextStyle(color: Colors.black),
                                            suffixIcon: Icon(Icons.alternate_email, size: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                          controller: emailController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "enter your email address";
                                            }
                                            if (!RegExp(
                                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                                .hasMatch(value)) {
                                              return "Enter a valid email address";
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, left: 0, top: 15),
                                      child: SizedBox(
                                        height: 40,width: 250,
                                        child: TextFormField(
                                          obscureText: true,
                                          obscuringCharacter: "*",
                                          decoration: const InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            hintText: " Password",
                                            hintStyle: TextStyle(color: Colors.black),
                                            suffixIcon: Icon(Icons.password_outlined, size: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                          controller: passwordController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Enter your password";
                                            }
                                            if (!RegExp(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                                                .hasMatch(value)) {
                                              return "Enter a valid password";
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 150, right: 150),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    // Add your button functionality here
                  },
                  child: Text("Done", style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
