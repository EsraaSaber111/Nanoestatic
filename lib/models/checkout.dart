/// message : "Message sent Successfully"

class CheckOut {
  String message;

  CheckOut({
    this.message});

  CheckOut.fromJson(dynamic json) {
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    return map;
  }

}