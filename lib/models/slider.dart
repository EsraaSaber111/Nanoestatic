/// message : "success"
/// allSliders : [{"id":1,"image":"1622722874elixires OKok.png","created_at":"2021-06-03T12:21:14.000000Z","updated_at":"2021-06-03T12:21:14.000000Z","created_by":1,"data":{"id":1,"first_word":"x","second_word":"x","link_text":"x","created_by":1,"slider_id":1,"created_at":"2021-06-03T12:21:14.000000Z","updated_at":"2021-06-03T12:21:14.000000Z"}},{"id":2,"image":"1622722914bodegon gris claro_0.png","created_at":"2021-06-03T12:21:54.000000Z","updated_at":"2021-06-03T12:21:54.000000Z","created_by":1,"data":{"id":2,"first_word":"y","second_word":"y","link_text":"y","created_by":1,"slider_id":2,"created_at":"2021-06-03T12:21:54.000000Z","updated_at":"2021-06-03T12:21:54.000000Z"}},{"id":3,"image":"1622722963reducer-pills-bodyshock.png","created_at":"2021-06-03T12:22:43.000000Z","updated_at":"2021-06-03T12:22:43.000000Z","created_by":1,"data":{"id":3,"first_word":"z","second_word":"z","link_text":"z","created_by":1,"slider_id":3,"created_at":"2021-06-03T12:22:43.000000Z","updated_at":"2021-06-03T12:22:43.000000Z"}}]

class Sliders {
  String message;
  List<AllSliders> allSliders;

  Sliders({
      this.message, 
      this.allSliders});

  Sliders.fromJson(dynamic json) {
    message = json["message"];
    if (json["allSliders"] != null) {
      allSliders = [];
      json["allSliders"].forEach((v) {
        allSliders.add(AllSliders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (allSliders != null) {
      map["allSliders"] = allSliders.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// image : "1622722874elixires OKok.png"
/// created_at : "2021-06-03T12:21:14.000000Z"
/// updated_at : "2021-06-03T12:21:14.000000Z"
/// created_by : 1
/// data : {"id":1,"first_word":"x","second_word":"x","link_text":"x","created_by":1,"slider_id":1,"created_at":"2021-06-03T12:21:14.000000Z","updated_at":"2021-06-03T12:21:14.000000Z"}

class AllSliders {
  int id;
  String image;
  String createdAt;
  String updatedAt;
  int createdBy;
  Data data;

  AllSliders({
      this.id, 
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.data});

  AllSliders.fromJson(dynamic json) {
    id = json["id"];
    image = json["image"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["image"] = image;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}

/// id : 1
/// first_word : "x"
/// second_word : "x"
/// link_text : "x"
/// created_by : 1
/// slider_id : 1
/// created_at : "2021-06-03T12:21:14.000000Z"
/// updated_at : "2021-06-03T12:21:14.000000Z"

class Data {
  int id;
  String firstWord;
  String secondWord;
  String linkText;
  int createdBy;
  int sliderId;
  String createdAt;
  String updatedAt;

  Data({
      this.id, 
      this.firstWord, 
      this.secondWord, 
      this.linkText, 
      this.createdBy, 
      this.sliderId, 
      this.createdAt, 
      this.updatedAt});

  Data.fromJson(dynamic json) {
    id = json["id"];
    firstWord = json["first_word"];
    secondWord = json["second_word"];
    linkText = json["link_text"];
    createdBy = json["created_by"];
    sliderId = json["slider_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["first_word"] = firstWord;
    map["second_word"] = secondWord;
    map["link_text"] = linkText;
    map["created_by"] = createdBy;
    map["slider_id"] = sliderId;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    return map;
  }

}