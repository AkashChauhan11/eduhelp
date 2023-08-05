import 'package:education/screens/mainpage.dart';
import 'package:education/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.35,
                child: Image.asset(
                  'assets/images/login.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Enter your email",
                        focusColor:
                            Theme.of(context).colorScheme.onPrimaryContainer)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        hintText: "Enter your password",
                        focusColor:
                            Theme.of(context).colorScheme.onPrimaryContainer)),
              ),
              const SizedBox(
                width: double.infinity,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      textAlign: TextAlign.right,
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  },
                  child: const Text("Login"),
                ),
              ),
              Stack(
                children: [
                  const Divider(endIndent: 15, indent: 15),
                  Positioned(
                    right: size.width * 0.5,
                    child: Container(
                        color: Colors.white,
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/google_icon.png'),
                      ),
                      const SizedBox(width: 10),
                      const Text("Sign in with Google")
                    ],
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: "didn't Have a account? ",
                        style: TextStyle(color: Colors.grey)),
                    TextSpan(
                      text: "Signup",
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
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
    );
  }
}
