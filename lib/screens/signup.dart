import 'package:education/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController cpasswordcontroller = TextEditingController();

    // void submit() {
    //   if (namecontroller.text.isEmpty ||
    //       emailcontroller.text.isEmpty ||
    //       passwordcontroller.text.isEmpty ||
    //       cpasswordcontroller.text.isEmpty) {
    //     // show error dialog to fill all the fields
    //     return;
    //   }
    //   if (passwordcontroller.text != cpasswordcontroller.text) {
    //     //show dialog for password doesn't match
    //     return;
    //   }
    //   try {
    //     AuthService.signup(
    //         namecontroller.text, emailcontroller.text, passwordcontroller.text);
    //   } catch (e) {
    //     print("SOmething went wrong");
    //   }
    // }

    final size = MediaQuery.of(context).size;
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: size.longestSide,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/signup.png',
                    ),
                    radius: size.shortestSide * 0.40,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: "Enter your Name",
                            focusColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: "Enter your Email",
                            focusColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: "Enter your password",
                            focusColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: cpasswordcontroller,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: "Confirm password",
                            focusColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          maximumSize: const Size.fromHeight(50)),
                      onPressed: () {},
                      child: const Text("Sign Up"),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
