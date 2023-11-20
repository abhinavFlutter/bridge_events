import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _BridgeState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();

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
                child: Text("Bridge Communication",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
              )),
              const Center(
                  child: Image(
                image: AssetImage(
                    'assets/images/transparent-wedding-couple-silhouette-651a2e42012dc1.9005915916962145940048.png'),
                // height: 400,
                // width: 400,
              )),
              const Center(
                  child: Text(
                'welcome Back!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "welcome back to the best. we're\n always here, waiting for you!",
                    style: TextStyle(wordSpacing: 3, letterSpacing: 2)),
              )),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50, top: 15),
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
                        return ("please enter your email");
                      }
                      if (!RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(value)) {
                        return "enter a valid email address";
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50, top: 25),
                child: TextFormField(
                    // maxLength: 8,obscureText: true,obscuringCharacter: "*",
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: " Password",
                        hintStyle: TextStyle(color: Colors.black),
                        suffixIcon: Icon(Icons.lock_outline, size: 15),
                        filled: true,
                        fillColor: Color.fromARGB(129, 129, 129, 129)),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ("please enter your password");
                      }
                      if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
                          .hasMatch(value)) {
                        return "enter valid password";
                      }
                      return null;
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
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
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: TextButton(
                          onPressed: () {
                            if (loginKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("success")));
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
                children: [const Text("Not have an account?"),
                  TextButton(
                      onPressed: () {},
                      child:const Text(
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
