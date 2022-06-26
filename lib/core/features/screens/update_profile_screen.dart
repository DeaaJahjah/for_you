import 'package:flutter/material.dart';
import 'package:for_you/core/features/auth/models/user_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName = '/update_profile_screen';
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)?.settings.arguments as UserModel;

    return Container();
  }
}
