import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/course_details/CourseDetailsScreen.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        child: AnimationLimiter(
        child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
        children:
        List.generate(courses.length, (index)
        {
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
                      child: CourseCard(index),
                      onTap: () => Navigator.pushNamed(
        context,
        CourseDetailsScreen.routeName,
        arguments: CourseDetailsArguments(product: courses[index]),
                    ),
                  ),
                ),
              )
              )
          );
        }
        ).toList()),
    ));

  }
}
Widget CourseCard(int index){
    double width = 160;

  return  Padding(
    padding: const EdgeInsets.all(3.0),
    child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AspectRatio(
              //   aspectRatio: 0.8,
              //   child:
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Hero(
                        tag: courses[index].id.toString(),
                        child: Image.asset(courses[index].img,fit: BoxFit.fill),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            courses[index].name,
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${courses[index].price}",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor,
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                              height: getProportionateScreenWidth(28),
                              width: getProportionateScreenWidth(28),
                              decoration: BoxDecoration(
                                color: courses[index].isFavourite
                                    ? kPrimaryColor.withOpacity(0.2)
                                    : kSecondaryColor.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Heart Icon_2.svg",
                                color: courses[index].isFavourite
                                    ? Color(0xFFFF4848)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
            //  ),

            ],
          ),
        ),
    //  ),
    ),
  );
}
