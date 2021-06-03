import 'package:flutter/material.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/screens/UserProfile/userprofile_screen.dart';
import 'package:shop_app/screens/home/components/bottombar.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/wishlist/wishlist_screen.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);
  static String routeName = "/main";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentindex=0;
  final tabs=[
    HomeScreen(),
    WishListScreen(),
    UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          setState(() {
            _currentindex=index;
          });
        },
      ),
    );
  }
}
