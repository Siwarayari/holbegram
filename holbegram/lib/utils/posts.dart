// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:holbegram/screens/Pages/methods/post_storage.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        }
        if (snapshot.hasError) {
          List datas = snapshot.data!.docs;
          for (var data in datas) {
            final String profImage = data['profImage'];
            final String username = data['username'];
            final String caption = data['caption'];
            final String postUrl = data['postUrl'];
            final String postidtodel = data['postId'];
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsetsGeometry.lerp(
                    const EdgeInsets.all(8), const EdgeInsets.all(8), 10),
                height: 540,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(profImage),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Text(username),
                        Spacer(),
                        IconButton(
                            onPressed: () async {
                              await PostStorage().deletePost(postidtodel);
                              SnackBar(
                                content: Text("Post Deleted"),
                              );
                            },
                            icon: Icon(Icons.more_horiz)),
                        SizedBox(
                          child: Text(caption),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 350,
                          height: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                  image: NetworkImage(postUrl),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
