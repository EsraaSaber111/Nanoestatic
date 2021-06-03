import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/models/all_courses_model.dart';
import 'package:shop_app/screens/course_details/CourseDetailsScreen.dart';
import 'package:shop_app/service/Api.dart';
import 'Coursecard.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Courses> courses;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courses = Api.getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<Courses>(
      future: courses,
      builder: (_, snapshot) {
        // if(snapshot.connectionState==ConnectionState.waiting){
        //   return Center(child: CircularProgressIndicator(),);
        // }
        //
        // else
        if (snapshot.hasData) {
          return AnimationLimiter(
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
                children:
                    List.generate(snapshot.data.allCourses.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                            scale: 0.5,
                            child: FadeInAnimation(
                              child: InkWell(
                                child:
                                    Coursecard(index, snapshot.data.allCourses),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseDetailsScreen(
                                  3
                                    //    snapshot.data.allCourses[index].id
                                  )));
                                }
                              ),
                            ),
                          )));
                }).toList()),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('null'),
          );
        }
      },
    ));
  }
}

