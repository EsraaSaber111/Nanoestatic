import 'package:flutter/material.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/screens/UserProfile/components/profile_widget.dart';
import 'package:shop_app/screens/UserProfile/components/textfield_widget.dart';
import 'package:shop_app/screens/mainpage/mainpagescreen.dart';


import 'button_widget.dart';
class EditBody extends StatefulWidget {
  User user ; EditBody(this.user);

  @override
  _EditBodyState createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {


  @override
  Widget build(BuildContext context) =>  Scaffold(
        //appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: widget.user.mainImage,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: widget.user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: widget.user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Address',
              text: widget.user.address,
              maxLines: 5,
              onChanged: (address) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Phone',
              text: widget.user.phone,
              onChanged: (phone) {
                setState(() {
                  widget.user.phone=phone;
                });
              },
            ),
            const SizedBox(height: 24),
    ButtonWidget(
      text: 'Save changes',
      onClicked: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => MainPage()),
        // );

      },
    )
          ],
        ),

  );

}
