import 'package:flutter/material.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/all_courses_model.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
class Coursecard extends StatelessWidget {
  int index;
  List<AllCourses> allcourses;
  Coursecard(this.index, this.allcourses);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        width: getProportionateScreenWidth(160),
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
                      tag: allcourses[index].id.toString(),

                      /// have to edit image
                      child: Image.network('${imageURl+allcourses[index].mainImage}', fit: BoxFit.fill),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          allcourses[index].data.title,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${allcourses[index].lastPrice}",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Container(
                            padding:
                            EdgeInsets.all(getProportionateScreenWidth(2)),
                            height: getProportionateScreenWidth(35),
                            width: getProportionateScreenWidth(35),
                            decoration: BoxDecoration(
                              color: courses[index].isFavourite
                                  ? kPrimaryColor.withOpacity(0.2)
                                  : kSecondaryColor.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.favorite ,  color: courses[index].isFavourite
                                ? Color(0xFFFF4848)
                                : Colors.white,),

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
}