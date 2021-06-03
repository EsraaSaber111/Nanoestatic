/// message : "success"
/// product : {"id":2,"serial":"2233","main_image":"16216330211610548484bar1 f.jpg","created_at":"2021-05-21T19:37:01.000000Z","updated_at":"2021-05-21T19:37:01.000000Z","total_quantity_added":1000,"total_quantity_subtracted":0,"total_quantity":1000,"sold_number":0,"last_price":2,"created_by":1,"category_id":5,"is_offer":1,"data":{"id":2,"title":"test case","slug":"test case","content":"<p>test case</p>","created_at":"2021-05-21T19:37:01.000000Z","updated_at":"2021-05-21T19:37:01.000000Z","created_by":1,"product_id":2},"product_images":[{"product_id":2,"image_name":"16216330221610548484bar1 f.jpg","created_at":"2021-05-21T19:37:02.000000Z","updated_at":"2021-05-21T19:37:02.000000Z","created_by":1},{"product_id":2,"image_name":"16216330221610548485bar1 f.jpg","created_at":"2021-05-21T19:37:02.000000Z","updated_at":"2021-05-21T19:37:02.000000Z","created_by":1}]}

class Product_model {
  String message;
  MyProduct product;

  Product_model({
      this.message, 
      this.product});

  Product_model.fromJson(dynamic json) {
    message = json["message"];
    product = json["product"] != null ? MyProduct.fromJson(json["product"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (product != null) {
      map["product"] = product.toJson();
    }
    return map;
  }

}

/// id : 2
/// serial : "2233"
/// main_image : "16216330211610548484bar1 f.jpg"
/// created_at : "2021-05-21T19:37:01.000000Z"
/// updated_at : "2021-05-21T19:37:01.000000Z"
/// total_quantity_added : 1000
/// total_quantity_subtracted : 0
/// total_quantity : 1000
/// sold_number : 0
/// last_price : 2
/// created_by : 1
/// category_id : 5
/// is_offer : 1
/// data : {"id":2,"title":"test case","slug":"test case","content":"<p>test case</p>","created_at":"2021-05-21T19:37:01.000000Z","updated_at":"2021-05-21T19:37:01.000000Z","created_by":1,"product_id":2}
/// product_images : [{"product_id":2,"image_name":"16216330221610548484bar1 f.jpg","created_at":"2021-05-21T19:37:02.000000Z","updated_at":"2021-05-21T19:37:02.000000Z","created_by":1},{"product_id":2,"image_name":"16216330221610548485bar1 f.jpg","created_at":"2021-05-21T19:37:02.000000Z","updated_at":"2021-05-21T19:37:02.000000Z","created_by":1}]

class MyProduct {
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
  Data data;
  List<Product_images> productImages;

  MyProduct({
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
      this.isOffer, 
      this.data, 
      this.productImages});

  MyProduct.fromJson(dynamic json) {
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
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    if (json["product_images"] != null) {
      productImages = [];
      json["product_images"].forEach((v) {
        productImages.add(Product_images.fromJson(v));
      });
    }
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
    if (data != null) {
      map["data"] = data.toJson();
    }
    if (productImages != null) {
      map["product_images"] = productImages.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_id : 2
/// image_name : "16216330221610548484bar1 f.jpg"
/// created_at : "2021-05-21T19:37:02.000000Z"
/// updated_at : "2021-05-21T19:37:02.000000Z"
/// created_by : 1

class Product_images {
  int productId;
  String imageName;
  String createdAt;
  String updatedAt;
  int createdBy;

  Product_images({
      this.productId, 
      this.imageName, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy});

  Product_images.fromJson(dynamic json) {
    productId = json["product_id"];
    imageName = json["image_name"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["product_id"] = productId;
    map["image_name"] = imageName;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    return map;
  }

}

/// id : 2
/// title : "test case"
/// slug : "test case"
/// content : "<p>test case</p>"
/// created_at : "2021-05-21T19:37:01.000000Z"
/// updated_at : "2021-05-21T19:37:01.000000Z"
/// created_by : 1
/// product_id : 2

class Data {
  int id;
  String title;
  String slug;
  String content;
  String createdAt;
  String updatedAt;
  int createdBy;
  int productId;

  Data({
      this.id, 
      this.title, 
      this.slug, 
      this.content, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.productId});

  Data.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    slug = json["slug"];
    content = json["content"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    productId = json["product_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["slug"] = slug;
    map["content"] = content;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    map["product_id"] = productId;
    return map;
  }

}