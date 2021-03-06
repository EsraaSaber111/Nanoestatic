import 'package:flutter/material.dart';
import 'package:nanoestatic/components/custom_surfix_icon.dart';
import 'package:nanoestatic/components/default_button.dart';
import 'package:nanoestatic/components/form_error.dart';
import 'package:nanoestatic/service/Api.dart';
import 'package:nanoestatic/size_config.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Product serial",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter the product serial to check it's availability",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              SerialForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SerialForm extends StatefulWidget {
  @override
  _SerialFormState createState() => _SerialFormState();
}

class _SerialFormState extends State<SerialForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String serial;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (newValue) {
              setState(() {
                serial = newValue;
              });

            } ,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kSerialNullError)) {
                setState(() {
                  errors.remove(kSerialNullError);
                });
              }
              return null;
            },
            validator: (value) {
              Api.getdoctorserial(value,"productserial/exist?").then((value) {
                print(value);
                if (value == "serial exist") {
                  print(value.toString());
                  Scaffold.of(context).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.done_all,color: Colors.green,), SizedBox(width: 10,), Text("Serial Exists")],)));
                }
                else {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.close,color: Colors.red,), SizedBox(width: 10,), Text('${value.toString()}')],)));
                }
              }
              );

              if (value.isEmpty && !errors.contains(kSerialNullError)) {
                setState(() {
                  errors.add(kSerialNullError);
                });
              }
              return null;
             // return null;
            },
            decoration: InputDecoration(
              labelText: "serial",
              hintText: "Enter product serial",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Check",
            press: () {
              if (_formKey.currentState.validate()) {

                // Scaffold.of(context).showSnackBar(SnackBar(content: Row(children: [Icon(Icons.done_all,color: Colors.green,), SizedBox(width: 10,), Text("Serial Exists")],)));
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
         // NoAccountText(),
        ],
      ),
    );
  }
}
