import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/product_model.dart';

class CompeleteOrder{

  String email,password,fullname,address,notes;
  int customerid;
  List<ProductCart>myProducts;

  CompeleteOrder({this.myProducts,this.password,this.email,this.address,this.customerid,this.fullname,this.notes});
}
