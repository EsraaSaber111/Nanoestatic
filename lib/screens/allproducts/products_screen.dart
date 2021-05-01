import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../constants.dart';
import 'components/body.dart';

class allProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor:kPrimaryColor,
            bottom: TabBar(
              //indicatorWeight: ,
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                color: Colors.white),
            tabs: [
              Tab(text: ('Body'),),
              Tab(text: ('SunCare'),),
              Tab(text: ('Body'),),
              Tab(text: ('SunCare'),),
            ]),
        //  title: Text('All Products'),
        //  centerTitle: true,
        ),
        backgroundColor: kPrimaryColor,
        body:TabBarView(
          children: [
            Body(),
            Body(),
            Body(),
            Body(),
          ],
        )
      ),
    );
  }

  // AppBar buildAppBar() {
  //   return AppBar(
//   //     elevation: 0,
//   //     centerTitle: false,
//   //     title: Text('Dashboard'),
//   //     actions: <Widget>[
//   //       IconButton(
//   //         icon: SvgPicture.asset("assets/icons/notification.svg"),
//   //         onPressed: () {},
//   //       ),
//   //     ],
//   //   );
  // }
}
