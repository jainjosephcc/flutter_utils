import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:industrielleads_seller/constants.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user_details');
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "Hi ${box.get('first_name', defaultValue: '')}\n",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: "\n"),
            TextSpan(text: "Welcome to your Industrielleads Seller Dashboard"),
          ],
        ),
      ),
    );
  }
}
