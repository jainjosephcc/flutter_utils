import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:industrielleads_seller/components/logout.dart';
import 'package:industrielleads_seller/controller/AuthController.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user_details');
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileTextWidgets(
            text: "${box.get('first_name', defaultValue: '')} ${box.get('last_name', defaultValue: '')}",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileTextWidgets(
            text: "${box.get('company_name', defaultValue: '')}",
            icon: "assets/icons/home.svg",
            press: () {},
          ),
          ProfileTextWidgets(
            text: "${box.get('email', defaultValue: '')}",
            icon: "assets/icons/envelope.svg",
            press: () {},
          ),
          ProfileTextWidgets(
            text: "${box.get('phone', defaultValue: '')}",
            icon: "assets/icons/Phone.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushNamed(context, Logout.routeName);
              logout();
            },
          ),
        ],
      ),
    );
  }
}
