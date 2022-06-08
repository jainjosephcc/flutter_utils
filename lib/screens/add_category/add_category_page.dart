import 'package:flutter/material.dart';
import 'package:industrielleads_seller/components/default_button.dart';
import '../../size_config.dart';

class AddCategory extends StatelessWidget {
  static String routeName = "/add_category";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
            Text("Add category Request", style: TextStyle(
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.5,
            )),
            Text(
              "Complete your details of your new category",
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
                        labelText: "Full Name",
                        hintText: "Enter product category name",
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
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
                        labelText: "Category Type",
                        hintText: "Enter category type",
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.arrow_drop_down_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    DefaultButton(
                      text: "Save",
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
