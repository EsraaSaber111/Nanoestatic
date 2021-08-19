/// message : "serial exist"
/// member : {"id":2,"serial":"231","is_checked":0,"created_at":"2021-08-17T11:59:25.000000Z","updated_at":"2021-08-11T13:47:31.000000Z","created_by":1,"main_image":"default.jpg","name":"Ahmed"}

class MemberModel {
  String message;
  Member member;

  MemberModel({
      this.message, 
      this.member});

  MemberModel.fromJson(dynamic json) {
    message = json['message'];
    member = json['member'] != null ? Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = message;
    if (member != null) {
      map['member'] = member.toJson();
    }
    return map;
  }

}


class Member {
  int id;
  String serial;
  int isChecked;
  String createdAt;
  String updatedAt;
  int createdBy;
  String mainImage;
  String name;

  Member({
      this.id, 
      this.serial, 
      this.isChecked, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.mainImage, 
      this.name});

  Member.fromJson(dynamic json) {
    id = json['id'];
    serial = json['serial'];
    isChecked = json['is_checked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    mainImage = json['main_image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['serial'] = serial;
    map['is_checked'] = isChecked;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['created_by'] = createdBy;
    map['main_image'] = mainImage;
    map['name'] = name;
    return map;
  }

}