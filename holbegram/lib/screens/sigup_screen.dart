import 'package:flutter/material.dart';
import 'package:holbegram/screens/login_screen.dart';
import 'package:holbegram/screens/upload_image_screen.dart';
import 'package:holbegram/widgets/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  bool _passwordVisible = true;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
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
              Text(
                "Sign up to see photos and videos from your friends",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
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
                      controller: emailController,
                      ispassword: false,
                      hintText: "Full Name",
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
                      height: 24,
                    ),
                    TextFieldInput(
                      controller: passwordController,
                      ispassword: !_passwordVisible,
                      hintText: "Confirm Password",
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
                        onPressed: () {
                          String email = emailController.text;
                          String username = emailController.text;
                          String password = passwordController.text;
                          String confirmpassword =
                              passwordConfirmController.text;
                          if (password == confirmpassword) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPicture(
                                          email: email,
                                          password: password,
                                          username: username,
                                        )));
                          } else {
                            SnackBar(
                              content: Text("Wrong Password Please Try Again"),
                            );
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(218, 226, 37, 24),
                        )),
                        child: Text(
                          "Sign up",
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
                        Text("Have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(218, 226, 37, 24)),
                            )),
                      ],
                    ),
                    Flexible(flex: 0, child: Container()),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
