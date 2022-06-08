import 'package:flutter/material.dart';
import 'package:industrielleads_seller/screens/product_list/paginated_product_list.dart';
import 'package:industrielleads_seller/screens/product_list/product_listing.dart';

import '../../../size_config.dart';


class MarketPlaceCard extends StatelessWidget {
  const MarketPlaceCard({
    Key key,
  }) : super(key: key);

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaginatedProductList(title: '${categories[0]['text']}',)),
                  );
                },
                child: SpecialOfferCard(
                  image: "${categories[0]['image']}",
                  category: "${categories[0]['text']}",
                  numOfBrands: categories[0]['count'],
                ),
              ),
              SpecialOfferCard(
                image: "${categories[1]['image']}",
                category: "${categories[1]['text']}",
                numOfBrands: categories[1]['count'],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpecialOfferCard(
                image: "${categories[2]['image']}",
                category: "${categories[2]['text']}",
                numOfBrands: categories[2]['count'],
              ),
              SpecialOfferCard(
                image: "${categories[3]['image']}",
                category: "${categories[3]['text']}",
                numOfBrands: categories[3]['count'],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpecialOfferCard(
                image: "${categories[4]['image']}",
                category: "${categories[4]['text']}",
                numOfBrands: categories[4]['count'],
              ),
              SpecialOfferCard(
                image: "${categories[5]['image']}",
                category: "${categories[5]['text']}",
                numOfBrands: categories[5]['count'],
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        height: getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.30),
                      Color(0xFF343434).withOpacity(0.70),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15.0),
                  vertical: getProportionateScreenWidth(10),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "$category\n",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "$numOfBrands Products")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
