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
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  InkWell(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 50,
                      width: animation?150:50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          shape: !animation? BoxShape.circle:BoxShape.rectangle,
                          // borderRadius: animation?BorderRadius.circular(10):BorderRadius.circular(50)
                          ),
                      child: !animation ? const Icon(Icons.done_outline_sharp) : const Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ),
                    onTap: () async {
                      setState(() {
                        animation = !animation;
                      });

                      await Future.delayed(const Duration(milliseconds: 500));
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, RoutePage.homepage);
                    },
                  )

                  // ElevatedButton(
                  //   style:
                  //       TextButton.styleFrom(minimumSize: const Size(150, 50)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, RoutePage.homepage);
                  //   },
                  //   child: const Text("Login"),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
