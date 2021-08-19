import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/member.dart';
import '../api_constants.dart';
import '../size_config.dart';


class MemberDialog extends StatefulWidget {
  final description, buttontext2;
  final Image image;
  final MemberModel memberModel;


  const MemberDialog({Key key,
    this.memberModel,

    this.description,

    this.buttontext2,
    this.image})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MemberDialog> {



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Consts.paddding)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(

          children: [

            Container(
              // height: 250,
              padding: EdgeInsets.only(
                  top: Consts.paddding ,
                  left: Consts.paddding,
                  right: Consts.paddding,
                  bottom: Consts.paddding),
              margin: EdgeInsets.only(top: Consts.avatar),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(Consts.paddding),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: getProportionateScreenWidth(40),
                        child: ClipRRect(
                          child: Image.network(
                            '${imageURl + widget.memberModel.member.mainImage}',
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(50)),
                        ),
                        //  radius: 10.0,
                        // backgroundImage: AssetImage('assets/doc1.jpg'),
                      )),

                  Center(
                    child: Text(
                      'Member Name',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20,color: Colors.black),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${widget.memberModel.member.name}',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(getProportionateScreenWidth(30))
                        ),
                        color: Colors.green,

                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(widget.buttontext2, style: TextStyle(
                            color: Colors.white, fontSize: 15)),),
                    ],
                  )

                ],
              ),
            ),
          ],
        ));
  }

}

class Consts {
  static  double paddding = getProportionateScreenWidth(16);
  static  double avatar = getProportionateScreenWidth(66);

  Consts._();
}
