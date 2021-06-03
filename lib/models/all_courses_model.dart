/// message : "success"
/// allCourses : [{"id":3,"main_image":"16218661871610890468m21-testi-1.png","created_at":"2021-05-24T12:23:07.000000Z","updated_at":"2021-05-24T12:23:07.000000Z","last_price":10,"created_by":1,"data":{"id":1,"title":"PPT course","slug":"PPT course","content":"<p>PPT course</p>","created_at":"2021-05-24T12:23:07.000000Z","updated_at":"2021-05-24T12:23:07.000000Z","created_by":1,"course_id":3}},{"id":4,"main_image":"16218663511610890483m21-testi-1.png","created_at":"2021-05-24T12:25:51.000000Z","updated_at":"2021-05-24T12:25:51.000000Z","last_price":1111,"created_by":1,"data":{"id":2,"title":"TTX course","slug":"TTX course","content":"<p>TTX course</p>","created_at":"2021-05-24T12:25:51.000000Z","updated_at":"2021-05-24T12:25:51.000000Z","created_by":1,"course_id":4}}]

class Courses {
  String message;
  List<AllCourses> allCourses;

  Courses({
      this.message, 
      this.allCourses});

  Courses.fromJson(dynamic json) {
    message = json["message"];
    if (json["allCourses"] != null) {
      allCourses = [];
      json["allCourses"].forEach((v) {
        allCourses.add(AllCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (allCourses != null) {
      map["allCourses"] = allCourses.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// main_image : "16218661871610890468m21-testi-1.png"
/// created_at : "2021-05-24T12:23:07.000000Z"
/// updated_at : "2021-05-24T12:23:07.000000Z"
/// last_price : 10
/// created_by : 1
/// data : {"id":1,"title":"PPT course","slug":"PPT course","content":"<p>PPT course</p>","created_at":"2021-05-24T12:23:07.000000Z","updated_at":"2021-05-24T12:23:07.000000Z","created_by":1,"course_id":3}

class AllCourses {
  int id;
  String mainImage;
  String createdAt;
  String updatedAt;
  int lastPrice;
  int createdBy;
  Data data;

  AllCourses({
      this.id, 
      this.mainImage, 
      this.createdAt, 
      this.updatedAt, 
      this.lastPrice, 
      this.createdBy, 
      this.data});

  AllCourses.fromJson(dynamic json) {
    id = json["id"];
    mainImage = json["main_image"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    lastPrice = json["last_price"];
    createdBy = json["created_by"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["main_image"] = mainImage;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["last_price"] = lastPrice;
    map["created_by"] = createdBy;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}

/// id : 1
/// title : "PPT course"
/// slug : "PPT course"
/// content : "<p>PPT course</p>"
/// created_at : "2021-05-24T12:23:07.000000Z"
/// updated_at : "2021-05-24T12:23:07.000000Z"
/// created_by : 1
/// course_id : 3

class Data {
  int id;
  String title;
  String slug;
  String content;
  String createdAt;
  String updatedAt;
  int createdBy;
  int courseId;

  Data({
      this.id, 
      this.title, 
      this.slug, 
      this.content, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.courseId});

  Data.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    slug = json["slug"];
    content = json["content"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    courseId = json["course_id"];
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
    map["course_id"] = courseId;
    return map;
  }

}