import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:flutter/material.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.context,
  }) : super(const SplashState()) {
    navigatToOnBorading();
  }
  final BuildContext context;
  navigatToOnBorading() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoot.onBoarding, (route) => false);
    });
  }
}
