import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nanoestatic/models/user_courses.dart';
import 'package:nanoestatic/service/CoursesApi.dart';
import 'package:nanoestatic/service/UserApi.dart';
class ExPanalCourses extends StatefulWidget {
  @override
  _ExPanalState createState() => _ExPanalState();
}

class _ExPanalState extends State<ExPanalCourses> {
  UserCourses courses;
  bool active=false;


  ///todo:get courses by userid
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((pref) async {
      CoursesApi.getUserCourses(pref.getString('id')).then((value) {
        setState(() {
          courses = value;
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
                title: Text('My Courses', style: TextStyle(fontWeight: FontWeight.bold),),

              );
            },
                canTapOnHeader: true,
                body:courses==null?Center(child: Text('notfound'),):Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(itemCount: courses.allUserCourses.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text(' ${courses.allUserCourses[index].course.data.title}', style: TextStyle(color: Colors.grey.shade600),),
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


