import 'package:flutter/material.dart';
import 'package:for_you/core/features/auth/Services/post_db_service.dart';
import 'package:for_you/core/features/auth/models/post.dart';

class DataProvider extends ChangeNotifier {
  List<Post> posts = [];

  fecthData() async {
    posts = await PostDbService().getPosts();
    notifyListeners();
  }
}
