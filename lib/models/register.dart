/// message : "user created Successfully"

class Register {
  String message;

  Register({
      this.message});

  Register.fromJson(dynamic json) {
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    return map;
  }

}