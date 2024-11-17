// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/constant/functions/check_internet.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/domain/usecase/login.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginUser,
  }) : super(LoginState(
          emailController: TextEditingController(),
          formKey: GlobalKey(),
          passwordController: TextEditingController(),
        ));
  final LoginUser loginUser;
  navigateToSignUp(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoot.sign);
  }

  @override
  Future<void> close() {
    state.emailController.dispose();
    state.passwordController.dispose();
    return super.close();
  }

  login(BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      emit(state.copyWith(
        requestStatus: RequestStatus.loading,
      ));
      bool resultConnect = await chickIntrnet();

      if (resultConnect == true) {
        Map data = {
          "username": state.emailController.text.trim(),
          "password": state.passwordController.text.trim(),
        };
        emit(state.copyWith(
          isIntenetConection: resultConnect,
          requestStatus: RequestStatus.loading,
        ));
        ResultApi response = await loginUser.login(data);
        if (response.isDone == true) {
          emit(state.copyWith(
            requestStatus: RequestStatus.successful,
          ));

          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoot.home,
            (route) => false,
          );
        } else {
          emit(state.copyWith(
            requestStatus: RequestStatus.error,
          ));
        }
      } else {
        emit(state.copyWith(
          requestStatus: RequestStatus.error,
          isIntenetConection: false,
        ));
      }
    }
  }

  void showHidePassword() {
    emit(state.copyWith(
      showPassword: !state.showPassword,
    ));
  }

  changeCheckTerm() {
    emit(state.copyWith(
      checkTerm: !state.checkTerm,
    ));
  }

  navigateToNoConnectionScreen(BuildContext context) {}
}
