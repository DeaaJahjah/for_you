import 'package:flutter/material.dart';
import 'package:for_you/core/features/auth/models/post.dart';
import 'package:for_you/core/features/services/post_db_service.dart';

class DataProvider extends ChangeNotifier {
  List<Post> posts = [];

  fecthData() async {
    posts = await PostDbService().getPosts();
    notifyListeners();
  }
}
