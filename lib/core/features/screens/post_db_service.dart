

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/features/auth/models/post.dart';

class PostDbService{
final FirebaseFirestore db = FirebaseFirestore.instance;
  addPost(Post post,BuildContext context)async{
try{
await    db.collection('posts').add(post.toJson());
}
on FirebaseException catch(e){
  SnackBar snackBar = SnackBar(content: Text(e.message.toString()));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
  }
  Future<List<Post>>getPosts() async{
 List<Post> posts=[];
 
 var query = await db.collection('posts').where('is_available',isEqualTo: true).get();


 for (var doc in query.docs) {
  posts.add(Post.fromFirestore(doc));
 }
return posts;

 }
Future<Post> getPostById(String id)async{
 var doc = await db.collection('posts').doc(id).get();

 return Post.fromFirestore(doc);

 }

}