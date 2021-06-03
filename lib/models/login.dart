/// message : "user login Successfully"
/// user : {"id":9,"name":"esraa","email":"esraa@gmail.com","email_verified_at":null,"main_image":"default.jpg","phone":"01111","created_by":1,"city_id":1,"created_at":"2021-05-28T18:52:43.000000Z","updated_at":"2021-05-29T00:40:08.000000Z","address":"test address","user_token":"AtaaFS7kKgS1Ab3cMNC1MLyifIZusGxCJjOUUOnFnxR5R63oZ1VfRHgepsH0"}

class Login {
  String message;
  User user;

  Login({
      this.message, 
      this.user});

  Login.fromJson(dynamic json) {
    message = json["message"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (user != null) {
      map["user"] = user.toJson();
    }
    return map;
  }

}

/// id : 9
/// name : "esraa"
/// email : "esraa@gmail.com"
/// email_verified_at : null
/// main_image : "default.jpg"
/// phone : "01111"
/// created_by : 1
/// city_id : 1
/// created_at : "2021-05-28T18:52:43.000000Z"
/// updated_at : "2021-05-29T00:40:08.000000Z"
/// address : "test address"
/// user_token : "AtaaFS7kKgS1Ab3cMNC1MLyifIZusGxCJjOUUOnFnxR5R63oZ1VfRHgepsH0"

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String mainImage;
  String phone;
  int createdBy;
  int cityId;
  String createdAt;
  String updatedAt;
  String address;
  String userToken;

  User({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.mainImage, 
      this.phone, 
      this.createdBy, 
      this.cityId, 
      this.createdAt, 
      this.updatedAt, 
      this.address, 
      this.userToken});

  User.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    mainImage = json["main_image"];
    phone = json["phone"];
    createdBy = json["created_by"];
    cityId = json["city_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    address = json["address"];
    userToken = json["user_token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["email_verified_at"] = emailVerifiedAt;
    map["main_image"] = mainImage;
    map["phone"] = phone;
    map["created_by"] = createdBy;
    map["city_id"] = cityId;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["address"] = address;
    map["user_token"] = userToken;
    return map;
  }

}