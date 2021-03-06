import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/components/custom_surfix_icon.dart';
import 'package:nanoestatic/components/form_error.dart';
import 'package:nanoestatic/helper/keyboard.dart';
import 'package:nanoestatic/models/login.dart';
import 'package:nanoestatic/screens/mainpage/mainpagescreen.dart';
import 'package:nanoestatic/service/UserApi.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  SharedPreferences prefs;
  final _formKey = GlobalKey<FormState>();
  User user;
  String email;
  String password;
 // bool remember = false;
  final List<String> errors = [];

  getemail(){
    SharedPreferences.getInstance().then((pref) async {
        setState(() {
          email=pref.getString('email');
        });
    });
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: remember,
          //       activeColor: kPrimaryColor,
          //       onChanged: (value) {
          //         setState(() {
          //           remember = value;
          //         });
          //       },
          //     ),
          //     Text("Remember me"),
          //     Spacer(),
          //
          //   ],
          // ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {

              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // savedata(email,password);

                // await UserSimplePreferences.setEmail(email);
                // await UserSimplePreferences.setPassword(password);
                // if all are valid then go to success screen

                KeyboardUtil.hideKeyboard(context);
                UserApi.login(email, password).then((value)  {

                  if(value.message=="invalid login"){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('${value.message}')));
                  }else{
                     // SharedPreferences.getInstance().then((prefs) {
                     //    prefs.setString("instance",'done');
                     //  });
                    ///shared SharedPreferences call
                    // print(UserSimplePreferences.getEmail().toString());
                    // print(UserSimplePreferences.getPassword().toString());
                   Navigator.pushReplacementNamed(context, MainPage.routeName);
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('welcome ${value.user.name} ${value.message}')));


                  }


                });

                    //Scaffold.of(context).showSnackBar(SnackBar(content: Text('welcome ${value.user.name} ${value.message}'))));
               //Navigator.pushNamed(context, MainPage.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: email,
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
}
