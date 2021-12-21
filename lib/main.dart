import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/Provider/provider.dart';
import 'package:nanoestatic/localization/demo_localization.dart';
import 'package:nanoestatic/routes.dart';
import 'package:nanoestatic/screens/mainpage/mainpagescreen.dart';
import 'package:nanoestatic/screens/splash/splash_screen.dart';
import 'package:nanoestatic/theme.dart';
import 'localization/language_constants.dart';
import 'models/Product.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp( ChangeNotifierProvider<Provider_control>(
      create: (_) => Provider_control(),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }
  String instance;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        instance= prefs.getString("user_token");
        print(instance);
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectcategory(allproducts);
    return MaterialApp(

      title: 'NanoEstatic',
      theme: theme(),

      locale: _locale,
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ],
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: instance==null? SplashScreen.routeName: MainPage.routeName,
      routes: routes,
    );
  }

}

