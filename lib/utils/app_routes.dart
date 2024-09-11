import 'package:flutter/material.dart';
import 'package:mokhtar_e_store/models/product.dart';
import 'package:mokhtar_e_store/views/cart_screen.dart';
import 'package:mokhtar_e_store/views/details_screen.dart';
import 'package:mokhtar_e_store/views/fav_screen.dart';
import 'package:mokhtar_e_store/views/home_screen.dart';
import 'package:mokhtar_e_store/views/login_screen.dart';
import 'package:mokhtar_e_store/views/not_found.dart';
import 'package:mokhtar_e_store/views/order_form_screen.dart';
import 'package:mokhtar_e_store/views/signup_screen.dart';
import 'package:mokhtar_e_store/views/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? routeManager(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      case '/details':
        {
          Product product = settings.arguments as Product;
          return MaterialPageRoute(
              builder: (ctx) => DetailsScreen(p: product), settings: settings);
        }
      case '/cart':
        {
          List<Map<Product, int>> cartItems =
              settings.arguments as List<Map<Product, int>>;
          return MaterialPageRoute(
              builder: (ctx) => CartScreen(cart: cartItems));
        }
      case '/splash':
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (ctx) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (ctx) => SignupScreen());
      case '/order':
      return MaterialPageRoute(builder: (ctx) => OrderFormScreen());
      case '/fav':
        return MaterialPageRoute(builder: (ctx) => FavScreen());
      default:
        return MaterialPageRoute(builder: (ctx) => NotFoundScreen());
    }
  }
}
