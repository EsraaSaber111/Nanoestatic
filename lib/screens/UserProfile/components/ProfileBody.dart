import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/localization/language_constants.dart';
import 'package:nanoestatic/models/login.dart';
import 'package:nanoestatic/screens/UserProfile/expansion.dart';
import 'package:nanoestatic/screens/profile/components/profile_menu.dart';

import 'package:nanoestatic/service/UserApi.dart';
import '../updateprofile_screen.dart';
import 'button_widget.dart';
import 'expanioncourse.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  Login login;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((pref) async {
      UserApi.getuser(pref.getString('id')).then((value) {
        setState(() {
          login = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: Scaffold(
          body: login == null
              ? Container()
              : ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 10),
                    // ProfileWidget(
                    //   imagePath:'${imageURl+login.user.mainImage}',
                    //   onClicked: () {
                    //     // Navigator.of(context).push(
                    //     //   MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
                    //     // );
                    //   },
                    // ),
                    //const SizedBox(height: 20),
                    buildName(login.user),
                    const SizedBox(height: 20),
                    Center(child: buildUpgradeButton()),
                    //NumbersWidget(),
                    const SizedBox(height: 48),
                    ProfileMenu(
                      text: "${getTranslated(context, 'Full Name')}",
                      sub: "${login.user.name}",
                      icon: "assets/icons/User Icon.svg",
                      press: () => {},
                    ),
                    ProfileMenu(
                      text: "${getTranslated(context, 'Email')}",
                      sub: "${login.user.email}",
                      icon: "assets/icons/Mail.svg",
                      press: () {},
                    ),

                    ProfileMenu(
                      text: "${getTranslated(context, 'Phone')}",
                      sub: "${login.user.phone}",
                      icon: "assets/icons/Phone.svg",
                      press: () {},
                    ),
                    ProfileMenu(
                      text: "${getTranslated(context, 'Address')}",
                      sub: "${login.user.address}",
                      icon: "assets/icons/Location point.svg",
                      press: () {},
                    ),
                    ExPanalOrders(),
                    ExPanalCourses(),
                    //buildAbout(widget.user),
                  ],
                )),
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
        text: '${getTranslated(context, 'Edit Profile')}',
        onClicked: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => UpdateProfileScreen(login
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
