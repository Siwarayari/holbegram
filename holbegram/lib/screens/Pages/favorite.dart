// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:holbegram/methods/auth_methods.dart';
import 'package:holbegram/providers/user_provider.dart';
import 'package:holbegram/screens/Pages/methods/post_storage.dart';
import 'package:holbegram/screens/home.dart';
import 'package:holbegram/widgets/bottom_nav.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Favorite",
            style: TextStyle(
              fontSize: 50,
              fontFamily: 'Billabong',
            ),
          ),
        ),
        body: Placeholder(
          child: Scaffold(),
        ));
  }
}
