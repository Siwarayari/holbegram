// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:holbegram/utils/posts.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text(
            "Holbegram",
            style: TextStyle(fontFamily: "Billabong",fontSize: 40),
          ),
          Image.asset(
            "assets/images/logo.webp",
            width: 40,
            height: 40,
          ),
        ],
      )),
      body: Posts(),
    );
  }
}
