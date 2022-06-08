import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:industrielleads_seller/controller/AuthController.dart';
import 'package:industrielleads_seller/screens/home/home_screen.dart';
import 'package:industrielleads_seller/screens/splash/splash_screen.dart';


class Logout extends StatefulWidget {
  static String routeName = "/logout";
  const Logout({Key key}) : super(key: key);


  @override
  _LogoutState createState() => _LogoutState();

}


class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('user_details').listenable(
        keys: ['token'],
      ),
      builder: (context, box, child) {
        String token = box.get('token', defaultValue: '');
        //if (token.isEmpty) return SplashScreen();
        return SplashScreen();
      },
    );
  }
}