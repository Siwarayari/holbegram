// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:holbegram/methods/auth_methods.dart';
import 'package:image_picker/image_picker.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;
  const AddPicture(
      {super.key,
      required this.email,
      required this.password,
      required this.username});

  @override
  State<AddPicture> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddPicture> {
  Uint8List? _image;

  void selectImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _image = bytes;
      });
    }
  }

  void selectImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _image = bytes;
      });
    }
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
                    Text(
                      "Hello, ${widget.username} Doe Welcome to Holbegram",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Choose an image from your gallery or take a new one",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    _image == null
                        ? Image.asset(
                            "assets/images/Sample_User_Icon.png",
                            width: 250,
                            height: 350,
                          )
                        : Container(
                            width: 250,
                            height: 350,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: MemoryImage(_image!),
                              ),
                            )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.photo,
                            color: Color.fromARGB(218, 226, 37, 24),
                            size: 40,
                          ),
                          onPressed: () {
                            selectImageFromGallery();
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Color.fromARGB(218, 226, 37, 24),
                            size: 40,
                          ),
                          onPressed: () {
                            selectImageFromCamera();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(218, 226, 37, 24),
                          ),
                        ),
                        onPressed: () async {
                          String email = widget.email;
                          String username = widget.username;
                          String password = widget.password;
                          String result = await AuthMethode()
                              .signUpUser(email: email,username: username, password: password,file: _image);
                          if (result == "success") {
                            SnackBar(
                              content: Text("Success"),
                            );
                          } else {
                            SnackBar(
                              content: Text(result.toString()),
                            );
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
