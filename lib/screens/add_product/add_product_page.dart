import 'package:flutter/material.dart';
import 'package:industrielleads_seller/components/default_button.dart';
import '../../size_config.dart';

class AddProduct extends StatelessWidget {
  static String routeName = "/add_product";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
            Text("Add a new Product", style: TextStyle(
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.5,
            )),
            Text(
              "Complete your details of your new product",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter product name",
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.input_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Model Number",
                        hintText: "Enter Model Number",
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.pin_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Year",
                        hintText: "Enter Year",
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.event_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Categories",
                        hintText: "Select Categories",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.category_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Price",
                        hintText: "Enter Price of the product",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.request_quote_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    DefaultButton(
                      text: "Add",
                      press: () {
                        /*if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          // if all are valid then go to success screen
                          Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                        }*/
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
          ],
        ),
      ),
    );
  }
}
