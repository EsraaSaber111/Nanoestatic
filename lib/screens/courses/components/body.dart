import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nanoestatic/models/all_courses_model.dart';
import 'package:nanoestatic/screens/course_details/CourseDetailsScreen.dart';
import 'package:nanoestatic/service/Api.dart';
import 'Coursecard.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Courses courses;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Api.getAllCourses().then((value) {
      setState(() {
        courses=value;
      });

    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child:courses==null?Container():AnimationLimiter(
            child: GridView.count(
                crossAxisCount: 1,
               // mainAxisSpacing: 9,
                crossAxisSpacing: 0.2,
                childAspectRatio:2.5,
                children:
                    List.generate(courses.allCourses.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AnimationConfiguration.staggeredGrid(
                          columnCount: 1,
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                            scale: 0.5,
                            child: FadeInAnimation(
                              child: InkWell(
                                child:
                                    Center(child: Coursecard(index, courses.allCourses)),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=>CourseDetailsScreen(courses.allCourses[index].id.toString()
                                    //    snapshot.data.allCourses[index].id
                                  )));
                                }
                              ),
                            ),
                          )));
                }).toList()),
          ));
  }
}

