// import 'package:flutter/material.dart';
// import 'package:nanoestatic/api_constants.dart';
// import 'package:nanoestatic/models/Product.dart';
// import 'package:nanoestatic/models/product_model.dart';
//
// import '../../../constants.dart';
// import '../../../size_config.dart';
//
// class ProductImages extends StatefulWidget {
//  List<Product_images> imgs;
// ProductImages(this.imgs);
//
//   @override
//   _ProductImagesState createState() => _ProductImagesState();
// }
//
// class _ProductImagesState extends State<ProductImages> {
//   int selectedImage = 0;
//   @override
//   Widget build(BuildContext context)
//   {
//     return widget.imgs==null?Container():Column(
//       children: [
//         SizedBox(
//           width: getProportionateScreenWidth(238),
//           child: AspectRatio(
//             aspectRatio: 1,
//             child: Hero(
//               tag: widget.imgs.toString(),
//               child: Image.network('${imageURl+widget.imgs[selectedImage].imageName}'),
//             ),
//           ),
//         ),
//         // SizedBox(height: getProportionateScreenWidth(20)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ...List.generate(widget.imgs.length,
//                 (index) => buildSmallProductPreview(index)),
//           ],
//         )
//       ],
//     );
//   }
//
//
// }
