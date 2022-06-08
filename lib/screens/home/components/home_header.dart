import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical:getProportionateScreenHeight(5) ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Image.asset('assets/images/app_icon.png',height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),),
          SearchField(),
          //SvgPicture.asset("assets/icons/app_icon.svg"),
          /*IconBtnWithCounter(
            svgSrc: "assets/icons/app_icon.svg",
            press: () {},
          ),*/
         /* IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),*/
        ],
      ),
    );
  }
}
