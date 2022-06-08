import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:industrielleads_seller/screens/LogoAnimation.dart';
import 'package:industrielleads_seller/screens/home/home_screen.dart';
import 'package:industrielleads_seller/screens/splash/splash_screen.dart';
import 'package:industrielleads_seller/theme.dart';
import 'package:industrielleads_seller/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:industrielleads_seller/wrapper.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("user_details");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Industrielleads',
      theme: theme(),
      initialRoute: LogoAnimation.routeName,
      routes: routes,
    );
  }
}


