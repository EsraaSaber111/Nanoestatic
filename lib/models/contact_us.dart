///new
class ContactUs {
  String message;
  Contact contact;

  ContactUs({
      this.message, 
      this.contact});

  ContactUs.fromJson(dynamic json) {
    message = json["message"];
    contact = json["contact"] != null ? Contact.fromJson(json["contact"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (contact != null) {
      map["contact"] = contact.toJson();
    }
    return map;
  }

}


class Contact {
  int id;
  String email;
  String phone;
  String anotherPhone;
  String location;
  String facebook;
  String twitter;
  String instagram;
  String youtube;
  String linkedin;
  String whatsapp;
  String behance;
  String pintrest;
  String googleplus;
  String snapchat;
  String tiktok;
  String createdAt;
  String updatedAt;
  int createdBy;
  Data data;

  Contact({
      this.id, 
      this.email, 
      this.phone, 
      this.anotherPhone, 
      this.location, 
      this.facebook, 
      this.twitter, 
      this.instagram, 
      this.youtube, 
      this.linkedin, 
      this.whatsapp, 
      this.behance, 
      this.pintrest, 
      this.googleplus, 
      this.snapchat, 
      this.tiktok, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.data});

  Contact.fromJson(dynamic json) {
    id = json["id"];
    email = json["email"];
    phone = json["phone"];
    anotherPhone = json["another_phone"];
    location = json["location"];
    facebook = json["facebook"];
    twitter = json["twitter"];
    instagram = json["instagram"];
    youtube = json["youtube"];
    linkedin = json["linkedin"];
    whatsapp = json["whatsapp"];
    behance = json["behance"];
    pintrest = json["pintrest"];
    googleplus = json["googleplus"];
    snapchat = json["snapchat"];
    tiktok = json["tiktok"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["email"] = email;
    map["phone"] = phone;
    map["another_phone"] = anotherPhone;
    map["location"] = location;
    map["facebook"] = facebook;
    map["twitter"] = twitter;
    map["instagram"] = instagram;
    map["youtube"] = youtube;
    map["linkedin"] = linkedin;
    map["whatsapp"] = whatsapp;
    map["behance"] = behance;
    map["pintrest"] = pintrest;
    map["googleplus"] = googleplus;
    map["snapchat"] = snapchat;
    map["tiktok"] = tiktok;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}


class Data {
  int id;
  String address;
  String createdAt;
  String updatedAt;
  int createdBy;
  int contactId;

  Data({
      this.id, 
      this.address, 
      this.createdAt, 
      this.updatedAt, 
      this.createdBy, 
      this.contactId});

  Data.fromJson(dynamic json) {
    id = json["id"];
    address = json["address"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    createdBy = json["created_by"];
    contactId = json["contact_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["address"] = address;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    map["created_by"] = createdBy;
    map["contact_id"] = contactId;
    return map;
  }

}