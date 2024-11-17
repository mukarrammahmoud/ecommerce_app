import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:flutter/material.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState());
  onSelectTypePaymentMethod(String val, int index) {
    emit(state.copyWith(
      groupValue: val,
      currentIndex: index,
    ));
  }

  navigateToDonePage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.done);
  }

  navigateToHomePage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoot.home,
      (route) => false,
    );
  }

  navigateToOrderTracingPage(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoot.orderTracking,
    );
  }

  List itemPaymentMethod = [
    {
      "title": "visa",
      "pathImage": AppImages.visa,
    },
    {
      "title": "PayPal",
      "pathImage": AppImages.paypal,
    },
  ];
}
