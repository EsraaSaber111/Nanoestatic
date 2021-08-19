
class Wishlist {
 String message;
 List<AllWishListProducts> allWishListProducts;

 Wishlist({
  this.message,
  this.allWishListProducts});

 Wishlist.fromJson(dynamic json) {
  message = json["message"];
  if (json["allWishListProducts"] != null) {
   allWishListProducts = [];
   json["allWishListProducts"].forEach((v) {
    allWishListProducts.add(AllWishListProducts.fromJson(v));
   });
  }
 }

 Map<String, dynamic> toJson() {
  var map = <String, dynamic>{};
  map["message"] = message;
  if (allWishListProducts != null) {
   map["allWishListProducts"] = allWishListProducts.map((v) => v.toJson()).toList();
  }
  return map;
 }

}

/// id : 2
/// serial : "2233"
/// main_image : "1622587508500x752_0.png"
/// created_at : "2021-05-21T19:37:01.000000Z"
/// updated_at : "2021-06-01T22:45:08.000000Z"
/// total_quantity_added : 1000
/// total_quantity_subtracted : 718
/// total_quantity : 282
/// sold_number : 4
/// last_price : 2
/// created_by : 1
/// category_id : 5
/// is_offer : 1
class AllWishListProducts {
 int id;
 String serial;
 String mainImage;
 String createdAt;
 String updatedAt;
 int totalQuantityAdded;
 int totalQuantitySubtracted;
 int totalQuantity;
 int soldNumber;
 int lastPrice;
 int createdBy;
 int categoryId;
 int isOffer;

 AllWishListProducts({
  this.id,
  this.serial,
  this.mainImage,
  this.createdAt,
  this.updatedAt,
  this.totalQuantityAdded,
  this.totalQuantitySubtracted,
  this.totalQuantity,
  this.soldNumber,
  this.lastPrice,
  this.createdBy,
  this.categoryId,
  this.isOffer});

 AllWishListProducts.fromJson(dynamic json) {
  id = json["id"];
  serial = json["serial"];
  mainImage = json["main_image"];
  createdAt = json["created_at"];
  updatedAt = json["updated_at"];
  totalQuantityAdded = json["total_quantity_added"];
  totalQuantitySubtracted = json["total_quantity_subtracted"];
  totalQuantity = json["total_quantity"];
  soldNumber = json["sold_number"];
  lastPrice = json["last_price"];
  createdBy = json["created_by"];
  categoryId = json["category_id"];
  isOffer = json["is_offer"];
 }

 Map<String, dynamic> toJson() {
  var map = <String, dynamic>{};
  map["id"] = id;
  map["serial"] = serial;
  map["main_image"] = mainImage;
  map["created_at"] = createdAt;
  map["updated_at"] = updatedAt;
  map["total_quantity_added"] = totalQuantityAdded;
  map["total_quantity_subtracted"] = totalQuantitySubtracted;
  map["total_quantity"] = totalQuantity;
  map["sold_number"] = soldNumber;
  map["last_price"] = lastPrice;
  map["created_by"] = createdBy;
  map["category_id"] = categoryId;
  map["is_offer"] = isOffer;
  return map;
 }
}