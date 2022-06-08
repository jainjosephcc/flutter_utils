import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../size_config.dart';

class PaginatedProductList extends StatefulWidget {
  PaginatedProductList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _InvoiceListingState createState() => _InvoiceListingState();
}

class _InvoiceListingState extends State<PaginatedProductList> {
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Paginator.listView(
          key: paginatorGlobalKey,
          pageLoadFuture: sendCountriesDataRequest,
          pageItemsGetter: listItemsGetter,
          listItemBuilder: listItemBuilder,
          loadingWidgetBuilder: loadingWidgetMaker,
          errorWidgetBuilder: errorWidgetMaker,
          emptyListWidgetBuilder: emptyListWidgetMaker,
          totalItemsGetter: totalPagesGetter,
          pageErrorChecker: pageErrorChecker,
          scrollPhysics: BouncingScrollPhysics(),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          paginatorGlobalKey.currentState.changeState(
              pageLoadFuture: sendCountriesDataRequest, resetState: true);
        },
        child: Icon(Icons.refresh),
      ),*/
    );
  }

  Future<CountriesData> sendCountriesDataRequest(int page) async {
    try {
      var box = Hive.box('user_details');

      http.Response response = await http.get(
        Uri.parse(
            'https://beta.industrielleads.com/api/vendor/products/equipment?page=$page&perPage=10'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer ${box.get('token', defaultValue: '')}'
        },
      );
      return CountriesData.fromResponse(response);
    } catch (e) {
      if (e is IOException) {
        return CountriesData.withError(
            'Please check your internet connection.');
      } else {
        print(e.toString());
        return CountriesData.withError('Something went wrong.');
      }
    }
  }

  List<dynamic> listItemsGetter(CountriesData countriesData) {
    return countriesData.countries;
  }

  Widget listItemBuilder(value, int index) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Container(
            height: getProportionateScreenHeight(100),
            width: getProportionateScreenWidth(100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${value['featured_image']['url']}"))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Container(
                  width: getProportionateScreenWidth(150),
                  child: Text(
                    value['name'],
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: getProportionateScreenWidth(190),
                  child: Text(
                    value['slug'],
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(190),
                  child: Text(
                    value['vendor'],
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/price.svg',
                            color: kPrimaryColor,
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('${value['price']}',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)),
                              color: kPrimaryColor),
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(
                                5.0, 3, 5.0, 3),
                            child: Row(
                              children: [
                                Text("${value['_status']}",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(12),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),


              ],
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
    );
  }

  Widget loadingWidgetMaker() {
    return Container(
      alignment: Alignment.center,
      height: 160.0,
      child: CircularProgressIndicator(),
    );
  }

  Widget errorWidgetMaker(CountriesData countriesData, retryListener) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(countriesData.errorMessage),
        ),
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: retryListener,
          child: Text('Retry'),
        )
      ],
    );
  }

  Widget emptyListWidgetMaker(CountriesData countriesData) {
    return Text('NO data');
  }

  int totalPagesGetter(CountriesData countriesData) {
    return countriesData.total;
  }

  bool pageErrorChecker(CountriesData countriesData) {
    return countriesData.statusCode != 200;
  }
}

class CountriesData {
  List<dynamic> countries;
  int statusCode;
  String errorMessage;
  int total;
  int nItems;

  CountriesData.fromResponse(http.Response response) {
    this.statusCode = response.statusCode;
    Map<String, dynamic> responseData = jsonDecode(response.body);
    countries = responseData['data'];
    total = responseData['meta']['total'];
    nItems = countries.length;
  }

  CountriesData.withError(String errorMessage) {
    this.errorMessage = errorMessage;
  }
}
