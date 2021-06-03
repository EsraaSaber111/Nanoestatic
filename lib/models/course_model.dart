/// message : "success"
/// course : {"id":3,"main_image":"16218661871610890468m21-testi-1.png","created_at":"2021-05-24T12:23:07.000000Z","updated_at":"2021-05-24T12:23:07.000000Z","last_price":10,"created_by":1,"data":{"id":1,"title":"PPT course","slug":"PPT course","content":"<p>PPT course</p>","created_at":"2021-05-24T12:23:07.000000Z","updated_at":"2021-05-24T12:23:07.000000Z","created_by":1,"course_id":3},"course_images":[{"course_id":3,"image_name":"16218661871619008229about-bg3.jpg","created_at":"2021-05-24T12:23:07.000000Z","updated_at":"2021-05-24T12:23:07.000000Z","created_by":1}]}

class Course_Model {
  String message;
  Course course;

  Course_Model({
      this.message, 
      this.course});

  Course_Model.fromJson(dynamic json) {
    message = json["message"];
    course = json["course"] != null ? Course.fromJson(json["course"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (course != null) {
      map["course"] = course.toJson();
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
/// course_images : [{"course_id":3,"image_name":"16218661871619008229about-bg3.jpg","created_at":"2021-05-24T12:23:07.000000Z","updated_at":"2021-05-24T12:23:07.000000Z","created_by":1}]

class Course {
  int id;
  String mainImage;
  String createdAt;
  String updatedAt;
  int lastPrice;
  int createdBy;
  Data data;
  List<Course_images> courseImages;

  Course({
      this.id, 
      this.mainImage, 
      this.createdAt, 
      this.updatedAt, 
      this.lastPrice, 
      this.createdBy, 
      this.data, 
      this.courseImages});

  Course.fromJson(dynamic json) {
    id = json["id"];
    mainImage = json["main_image"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    lastPrice = json["last_price"];
    createdBy = json["created_by"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    if (json["course_images"] != null) {
      courseImages = [];
      json["course_images"].forEach((v) {
        courseImages.add(Course_images.fromJson(v));
      });
    }
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
    if (courseImages != null) {
      map["course_images"] = courseImages.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// course_id : 3
/// image_name : "16218661871619008229about-bg3.jpg"
/// created_at : "2021-05-24T12:23:07.000000Z"
/// updated_at : "2021-05-24T12:23:07.000000Z"
/// created_by : 1

class Course_images {
  int courseId;
  String imageName;
  String createdAt;
  String updatedAt;
  int createdBy;

  Course_images({
      this.courseId, 
      this.imageName, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy});

  Course_images.fromJson(dynamic json) {
    courseId = json["course_id"];
    imageName = json["image_name"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["course_id"] = courseId;
    map["image_name"] = imageName;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
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