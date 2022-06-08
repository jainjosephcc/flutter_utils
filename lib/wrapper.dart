import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:industrielleads_seller/screens/home/home_screen.dart';
import 'package:industrielleads_seller/screens/landing_home.dart';
import 'package:industrielleads_seller/screens/sign_in/sign_in_screen.dart';
import 'package:industrielleads_seller/screens/splash/splash_screen.dart';

class Wrapper extends StatelessWidget {
  static String routeName = "/wrapper";
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('user_details').listenable(
        keys: ['token'],
      ),
      builder: (context, box, child) {
        String token = box.get('token', defaultValue: '');
        print("token $token");
        if (token.isEmpty) return SignInScreen();
        //return HomeScreen();
        return MyStatefulWidget();
      },
    );
  }
}