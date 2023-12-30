class BaseResponse<T extends Object?>{
  BaseResponse({
    this.success,
    this.message,
    this.code,
    this.data});
  bool? success;
  List<String>? message;
  int? code;
  T? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['code'] = code;
    map['data'] = data;
    return map;
  }

  factory BaseResponse.fromJson(Map<String,dynamic> json, {Function(Map<String, dynamic>)? build}){
    List<String> messages = [];
    if (json['message'] != null) {
      json['message'].forEach((v) {
        messages.add(v);
      });
    }
    return BaseResponse<T>(success: json['success'],code: json['code'],message: messages,data: json['data']!=null?build!(json['data']):null);
  }
}
