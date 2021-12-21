import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/components/custom_surfix_icon.dart';
import 'package:nanoestatic/components/form_error.dart';
import 'package:nanoestatic/localization/language_constants.dart';
import 'package:nanoestatic/models/User.dart';
import 'package:nanoestatic/models/login.dart';
import 'package:nanoestatic/screens/UserProfile/userprofile_screen.dart';
import 'package:nanoestatic/service/UserApi.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'button_widget.dart';
class EditBody extends StatefulWidget {
  Login login;
  EditBody(this.login);

  @override
  _EditBodyState createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  final List<String> errors = [];
  String name;
  String email;
  String phone;
  String password;
  String id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        id=prefs.getString('id');
      });
    });
  }
  @override
  Widget build(BuildContext context) =>  Scaffold(
        //appBar: buildAppBar(context),
        body: widget.login==null?Container():Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(height: getProportionateScreenHeight(30)),
              buildNameFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildEmailFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPassFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPhoneFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              FormError(errors: errors),
              SizedBox(height: getProportionateScreenHeight(40)),
              ButtonWidget(
                text: '${getTranslated(context, 'Save changes')}',
                onClicked: () {
                  RegisterUser user=RegisterUser(name: name,email: email,phone: phone,password: password);
                 print(id);print(name);print(email);print(password);print(phone);
                 UserApi.UserUpdate(user, id).then((value) => print(value));
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileScreen()));
                // Navigator.pushReplacementNamed(context, UserProfileScreen.routeName);
                  Phoenix.rebirth(context);
                },
              )
            ],
          ),
        )






    //     ListView(
    //       padding: EdgeInsets.symmetric(horizontal: 32),
    //       physics: BouncingScrollPhysics(),
    //       children: [
    //         const SizedBox(height: 24),
    //         TextFieldWidget(
    //           label: "${getTranslated(context, 'Full Name')}",
    //           text: widget.login.user.name,
    //           onChanged: (v) {
    //             setState(() {
    //               name=v;
    //             });
    //
    //           },
    //         ),
    //         const SizedBox(height: 24),
    //         TextFieldWidget(
    //           label: "${getTranslated(context, 'Email')}",
    //           text: widget.login.user.email,
    //           onChanged: (v) {
    //             setState(() {
    //               email=v;
    //             });
    //
    //           },
    //         ),
    //         const SizedBox(height: 24),
    //         TextFieldWidget(
    //           label: "${getTranslated(context, 'Phone')}",
    //           text: widget.login.user.phone,
    //           onChanged: (v) {
    //             setState(() {
    //             phone=v;
    //             });
    //           },
    //         ),
    //         const SizedBox(height: 24),
    //         TextFieldWidget(
    //           label: "${getTranslated(context, 'Password')}",
    //           text: '',
    //           maxLines: 5,
    //           onChanged: (v) {
    //             password=v;
    //           },
    //         ),
    //         const SizedBox(height: 24),
    // ButtonWidget(
    //   text: '${getTranslated(context, 'Save changes')}',
    //   onClicked: () {
    //   RegisterUser user=RegisterUser(name: name,email: email,phone: phone,password: password);
    //  print(id);print(name);print(email);print(password);print(phone);
    //  //UserApi.UserUpdate(user, id).then((value) => print(value));
    //   },
    // )
    //       ],
    //     ),

  );
  TextFormField buildNameFormField() {
    return TextFormField(
      //  obscureText: true,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
       name=value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "${getTranslated(context, 'Full Name')}",
        hintText: widget.login.user.name,
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
        labelText: "${getTranslated(context, 'Phone')}",
        hintText: widget.login.user.phone,
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
       email=value;
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
        labelText: "${getTranslated(context, 'Email')}",
        hintText: widget.login.user.email,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPassFormField() {
    return TextFormField(
      //  obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: '${getTranslated(context, 'Password')}',
        hintText: 'enter your new passsword',
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
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
}
