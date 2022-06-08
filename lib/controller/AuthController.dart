import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:industrielleads_seller/api_routes.dart';


Future<bool> loginUser(String email,String password) async{
  Map data = {
    'email': email,
    'password': password
  };
  final  response= await http.post(
      Uri.parse('${BASE_URL}c/auth/sellerapp/sign/in'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: data,
  );
  if(response.statusCode==200)
    {
      Map<String,dynamic>responseData=jsonDecode(response.body);
      Map<String,dynamic>authInfo=responseData['data'];
      var box = Hive.box('user_details');
      box.put('token',authInfo['access_token']);
      box.put('first_name',authInfo['first_name']);
      box.put('last_name',authInfo['last_name']);
      box.put('company_name',authInfo['company_name']);
      box.put('email',authInfo['email']);
      box.put('phone',authInfo['phone']);
      box.put('profile_pic',authInfo['profile_pic']!=null?authInfo['profile_pic']['url']:'');
      print('USERRRRR${box.get('first_name', defaultValue: '')}');
      return true;
    }
  else
    {
      return false;
    }
}

Future<void> logout() async {
  var box = Hive.box('user_details');
  //print('TOKKKEENNNNN${box.get('token', defaultValue: '')}');
  final response = await http.get(Uri.parse('https://beta.industrielleads.com/api/c/auth/logout'),
    headers: {HttpHeaders.authorizationHeader: 'Bearer ${box.get('token', defaultValue: '')}'},
  );
  box.clear();
  //print('TOKKKEENNNNN${box.get('token', defaultValue: '')}');
  //print(response.body);
}