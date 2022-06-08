import 'package:flutter/widgets.dart';
import 'package:industrielleads_seller/components/logout.dart';
import 'package:industrielleads_seller/screens/LogoAnimation.dart';
import 'package:industrielleads_seller/screens/home/home_screen.dart';
import 'package:industrielleads_seller/screens/profile/profile_screen.dart';
import 'package:industrielleads_seller/screens/sign_in/sign_in_screen.dart';
import 'package:industrielleads_seller/screens/splash/splash_screen.dart';
import 'package:industrielleads_seller/wrapper.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  Logout.routeName: (context) => Logout(),
  HomeScreen.routeName: (context) => HomeScreen(),
  Wrapper.routeName: (context) => Wrapper(),
  LogoAnimation.routeName: (context) => LogoAnimation(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  /*ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ,*/
};
