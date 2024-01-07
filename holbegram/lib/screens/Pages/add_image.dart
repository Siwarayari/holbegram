// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:holbegram/methods/auth_methods.dart';
import 'package:holbegram/providers/user_provider.dart';
import 'package:holbegram/screens/Pages/methods/post_storage.dart';
import 'package:holbegram/screens/home.dart';
import 'package:holbegram/widgets/bottom_nav.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  final String email;
  final String password;
  final String username;
  const AddImage(
      {super.key,
      required this.email,
      required this.password,
      required this.username});

  @override
  State<AddImage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddImage> {
  Uint8List? _image;
  final TextEditingController captionController = TextEditingController();

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
      appBar: AppBar(
        title: Text(
          "Add Image",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              UserProvider userProvider = UserProvider();
              String newpost = await PostStorage().uploadPost(
                  captionController.text,
                  userProvider.user!.uid,
                  userProvider.user!.username,
                  userProvider.user!.photoUrl,
                  _image!);
              if (newpost == "ok") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              textStyle: const TextStyle(
                fontSize: 40,
                fontFamily: 'Billabong',
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Post'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 28,
          ),
          Text(
            "Add Image",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              Text(
                "Choose an image from your gallery or take a new one",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  controller: captionController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Write a caption...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              _image == null
                  ? Image.asset(
                      "assets/images/add.webp",
                      width: 250,
                      height: 350,
                    )
                  : Container(
                      width: 250,
                      height: 350,
                      decoration: BoxDecoration(
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
            ],
          )
        ]),
      ),
    );
  }
}
