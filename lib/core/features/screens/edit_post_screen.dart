import 'package:flutter/material.dart';
import 'package:for_you/core/features/auth/models/post.dart';

class EditPostScreen extends StatefulWidget {
  static const String routeName = '/edit_post_screen';
  const EditPostScreen({Key? key}) : super(key: key);

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)?.settings.arguments as Post;

    return Container();
  }
}
