import 'package:flutter/material.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/screens/UserProfile/userprofile_screen.dart';
import 'package:shop_app/screens/home/components/bottombar.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/wishlist/wishlist_screen.dart';

import '../../size_config.dart';
class MainPage extends StatefulWidget {

  // final User user;
  // const MainPage({Key key,@required this.user}) : super(key: key);
  static String routeName = "/main";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();
  int _currentindex=0;
   final tabs=[
    HomeScreen(),
    WishListScreen(),
   UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //drawer: Drawer(child: drawer(),),
      body:tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.house),title:Text(getTranslated(context, 'home_page'))),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),title:Text(getTranslated(context, 'wishlist'))),
          BottomNavigationBarItem(icon: Icon(Icons.person),title:Text(getTranslated(context,'profile')))
        ],
        onTap: (index){
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileScreen(widget.user)));
          setState(() {
            _currentindex=index;
          });
        },
      ),
    );
  }
}
