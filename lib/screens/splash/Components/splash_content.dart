import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        /*Text(
          "INDUSTRIELLEADS",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),*/
       /* Image.asset(
          'assets/images/company_logo.png',
          height: getProportionateScreenHeight(170),
          width: getProportionateScreenWidth(235),
        ),*/
        Padding(
          padding: const EdgeInsets.fromLTRB(12,0,12,0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: kPrimaryColor,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(365),
          width: getProportionateScreenWidth(500),
        ),
      ],
    );
  }
}
