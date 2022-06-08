
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;


class ProductListingPage extends StatefulWidget {
  ProductListingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductListingPage> {
  Future getAllTodos() async {
    try {
      var box = Hive.box('user_details');
      var response = await http.get(Uri.parse('https://beta.industrielleads.com/api/vendor/products/equipment'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${box.get('token', defaultValue: '')}'},
      );
      //print(response.body);
      Map<String,dynamic>responseData=jsonDecode(response.body);
      //Map<List,dynamic>productList=responseData['data'];
      //print('jkfhjksdkh $productList');
      return responseData['data'];
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (ConnectionState.active != null && !snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (ConnectionState.done != null && snapshot.hasError) {
            return Center(child: Text(snapshot.error));
          }

          return ListView.separated(
            padding: EdgeInsets.all(10),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index]['id']),
               /* trailing: snapshot.data[index]['completed']
                    ? Icon(Icons.emoji_events, color: Color(0xffbF7B801))
                    : Icon(
                  Icons.campaign,
                  color: Color(0xffb55286F),
                ),*/
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                indent: 20,
                endIndent: 20,
              );
            },
          );
        },
        future: getAllTodos(),
      ),
    );
  }
}