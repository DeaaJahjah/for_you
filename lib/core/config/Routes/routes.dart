import 'package:flutter/material.dart';
import 'package:for_you/core/features/auth/screens/login_screen.dart';
import 'package:for_you/core/features/auth/screens/sign_up_screen.dart';
import 'package:for_you/core/features/screens/favourite_screen.dart';
import 'package:for_you/features/home_screen/home.dart';
import 'package:for_you/features/notification/notification_screen.dart';
import 'package:for_you/features/search/search_screen.dart';
import 'package:for_you/features/splash_screen/splash_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) =>  SplashScreen());
      case LoginScreen.routeName:
      return MaterialPageRoute(builder: ((_) =>  LoginScreen() ));
   case SignUpScreen.routeName:
      return MaterialPageRoute(builder: ((_) =>  SignUpScreen() ));
       case HomeScreen.routeName:
      return MaterialPageRoute(builder: ((_) => HomeScreen() ));
       case SearchScreen.routeName:
      return MaterialPageRoute(builder: ((_) => SearchScreen() ));
      case FavouriteScreen.routeName:
      return MaterialPageRoute(builder: ((_) => FavouriteScreen() ));
        case NotificationScreen.routeName:
      return MaterialPageRoute(builder: ((_) => NotificationScreen() ));
   
  }

  return null;
}
