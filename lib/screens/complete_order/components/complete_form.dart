import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/CompeleteOrder.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/service/Api.dart';

import '../../../constants.dart';
import '../../../dphelper.dart';
import '../../../size_config.dart';


class OrderForm extends StatefulWidget {
  @override
  _OrderFormFormState createState() => _OrderFormFormState();
}

class _OrderFormFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String phone;
  String address;
  String note;
  String name;
 List<ProductCart> mypro;
  SQL_Helper helper = new SQL_Helper();
  //String conform_password;
 // bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  getprolist(){
     helper.getDataList().then((value) {
       setState(() {
         mypro=value;
       });
     });
    return mypro;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildSpecFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNoteFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Complete",
            press: () {
           //   print(demoCarts.map((e) => e.toJson()).toList());
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

               // Confirm confirmcourse=Confirm(phone, address, email, note, name);
                CompeleteOrder order=CompeleteOrder(password: phone,email: email,address: address,fullname: email,customerid: 3,notes: note,myProducts: getprolist());
                Api.checkout(order).then((value) => print(value));
                // if all are valid then go to success screen
                //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNoteFormField() {
    return TextFormField(
      maxLines: 5,
    //  obscureText: true,
      onSaved: (newValue) => note = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNoteNullError);
        } else if (value.isNotEmpty) {
          removeError(error: kNoteNullError);
        }
        note = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNoteNullError);
          return "";
        } else if ((note != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "note",
        hintText: "enter your notes",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Plus Icon.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
     // obscureText: true,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNullError);
        } else if (value.length >= 10) {
          removeError(error: kShortPhoneError);
        }
        phone = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPhoneError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "phone",
        hintText: "Enter your phone",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }


  TextFormField buildAddressFormField() {
    return TextFormField(
      //  obscureText: true,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }

        address = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        } else if ((address != value)) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "address",
        hintText: "enter your address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildSpecFormField() {

    return TextFormField(
      //  obscureText: true,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }

        name = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        } else if ((name != value)) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Doctor's specialty",
        hintText: "enter your specialty",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );


  }

}