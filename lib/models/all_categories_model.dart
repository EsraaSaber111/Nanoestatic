/// message : "success"
/// allCategories : [{"id":5,"main_image":"16216293501610548484bar1 f.jpg","created_at":"2021-05-21T18:35:50.000000Z","updated_at":"2021-05-21T18:35:50.000000Z","created_by":1,"category_id":null,"data":{"id":3,"name":"رجالي","slug":"رجالي","description":"Man Product","created_at":"2021-05-21T18:35:51.000000Z","updated_at":"2021-05-21T18:39:35.000000Z","created_by":1,"category_id":5}}]

class AllCategoriesModel {
  String message;
  List<AllCategories> allCategories;

  AllCategoriesModel({
      this.message, 
      this.allCategories});

  AllCategoriesModel.fromJson(dynamic json) {
    message = json["message"];
    if (json["allCategories"] != null) {
      allCategories = [];
      json["allCategories"].forEach((v) {
        allCategories.add(AllCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (allCategories != null) {
      map["allCategories"] = allCategories.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 5
/// main_image : "16216293501610548484bar1 f.jpg"
/// created_at : "2021-05-21T18:35:50.000000Z"
/// updated_at : "2021-05-21T18:35:50.000000Z"
/// created_by : 1
/// category_id : null
/// data : {"id":3,"name":"رجالي","slug":"رجالي","description":"Man Product","created_at":"2021-05-21T18:35:51.000000Z","updated_at":"2021-05-21T18:39:35.000000Z","created_by":1,"category_id":5}

class AllCategories {
  int id;
  String mainImage;
  String createdAt;
  String updatedAt;
  int createdBy;
  int categoryId;
  Data data;

  AllCategories({
      this.id, 
      this.mainImage, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.categoryId, 
      this.data});

  AllCategories.fromJson(dynamic json) {
    id = json["id"];
    mainImage = json["main_image"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    categoryId = json["category_id"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["main_image"] = mainImage;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    map["category_id"] = categoryId;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}

/// id : 3
/// name : "رجالي"
/// slug : "رجالي"
/// description : "Man Product"
/// created_at : "2021-05-21T18:35:51.000000Z"
/// updated_at : "2021-05-21T18:39:35.000000Z"
/// created_by : 1
/// category_id : 5

class Data {
  int id;
  String name;
  String slug;
  String description;
  String createdAt;
  String updatedAt;
  int createdBy;
  int categoryId;

  Data({
      this.id, 
      this.name, 
      this.slug, 
      this.description, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.categoryId});

  Data.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    slug = json["slug"];
    description = json["description"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    categoryId = json["category_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["description"] = description;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    map["category_id"] = categoryId;
    return map;
  }

}