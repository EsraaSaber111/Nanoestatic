import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/Provider/provider.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/CompeleteOrder.dart';
import 'package:shop_app/screens/mainpage/mainpagescreen.dart';
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
  String id;
  List<ProductCart> mypro=[];
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

  getprolist() {
    helper.getDataList().then((value) {
      print(value.toString());
      value.forEach((element) {mypro.add(ProductCart(product_id: element.product_id,numOfItem:element.numOfItem));});
      print("mypro = ${mypro.map((e) => e.to_String()).toList()}");
      return mypro;
    });

  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
     print(value.getString('id'));
      setState(() {
        id = value.getString('id');
      });
    });
   // print(id);
    getprolist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Provider_control>(context);

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
                CompeleteOrder order = CompeleteOrder(
                    phone: phone,
                    email: email,
                    address: address,
                    fullname: name,
                    customerid: int.parse(id),
                    notes: note,
                    myProducts: mypro);
                helper.deleteall();
                count.setCount(0);
                Api.checkout(order).then((value) => print(value));
                // if all are valid then go to success screen
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child: Text('welcome ${order.fullname}')),
                        content: Text('Order Sent Sucessfully , we will contact you soon'),
                        elevation: 5,
                        actions: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.popUntil(context, ModalRoute.withName(MainPage.routeName));
                            //  Navigator.of(context).pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
                            },
                            child: Text('ok'),
                          ),
                        ],
                      );
                    });

              //  Navigator.pushNamed(context, MainPage.routeName);
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
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildSpecFormField() {
    return TextFormField(

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
        labelText: "Name",
        hintText: "enter your name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
