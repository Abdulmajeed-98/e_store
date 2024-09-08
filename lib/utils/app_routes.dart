import 'package:flutter/material.dart';
import 'package:mokhtar_e_store/views/cart_screen.dart';
import 'package:mokhtar_e_store/views/demo_screen.dart';
import 'package:mokhtar_e_store/views/details_screen.dart';
import 'package:mokhtar_e_store/views/home_screen.dart';
import 'package:mokhtar_e_store/views/login_screen.dart';
import 'package:mokhtar_e_store/views/not_found.dart';
import 'package:mokhtar_e_store/views/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? routeManager(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      case '/details':
        return MaterialPageRoute(
            builder: (ctx) => DetailsScreen(), settings: settings);
      case '/cart':
        return MaterialPageRoute(builder: (ctx) => CartScreen());
      case '/splash':
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (ctx) => LoginScreen());
      case '/demo':
      return MaterialPageRoute(builder: (ctx) => DemoScreen());
      default:
          return MaterialPageRoute(builder: (ctx) => NotFoundScreen());
    }
  }
}
