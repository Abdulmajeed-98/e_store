import 'package:flutter/material.dart';
import 'package:mokhtar_e_store/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false),
      //home: HomeScreen(),
      initialRoute: "/signup",
      onGenerateRoute: AppRoutes.routeManager,
      // routes: {
      //   "/home":(ctx)=>HomeScreen(),
      //   "/details":(ctx)=>DetailsScreen(),
      //   "/cart":(ctx)=>CartScreen(),
      //   "/splash":(ctx)=>SplashScreen(),
      //   "/login":(ctx)=>LoginScreen(),
      //
      // },
    );
  }
}
