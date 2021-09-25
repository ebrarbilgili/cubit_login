import 'package:dio/dio.dart';

import '../model/login_model.dart';
import '../model/login_response_model.dart';

class LoginService {
  final Dio service;
  LoginService({required this.service});

  Future<LoginResponseModel?> loginService(LoginModel loginModel) async {
    final data = {
      'email': loginModel.email,
      'password': loginModel.password,
    };

    bool validateStatus(status) {
      return status! <= 500;
    }

    final options = Options(validateStatus: validateStatus);

    final response = await service.post(
      '/login',
      options: options,
      data: data,
    );

    return LoginResponseModel.fromJson(response.data);
  }
}
// {
//     "email": "eve.holt@reqres.in",
//     "password": "cityslicka"
// }