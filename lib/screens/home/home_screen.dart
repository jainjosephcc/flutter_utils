import 'package:flutter/material.dart';
import 'package:industrielleads_seller/components/coustom_bottom_nav_bar.dart';
import 'package:industrielleads_seller/screens/home/components/marketplace_card.dart';
import '../../size_config.dart';
import '../../enums.dart';
import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/product_categories.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(5)),
            DiscountBanner(),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(20)),
            MarketPlaceCard(),
            SizedBox(height: getProportionateScreenWidth(30)),
          //  ProductCategories(),
            //PopularProducts(),
            /*SizedBox(height: getProportionateScreenWidth(30)),*/
          ],
        ),
      ),
    );
  }
}
