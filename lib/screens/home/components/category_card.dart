import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:industrielleads_seller/constants.dart';

class CategoriesCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  const CategoriesCard({
    Key key,
    this.svgSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      shadowColor: kPrimaryColor,
      elevation: 3,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Spacer(),
                SvgPicture.asset(svgSrc),
                Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
