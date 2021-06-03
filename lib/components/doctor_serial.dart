import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/service/Api.dart';
import 'package:shop_app/service/Api.dart';

import '../size_config.dart';


class CustomDialogs extends StatefulWidget {
  final String title, description, buttontext1, buttontext2;
  final Image image;

  const CustomDialogs(
      {Key key,
        this.title,
        this.description,
        this.buttontext1,
        this.buttontext2,
        this.image})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<CustomDialogs> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Consts.paddding)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              height: 250,
              padding: EdgeInsets.only(
                  top: Consts.paddding + Consts.avatar,
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
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          obscureText: true,
                          obscuringCharacter: '*',

                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v.length < 3) {
                              return "I'm from validator";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            selectedFillColor: Colors.grey,
                            selectedColor: Colors.grey,
                            inactiveFillColor: Colors.white,
                            inactiveColor: Colors.grey,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: getProportionateScreenHeight(40),
                            fieldWidth: getProportionateScreenWidth(30),
                            activeFillColor:
                            hasError ? Colors.grey.shade50 : Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          boxShadows: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          ///handle on click here
                          onCompleted: (v) {
                            print(v);
                          Api.getdotor(v,"doctorserial/exist?").then((value) {
                            print(value);
                            if (value == "serial exist") {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(
                                  context, CartScreen.routeName);
                              print(value.toString());
                            }
                            else {
                              print('error');
                            }
                          }

                          );

                              },


                          //
                            //Navigator.pushNamed(context, CartScreen.routeName);
                            //print("Completed");


                          onChanged: (value) {
                           // print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [


                      RaisedButton(

                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)
                        ),
                        color: Colors.green,

                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(widget.buttontext2,  style: TextStyle(color: Colors.white, fontSize: 15)),),
                    ],
                  )

                ],
              ),
            ),

            Positioned(
              left: Consts.paddding,
              right: Consts.paddding,
              child: Hero(
                tag: '1',
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: Consts.paddding + 70),
                  height: getProportionateScreenHeight(140),
                  // image is square but we add extra 20 + 20 padding thats why width is 200
                  width: getProportionateScreenWidth(90),
                  child: Image.asset(
                    'assets/images/doctor.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )

            // Positioned(left: Consts.paddding, right: Consts.paddding,
            //     child: CircleAvatar(
            //       backgroundColor: Colors.blue,
            //     radius: Consts.avatar,)
            // )
          ],
        ));
  }
}

class Consts {
  static const double paddding = 16;
  static const double avatar = 66;
  Consts._();
}
