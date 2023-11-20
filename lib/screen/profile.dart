import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("Edit Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800)),
      ),
      body: Form(
          key: loginKey,
          child: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Stack(children: [
                      const CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                      ),
                      Positioned(
                          left: 115,
                          top: 110,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                size: 40,
                              )))
                    ]),
                  ),
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
                            hintText: " Name",
                            hintStyle: TextStyle(color: Colors.black),
                            // labelText: ' Email',
                            // labelStyle: TextStyle(color: Colors.black),
                            suffixIcon: Icon(Icons.alternate_email, size: 15),
                            filled: true,
                            fillColor: Color.fromARGB(129, 129, 129, 129)),
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Enter your name";
                          }
                          return null;
                        },
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
                      )),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black),
                      child: TextButton(
                          onPressed: () {
                            if(loginKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Done")));
                            }
                          },
                          child: const Text(
                            "Save",style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
