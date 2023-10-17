import 'package:first_app/utilities/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool animation = true;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    setState(() {
      animation = !animation;
    });

    await Future.delayed(const Duration(milliseconds: 500));
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, RoutePage.homepage);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 253, 252, 252),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              // ignore: unnecessary_string_escapes
              "assets/images/Screenshot(31).png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Welcome $name",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cant be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cant be empty";
                        } else if (value.length <= 6) {
                          return "Length must be > 6";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 50,
                            width: animation ? 150 : 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              shape: !animation
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                              // borderRadius: animation?BorderRadius.circular(10):BorderRadius.circular(50)
                            ),
                            child: !animation
                                ? const Icon(Icons.done_outline_sharp)
                                : const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                        onTap: () {
                          if (_formKey.currentState!.validate())
                          {
                            moveToHome(context);
                          }
                            
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
