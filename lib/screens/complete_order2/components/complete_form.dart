import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/components/custom_surfix_icon.dart';
import 'package:nanoestatic/components/default_button.dart';
import 'package:nanoestatic/components/form_error.dart';
import 'package:nanoestatic/screens/mainpage/mainpagescreen.dart';
import 'package:nanoestatic/service/Api.dart';
import 'package:nanoestatic/service/CoursesApi.dart';
import 'package:nanoestatic/service/UserApi.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class OrderForm2 extends StatefulWidget {
  @override
  _OrderFormForm2State createState() => _OrderFormForm2State();
}

class _OrderFormForm2State extends State<OrderForm2> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String phone;
  String address;
  String note;
  String name;
  String user_id;
  String course_id;

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
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      print(value.getString('id'));
      setState(() {
        user_id = value.getString('id');
        course_id=value.getString('course_id');
      });
    });
    // TODO: implement initState
    super.initState();
  // print('user=${user_id}');
  //   print('user=${course_id}');

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
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
               Confirm confirmcourse=Confirm(phone:phone, address:address, email:email, note:note, name:name,userid: int.parse(user_id),courseid: int.parse(course_id));
                CoursesApi.confirmcourse('course/store?', confirmcourse).then((value) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(child: Text('welcome ${confirmcourse.name}')),
                          content: Text('Course Applied Sucessfully , we will contact you soon'),
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
                 //print(value);
                 //Scaffold.of(context).showSnackBar(SnackBar(content: Text('${value}')));
               });
    // =================================================================================
                // CompeleteOrder order=CompeleteOrder(password: phone,email: email,address: address,fullname: email,customerid: 3,notes: note,myProducts: demoCarts);
                // Api.checkout(order);
                // if all are valid then go to success screen
               // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
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
class Confirm{

  String email;
  String phone;
  String address;
  String note;
  String name;
  int userid;
  int courseid;

  Confirm({this.phone,this.address,this.email,this.note,this.name,this.userid,this.courseid});
}