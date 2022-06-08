import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/cat_mac.svg", "text": "Machinery"},
      {"icon": "assets/icons/cat_spa.svg", "text": "Spares"},
      {"icon": "assets/icons/cat_che.svg", "text": "Chemical"},
      {"icon": "assets/icons/cat_ele.svg", "text": "Electrical"},
      {"icon": "assets/icons/cat_saf.svg", "text": "Safety"},
      {"icon": "assets/icons/cat_ser.svg", "text": "Services"},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Categories',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.black,
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: CategoryCard(
                    icon: categories[index]["icon"],
                    text: categories[index]["text"],
                    press: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon,color: Color(0xFFFF7643),),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
