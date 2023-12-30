/// data : {"token":"37|Ts1AOcb7luIu4tTzMGBHNCCxd2wWYvBph1ss2qNv","user":{"id":1,"name":"admin","slug":"admin","picture":null,"email":"admin@gmail.com","phone":"01234567890","email_verified_at":null,"balance":null,"type":"1","status":"1","created_at":"2023-12-17T12:19:40.000000Z","updated_at":"2023-12-17T12:19:40.000000Z"}}
/// message : "Success"
/// status : 1

class SignInResponse {
  SignInResponse({
      Data? data, 
      String? message, 
      num? status,}){
    _data = data;
    _message = message;
    _status = status;
}

  SignInResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _status = json['status'];
  }
  Data? _data;
  String? _message;
  num? _status;
SignInResponse copyWith({  Data? data,
  String? message,
  num? status,
}) => SignInResponse(  data: data ?? _data,
  message: message ?? _message,
  status: status ?? _status,
);
  Data? get data => _data;
  String? get message => _message;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}

/// token : "37|Ts1AOcb7luIu4tTzMGBHNCCxd2wWYvBph1ss2qNv"
/// user : {"id":1,"name":"admin","slug":"admin","picture":null,"email":"admin@gmail.com","phone":"01234567890","email_verified_at":null,"balance":null,"type":"1","status":"1","created_at":"2023-12-17T12:19:40.000000Z","updated_at":"2023-12-17T12:19:40.000000Z"}

class Data {
  Data({
      String? token, 
      User? user,}){
    _token = token;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _token;
  User? _user;
Data copyWith({  String? token,
  User? user,
}) => Data(  token: token ?? _token,
  user: user ?? _user,
);
  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "admin"
/// slug : "admin"
/// picture : null
/// email : "admin@gmail.com"
/// phone : "01234567890"
/// email_verified_at : null
/// balance : null
/// type : "1"
/// status : "1"
/// created_at : "2023-12-17T12:19:40.000000Z"
/// updated_at : "2023-12-17T12:19:40.000000Z"

class User {
  User({
      num? id, 
      String? name, 
      String? slug, 
      dynamic picture, 
      String? email, 
      String? phone, 
      dynamic emailVerifiedAt, 
      dynamic balance, 
      String? type, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _slug = slug;
    _picture = picture;
    _email = email;
    _phone = phone;
    _emailVerifiedAt = emailVerifiedAt;
    _balance = balance;
    _type = type;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _picture = json['picture'];
    _email = json['email'];
    _phone = json['phone'];
    _emailVerifiedAt = json['email_verified_at'];
    _balance = json['balance'];
    _type = json['type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _slug;
  dynamic _picture;
  String? _email;
  String? _phone;
  dynamic _emailVerifiedAt;
  dynamic _balance;
  String? _type;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  String? name,
  String? slug,
  dynamic picture,
  String? email,
  String? phone,
  dynamic emailVerifiedAt,
  dynamic balance,
  String? type,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
  picture: picture ?? _picture,
  email: email ?? _email,
  phone: phone ?? _phone,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  balance: balance ?? _balance,
  type: type ?? _type,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  dynamic get picture => _picture;
  String? get email => _email;
  String? get phone => _phone;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get balance => _balance;
  String? get type => _type;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['picture'] = _picture;
    map['email'] = _email;
    map['phone'] = _phone;
    map['email_verified_at'] = _emailVerifiedAt;
    map['balance'] = _balance;
    map['type'] = _type;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}