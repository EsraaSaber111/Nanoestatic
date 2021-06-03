import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
class ExPanal extends StatefulWidget {

 List<Product> courses;
 ExPanal(this.courses);

  @override
  _ExPanalState createState() => _ExPanalState();
}

class _ExPanalState extends State<ExPanal> {
  bool active=false;
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
                  title: Text('My Courses', style: TextStyle(fontWeight: FontWeight.bold),),

              );
            },
                canTapOnHeader: true,
                body:CoursesList(widget.courses),
            isExpanded: active),

          ],
        ),
      ),
    );
  }

  Widget CoursesList(List<Product> c) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: ListView.builder(itemCount: c.length,
                itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text('${c[index].name}', style: TextStyle(color: Colors.grey.shade600),),
                ),
              );

                }),
        ),
      ],
    );
  }
  }


