import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import '../../../languages.dart';
import '../../../main.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _changelanguage(Languages language)async {
      Locale _locale = await setLocale(language.languageCode);
      MyApp.setLocale(context, _locale);
      print(language.languageCode);
    }

      return AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text("MESOESTATIC",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3),
            child:
            DropdownButton(
              underline: SizedBox(),
              items: Languages.languagelist()
                  .map<DropdownMenuItem<Languages>>((lang) => DropdownMenuItem(
                  value: lang,
                  child: Row(
                    children: [
                      Text(lang.name),
                    ],
                  )))
                  .toList(),
              onChanged: (Languages language){
                _changelanguage(language);
              },
              icon: Icon(Icons.language, color: Colors.grey,),
            )

          ),
         SizedBox(width: 2,),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: IconBtnWithCounter(
                    numOfitem: 3,
                    svgSrc: "assets/icons/Cart Icon.svg",
                    press: ()  async{
                      // languageCode
                      //SharedPreferences.getInstance().then((value) => print(value.getString('languageCode')));
                      print(await getLanguageCode());
                      Navigator.pushNamed(context, CartScreen.routeName);
                    }
                  ),
                ),
                SizedBox(width: 2,),
                // Padding(
                //   padding: const EdgeInsets.only(right: 3),
                //   child: IconBtnWithCounter(
                //     svgSrc: "assets/icons/User.svg",
                //
                //     press: () {
                //       Navigator.pushNamed(context, ProfileScreen.routeName);
                //     },
                //   ),
                // ),
        ],
      );

  }


  // static Future<Locale>getlan()async{
  //   final lang=await getLocale();
  //   return lang;
  // }
}
