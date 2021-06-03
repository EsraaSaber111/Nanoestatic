/// message : "Message sent Successfully"

class Inquiry {
  String message;

  Inquiry({
      this.message});

  Inquiry.fromJson(dynamic json) {
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    return map;
  }

}