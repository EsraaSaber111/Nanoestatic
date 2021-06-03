/// message : "success"
/// about : {"id":1,"created_at":"2020-10-29T12:37:35.000000Z","updated_at":"2020-10-30T12:37:35.000000Z","created_by":1,"vision_image":"eewew","mission_image":"wewewe","value_image":"wewe","about_image":"weewee","data":{"id":1,"vision_title":"wewewe","vision_content":"eweewew","mission_title":"eewe","mission_content":"ewweew","value_title":"wee","value_content":"ewwewe","about_title":"wewe","about_content":"wewee","created_at":"2020-10-29T12:37:59.000000Z","updated_at":"2020-10-29T12:38:19.000000Z","created_by":1,"about_id":1}}

class AboutUsModel {
  String message;
  About about;

  AboutUsModel({
      this.message, 
      this.about});

  AboutUsModel.fromJson(dynamic json) {
    message = json["message"];
    about = json["about"] != null ? About.fromJson(json["about"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (about != null) {
      map["about"] = about.toJson();
    }
    return map;
  }

}

class About {
  int id;
  String createdAt;
  String updatedAt;
  int createdBy;
  String visionImage;
  String missionImage;
  String valueImage;
  String aboutImage;
  Data data;

  About({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.visionImage, 
      this.missionImage, 
      this.valueImage, 
      this.aboutImage, 
      this.data});

  About.fromJson(dynamic json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    visionImage = json["vision_image"];
    missionImage = json["mission_image"];
    valueImage = json["value_image"];
    aboutImage = json["about_image"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    map["vision_image"] = visionImage;
    map["mission_image"] = missionImage;
    map["value_image"] = valueImage;
    map["about_image"] = aboutImage;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}

class Data {
  int id;
  String visionTitle;
  String visionContent;
  String missionTitle;
  String missionContent;
  String valueTitle;
  String valueContent;
  String aboutTitle;
  String aboutContent;
  String createdAt;
  String updatedAt;
  int createdBy;
  int aboutId;

  Data({
      this.id, 
      this.visionTitle, 
      this.visionContent, 
      this.missionTitle, 
      this.missionContent, 
      this.valueTitle, 
      this.valueContent, 
      this.aboutTitle, 
      this.aboutContent, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.aboutId});

  Data.fromJson(dynamic json) {
    id = json["id"];
    visionTitle = json["vision_title"];
    visionContent = json["vision_content"];
    missionTitle = json["mission_title"];
    missionContent = json["mission_content"];
    valueTitle = json["value_title"];
    valueContent = json["value_content"];
    aboutTitle = json["about_title"];
    aboutContent = json["about_content"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    aboutId = json["about_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["vision_title"] = visionTitle;
    map["vision_content"] = visionContent;
    map["mission_title"] = missionTitle;
    map["mission_content"] = missionContent;
    map["value_title"] = valueTitle;
    map["value_content"] = valueContent;
    map["about_title"] = aboutTitle;
    map["about_content"] = aboutContent;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    map["about_id"] = aboutId;
    return map;
  }

}