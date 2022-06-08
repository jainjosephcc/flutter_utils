import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:industrielleads_seller/wrapper.dart';

class LogoAnimation extends StatelessWidget {
  static String routeName = "/logoanim";
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Wrapper()));
    });
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('HAI '),
        ),
      ),
    );
  }
}
