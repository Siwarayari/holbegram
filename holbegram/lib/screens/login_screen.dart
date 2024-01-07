// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:holbegram/methods/auth_methods.dart';
import 'package:holbegram/screens/signup_screen.dart';
import 'package:holbegram/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 28,
              ),
              Text(
                "Holbegram",
                style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
              ),
              Image.asset(
                "assets/images/logo.webp",
                width: 80,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 28,
                    ),
                    TextFieldInput(
                      controller: emailController,
                      ispassword: false,
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFieldInput(
                      controller: passwordController,
                      ispassword: !_passwordVisible,
                      hintText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        alignment: Alignment.bottomLeft,
                        icon: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          String email = emailController.text;
                          String password = passwordController.text;
                          String result = await AuthMethode()
                              .login(email: email, password: password);
                          if (result == "success") {
                            SnackBar(
                              content: Text("login success"),
                            );
                          } else {
                            SnackBar(
                              content: Text(result),
                            );
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(218, 226, 37, 24),
                        )),
                        child: Text(
                          "Log in",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forgot your login details? "),
                        Text(
                          "Get help logging in",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Flexible(flex: 0, child: Container()),
                    SizedBox(
                      height: 24,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(218, 226, 37, 24)),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Divider(
                          thickness: 2,
                        )),
                        Text("OR"),
                        Flexible(
                            child: Divider(
                          thickness: 2,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",
                          width: 40,
                          height: 40,
                        ),
                        Text("Sign in with Google")
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
