import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCategoryListingCard extends StatelessWidget {

  const ProductCategoryListingCard({
    Key key,
    @required this.image,
    @required this.text,
    @required this.count,

  }) : super(key: key);

  final String image, text;
  final int count;


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset('$image',height: getProportionateScreenWidth(100),width: getProportionateScreenWidth(100),fit: BoxFit.cover,),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$text',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontSize: 15),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Row(
                children: [
                  Container(
                    //padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('$count',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: kPrimaryColor))),
                  ),
                  Text(
                      '  Products',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.grey)
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
