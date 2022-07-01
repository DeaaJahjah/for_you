import 'package:flutter/material.dart';
import 'package:for_you/core/features/auth/screens/login_screen.dart';
import 'package:for_you/core/features/auth/screens/sign_up_screen.dart';

import 'package:for_you/features/chat/messages_screen.dart';

import 'package:for_you/features/home_screen/home.dart';
import 'package:for_you/features/profile/profile_screen.dart';
import 'package:for_you/features/profile/update_profile_screen.dart';
import 'package:for_you/features/screens/add_post.dart';
import 'package:for_you/features/screens/details_screen.dart';
import 'package:for_you/features/screens/edit_post_screen.dart';
import 'package:for_you/features/screens/favourite_screen.dart';
import 'package:for_you/features/screens/help_screen.dart';
import 'package:for_you/features/screens/my_posts_screen.dart';

import 'package:for_you/features/search/search_screen.dart';
import 'package:for_you/features/splash_screen/splash_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const LoginScreen()));
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const SignUpScreen()));
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const HomeScreen()));
    case SearchScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const SearchScreen()));
    case FavouriteScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const FavouriteScreen()));
    case MessagesScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const MessagesScreen()));
    case MyPostsScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const MyPostsScreen()));
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const ProfileScreen()));
    case AddPostScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const AddPostScreen()));

    case DetailsScreen.routeName:
      return MaterialPageRoute(builder: ((_) => DetailsScreen()));

    case EditPostScreen.routeName:
      return MaterialPageRoute(
          builder: ((_) => const EditPostScreen()), settings: settings);
    case UpdateProfileScreen.routeName:
      return MaterialPageRoute(
          builder: ((_) => const UpdateProfileScreen()), settings: settings);

    case HelpScreen.routeName:
      return MaterialPageRoute(builder: ((_) => const HelpScreen()));
  }

  return null;
}
