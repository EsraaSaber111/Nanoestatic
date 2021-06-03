import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/models/ContactItems.dart';
import 'package:shop_app/models/contact_us.dart';

import 'package:shop_app/service/Api.dart';

import 'items.dart';
class Contact extends StatefulWidget {
  static String routeName = "/contact";
  const Contact({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}
class _ContactUsState extends State<Contact> {
  Future<ContactUs> contactUs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactUs=Api.getcontact();
  }
  @override
  Widget build(BuildContext context) {
    // ContactItems items;
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us'),),
      drawer: Drawer(child: drawer(),),
      body:
      SafeArea(
          child: FutureBuilder<ContactUs>(
            future: contactUs,
            builder: (_,snapshot){
              if(snapshot.hasData){
                List<Items> items=[];
                items.add(Items(title: "email", details: "${snapshot.data.contact.email}", icon: Icon(Icons.email),));
                items.add(Items(title: "phone", details: "${snapshot.data.contact.phone}", icon: Icon(Icons.phone),));
                items.add(Items(title: "location", details: "${snapshot.data.contact.location}", icon: Icon(Icons.location_on),));
                //items.add(Items(title: "address", details: "${snapshot.data.contact.data.address}", icon: Icon(Icons.map),));

                print('hi');
               // return Center(child: Text('found data'),);
                // setState(() {
                //   items=[
                //     Items(title: "email", details: "${snapshot.data.contact.email}", icon: Icon(Icons.email),)
                //   ];
                // });
                return
                  AnimationLimiter(
                    child:ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 700),
                      child: SlideAnimation(
                        verticalOffset: 44.0,
                        child: FadeInAnimation(
                          child: EmptyCard(
                            width: MediaQuery.of(context).size.width,
                            height: 88.0,
                            items:items[index],
                          ),
                        ),
                      ),
                    );
                  },
                ));

            } if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }

              else{
                print('no');
                return Center(child: Text('empty data'),);

              }
            }




          ),
        ),

    );
  }
}



Widget EmptyCard({double width, double height, Items items}) {

  return Container(
    child: ListTile(
      trailing:items.icon,

      title: Row(
        children: [
          Text("${items.title} ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

        ],
      ),
      subtitle: Text(items.details),

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


