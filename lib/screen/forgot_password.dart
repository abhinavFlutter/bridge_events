import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

var emailController = TextEditingController();

class _ForgotPassState extends State<ForgotPass> {
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: loginKey,
          child: ListView(
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 220),
                child: Text("Forgot Your Password?",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w700,color: Colors.red)),
              )),
              const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("Enter the Email address associated with",
                    style: TextStyle(color: Colors.grey)),
              )),
              const Center(
                  child: Text(
                "Your account",
                style: TextStyle(color: Colors.grey),
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                        onPressed: () {
                          if (loginKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Success")));
                          }
                        },
                        child: const Text(
                          "Verify Email",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
