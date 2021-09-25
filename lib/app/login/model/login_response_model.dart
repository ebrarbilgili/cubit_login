import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  String? token;
  String? error;

  LoginResponseModel({
    this.token,
    this.error,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
