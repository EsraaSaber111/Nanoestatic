import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/screens/UserProfile/components/profile_widget.dart';
import 'package:shop_app/screens/profile/components/expansion.dart';
import 'package:shop_app/screens/profile/components/profile_menu.dart';
import 'package:shop_app/service/Api.dart';
import 'package:shop_app/service/UserApi.dart';

import '../../../sharedpref.dart';
import '../updateprofile_screen.dart';
import 'appbar_widget.dart';
import 'button_widget.dart';
import 'numbers_widget.dart';

class ProfileBody extends StatefulWidget {
  // final User user=User(name: "esraa" , phone: '12345677' , email:  'esraa@gmail.com', address: "streeet" , mainImage: 'assets/images/course.jpg');

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  Future<Login> login;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login=UserApi.getuser(8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Login>(
          future: login,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 10),
                  // ProfileWidget(
                  //   imagePath:'${imageURl+ snapshot.data.user.mainImage}',
                  //   onClicked: () {
                  //     // Navigator.of(context).push(
                  //     //   MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
                  //     // );
                  //   },
                  // ),
                  const SizedBox(height: 20),
                  // buildName(widget.user),
                  const SizedBox(height: 20),
                  Center(child: buildUpgradeButton()),
                  //NumbersWidget(),
                  const SizedBox(height: 48),
                  ProfileMenu(
                    text: "Full Name",
                    sub: "${snapshot.data.user.name}",
                    icon: "assets/icons/User Icon.svg",
                    press: () => {},
                  ),
                  ProfileMenu(
                    text: "Email",
                    sub: "${snapshot.data.user.email}",
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
                    sub: "${snapshot.data.user.phone}",
                    icon: "assets/icons/Phone.svg",
                    press: () {},
                  ),
                  ProfileMenu(
                    text: "Address",
                    sub: "${snapshot.data.user.address}",
                    icon: "assets/icons/Location point.svg",
                    press: () {},
                  ),
                  ExPanal(courses),
                  //buildAbout(widget.user),
                ],
              );
            } else {
              return Center(
                child: Text('not'),
              );
            }
          }),
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
            MaterialPageRoute(
                builder: (context) => UpdateProfileScreen(
                    //    widget.user
                    )),
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
