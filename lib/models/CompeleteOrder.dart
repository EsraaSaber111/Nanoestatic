import 'package:nanoestatic/models/Cart.dart';
import 'package:nanoestatic/models/product_model.dart';

class CompeleteOrder{

  String email,phone,fullname,address,notes;
  int customerid;
  List<ProductCart>myProducts;

  CompeleteOrder({this.myProducts,this.phone,this.email,this.address,this.customerid,this.fullname,this.notes});
}
