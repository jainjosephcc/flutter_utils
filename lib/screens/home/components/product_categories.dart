import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:industrielleads_seller/constants.dart';
import 'package:industrielleads_seller/screens/home/components/product_category_listing_card.dart';

import '../../../size_config.dart';

class ProductCategories extends StatelessWidget {
  //const ProductCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"image": "assets/images/img_mac.jpg","count":23, "text": "Equipment & Machinery"},
      {"image": "assets/images/img_spa.jpg","count":12, "text": "Spares"},
      {"image": "assets/images/img_che.jpeg","count":3, "text": "Chemicals & Lubs"},
      {"image": "assets/images/img_ele.jpeg","count":4, "text": "Electrical"},
      {"image": "assets/images/img_saf.jpeg","count":25, "text": "Safety & PPE"},
      {"image": "assets/images/img_ser.jpeg","count":0, "text": "Services"},
    ];
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Marketplace',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                ),
              ),
            ],
          )
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categories.length,
                (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: ProductCategoryListingCard(
                image: categories[index]["image"],
                text: categories[index]["text"],
                count:categories[index]["count"] ,
                //press: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
