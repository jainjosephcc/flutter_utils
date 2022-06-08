import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:industrielleads_seller/constants.dart';
import 'package:industrielleads_seller/screens/add_category/add_category_page.dart';
import 'package:industrielleads_seller/screens/profile/profile_screen.dart';

import '../size_config.dart';
import 'add_product/add_product_page.dart';
import 'home/home_screen.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AddProduct(),
    AddCategory(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    SizeConfig().init(context);
    return Scaffold(
        appBar: EmptyAppBar(),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/Shop Icon.svg",
                        color: _selectedIndex == 0
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                      title: Container()),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/add-file.svg",
                        color: _selectedIndex == 1
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                      title: Container()),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/Chat bubble Icon.svg",
                        color: _selectedIndex == 2
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                      title: Container()),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/User Icon.svg",
                        color: _selectedIndex == 3
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                      title: Container()),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: kPrimaryColor,
                onTap: _onItemTapped,
              ),
            )));
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
