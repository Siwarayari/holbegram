import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:holbegram/models/posts.dart';
import 'package:holbegram/screens/auth/methods/user_storage.dart';

class PostStorage {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String caption, String uid, String username,
      String profImage, Uint8List image) async {
    try {
      String postlink =
          await StorageMethods().uploadImageToStorage(true, 'posts', image);
      Post post = Post(
        caption: caption,
        uid: uid,
        username: username,
        likes: [],
        postId: uid,
        datePublished: DateTime.now(),
        postUrl: postlink,
        profImage: profImage,
      );
      await _firestore.collection("posts").doc(post.uid).set(post.toJson());
      return "ok";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection("posts").doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
