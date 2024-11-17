// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/constant/custom_dialog.dart';
import 'package:first_app/core/constant/functions/check_internet.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/domain/usecase/add_user.dart';
import 'package:flutter/material.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit({
    required this.addUser,
  }) : super(SignState(
            confirmPasswordController: TextEditingController(),
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            formKey: GlobalKey()));
  final AddUser addUser;
  navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoot.login);
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

  @override
  Future<void> close() {
    state.emailController.dispose();
    state.passwordController.dispose();
    state.confirmPasswordController.dispose();

    return super.close();
  }

  signUp(BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      bool resultInternet = await chickIntrnet();
      if (resultInternet == true) {
        Map data = {
          "email": state.emailController.text,
          "username": state.passwordController.text,
          "password": state.confirmPasswordController.text,
        };
        emit(state.copyWith(
          requestStatus: RequestStatus.loading,
        ));
        ResultApi response = await addUser.addUser(data);
        if (response.isDone == true) {
          emit(state.copyWith(
            requestStatus: RequestStatus.successful,
          ));

          customDialog(
            context: context,
            title: 'Create Account',
            description: 'Created Account Successfuly',
            btnOkOnPress: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoot.login,
              );
            },
          ).show();
        } else {
          emit(state.copyWith(
            requestStatus: RequestStatus.error,
          ));
        }
      } else {
        emit(state.copyWith(
          isIntenetConection: false,
        ));
        customDialog(
                dialogType: DialogType.error,
                context: context,
                title: "No Conniction",
                description: "Check The Internet And Try Again",
                btnOkOnPress: () {})
            .show();
      }
    }
  }
}
