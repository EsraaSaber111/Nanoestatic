import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/models/about_us_model.dart';
import 'package:shop_app/screens/contact_us/items.dart';
import 'package:shop_app/service/Api.dart';

import 'aboutuscard.dart';

class body extends StatefulWidget {
  const body({Key key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  Future<AboutUsModel> aboutus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutus = Api.getAboutUs();
    //Api.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        drawer: Drawer(
          child: drawer(),
        ),
        body: SafeArea(
          child: FutureBuilder<AboutUsModel>(
            future: aboutus,
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                List<Items> items=[];
                items.add(Items(title: "${snapshot.data.about.data.aboutTitle}", details: "${snapshot.data.about.data.aboutContent}"));
                items.add(Items(title: "${snapshot.data.about.data.missionTitle}", details: "${snapshot.data.about.data.missionContent}"));
                items.add(Items(title: "${snapshot.data.about.data.visionTitle}", details: "${snapshot.data.about.data.visionContent}"));
                items.add(Items(title: "${snapshot.data.about.data.valueTitle}", details: "${snapshot.data.about.data.valueContent}"));

                return AnimationLimiter(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 44.0,
                          child: FadeInAnimation(
                            child: AboutUsCard(
                              MediaQuery.of(context).size.width,
                              items[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text('error data'),
                );
              }
            },
          ),
        ));
  }
}
