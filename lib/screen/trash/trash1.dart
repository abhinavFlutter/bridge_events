import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(child: Text("Sign Up",style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold
          ),)),
        ),

        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/images/img2.jpg'))),
          child: Column(children: [

            Padding(padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    label: const Text("User name",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )

                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(
                        color: Colors.white
                    ),
                    label: const Text("Password",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )

                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(onPressed: () {

                }, child: const Text("Forgot Password ?",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold

                ),))
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.pink,
                ),
                width: 500,
                height: 50,
                child: TextButton(onPressed: () {

                }, child: const Text("Login",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: () {

              }, child: const Text("New user? Create new account",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),)
              ),
            ),
          ]),
        ),
      ),
    );
  }
}