import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/screens/UserProfile/components/profile_widget.dart';
import 'package:shop_app/screens/profile/components/expansion.dart';
import 'package:shop_app/screens/profile/components/profile_menu.dart';

import '../updateprofile_screen.dart';
import 'appbar_widget.dart';
import 'button_widget.dart';
import 'numbers_widget.dart';
class ProfileBody extends StatefulWidget {
  final User user=User(name: "esraa" , phone: '12345677' , email:  'esraa@gmail.com', address: "streeet" , mainImage: 'assets/images/course.jpg');


  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
       //   appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 10),
              ProfileWidget(
                imagePath: widget.user.mainImage,
                onClicked: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
                  // );
                },
              ),
              const SizedBox(height: 20),
             // buildName(widget.user),
              const SizedBox(height: 20),
              Center(child: buildUpgradeButton()),
              //NumbersWidget(),
              const SizedBox(height: 48),
              ProfileMenu(
                text: "Full Name",
                sub: "${widget.user.name}",
                icon: "assets/icons/User Icon.svg",
                press: () => {},
              ),
              ProfileMenu(
                text: "Email",
                sub:  "${widget.user.email}",
                icon: "assets/icons/Mail.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Password",
                sub: "*********",
                icon: "assets/icons/Question mark.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Phone",
                sub:  "${widget.user.phone}",
                icon: "assets/icons/Phone.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Address",
                sub:  "${widget.user.address}",
                icon: "assets/icons/Location point.svg",
                press: () {},
              ),
              ExPanal(courses),
              //buildAbout(widget.user),
            ],
          ),


    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Edit Profile',
    onClicked: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
      );

    },
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 9),
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          Text(
            user.address,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    ),
  );

}
