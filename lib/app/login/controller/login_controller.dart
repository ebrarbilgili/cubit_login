import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../model/login_model.dart';
import '../model/login_response_model.dart';
import '../service/login_service.dart';

part 'state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.service}) : super(const LoginInitial());

  LoginService service;

  Future<void> onPressedLogin(TextEditingController emailController,
      TextEditingController passwordController) async {
    emit(LoginLoading());

    final model = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );

    final response = await service.loginService(model);

    print(json.encode(response));

    if (response is LoginResponseModel) {
      emit(LoginCompleted(response));
    } else {
      // emit(LoginError('Error'));
      emit(LoginInitial());
    }
  }
}
