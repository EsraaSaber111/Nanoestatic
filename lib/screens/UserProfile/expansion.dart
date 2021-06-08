import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/all_courses_model.dart';
import 'package:shop_app/models/orders.dart';
import 'package:shop_app/service/UserApi.dart';
class ExPanalOrders extends StatefulWidget {
  @override
  _ExPanalState createState() => _ExPanalState();
}

class _ExPanalState extends State<ExPanalOrders> {
 Orders orders;
  bool active=false;


  ///todo:get courses by userid
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((pref) async {
      UserApi.getUserOrders(pref.getString('id')).then((value) {
        setState(() {
          orders = value;
        });
      });
      // TODO: implement initState

    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
color: Color(0xFFF5F6F9),
        child: ExpansionPanelList(
         // dividerColor: Colors.green,
          expansionCallback: (index,expanded)
              {
                setState(() {
                  active=!active;
                });
              },
          children:<ExpansionPanel> [
            ExpansionPanel(headerBuilder: (BuildContext context,bool isExpanded){

                return ListTile(
                  leading: Icon(Icons.save),
                  title: Text('My Orders', style: TextStyle(fontWeight: FontWeight.bold),),

              );
            },
                canTapOnHeader: true,
                body:orders==null?Center(child: Text('notfound'),):Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(itemCount: orders.allUserOrders.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text('Order Code ${orders.allUserOrders[index].id}', style: TextStyle(color: Colors.grey.shade600),),
                              ),
                            );

                          }),
                    ),
                  ],
                ),
            isExpanded: active),

          ],
        ),
      ),
    );
  }


  }


