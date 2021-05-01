import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/models/ContactItems.dart';
class ContactUs extends StatelessWidget {
  static String routeName = "/contact";
  @override
  Widget build(BuildContext context) {
  // ContactItems items;

    return Scaffold(
      appBar: AppBar(title: Text('Contact Us'),),
      drawer: Drawer(child: drawer(),),
      body: SafeArea(
        child: AnimationLimiter(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: itemsforContact.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 44.0,
                  child: FadeInAnimation(
                    child: EmptyCard(
                      width: MediaQuery.of(context).size.width,
                      height: 88.0,
                      items:itemsforContact[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget EmptyCard({double width, double height, ContactItems items}) {

    return Container(
      child: ListTile(
        trailing: SocalCard(
          icon: items.icon,
          press: () {},
        ),
        title: Row(
          children: [
            Text("${items.title} :"),

          ],
        ),
        subtitle: Text(items.content, style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),),

      ),
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
    );





  }

}


