import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/all_courses_model.dart';
import 'package:shop_app/screens/home/components/special_categories.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
class Coursecard extends StatelessWidget {
  int index;
  List<AllCourses> allcourses;
  Coursecard(this.index, this.allcourses);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SpecialOfferCard(
        width: 300,
        image: '${imageURl+allcourses[index].mainImage}',
        category:  allcourses[index].data.title,
        numOfBrands: "${allcourses[index].lastPrice}"+"\$",
        // press: (){
        // },
      ),

    );
  }
}