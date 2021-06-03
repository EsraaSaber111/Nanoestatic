import 'package:flutter/material.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/screens/UserProfile/components/profile_widget.dart';
import 'package:shop_app/screens/UserProfile/components/textfield_widget.dart';
import 'package:shop_app/screens/mainpage/mainpagescreen.dart';

import 'ProfileBody.dart';
import 'appbar_widget.dart';
import 'button_widget.dart';
class EditBody extends StatefulWidget {
  const EditBody({Key key}) : super(key: key);

  @override
  _EditBodyState createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  User user = ProfileBody().user;

  @override
  Widget build(BuildContext context) =>  Scaffold(
        //appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.mainImage,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Address',
              text: user.address,
              maxLines: 5,
              onChanged: (address) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Phone',
              text: user.phone,
              onChanged: (phone) {
                setState(() {
                  user.phone=phone;
                });
              },
            ),
            const SizedBox(height: 24),
    ButtonWidget(
      text: 'Save changes',
      onClicked: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MainPage()),
        );

      },
    )
          ],
        ),

  );

}
