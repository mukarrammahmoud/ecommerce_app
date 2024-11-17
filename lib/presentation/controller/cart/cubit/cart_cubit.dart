// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/constant/custom_dialog.dart';
import 'package:first_app/core/constant/functions/check_internet.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/domain/entities/prodect_from_cart.dart';
import 'package:first_app/domain/usecase/get_cart_from_remote.dart';
import 'package:first_app/domain/usecase/get_prodect_by_id.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    required this.getCartFromRemote,
    required this.context,
    required this.getProdectById,
  }) : super(const CartState()) {
    getCartByUserId();
  }
  final GetCartFromRemote getCartFromRemote;
  final GetProdectById getProdectById;
  final BuildContext context;
  getCartByUserId() async {
    emit(state.copyWith(
      requestStatus: RequestStatus.loading,
    ));
    bool resultConnect = await chickIntrnet();

    if (resultConnect == true) {
      ResultApi response = await getCartFromRemote.fechCart();
      if (response.isDone == true) {
        if (isClosed) return;
        emit(
          state.copyWith(
            prodects: List.from(response.resultOrError),
            // requestStatus: RequestStatus.successful,
          ),
        );
        for (var element in state.prodects) {
          getProdectOneId(element.prodectId!);
        }
      } else {
        emit(state.copyWith(
          requestStatus: RequestStatus.error,
        ));
      }
    } else {
      emit(state.copyWith(
        isInternetConnect: false,
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

  getProdectOneId(int id) async {
    // ResultApi respone = await getProdectById.fechProdectById(id);
    // if (respone.isDone) {
    //   state.prodects.addAll(respone.resultOrError);
    //   print(state.prodects);
    // }
  }

  // decreaseCounter() {
  //   int? counter;
  //   counter = state.countItem;
  //   if (counter > 1) {
  //     counter--;
  //     emit(state.copyWith(
  //       countItem: counter,
  //     ));
  //   }
  // }

  // increaseCounter(int index) {}
  navigateToChekoutPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.checkOut);
  }

  navigateToPaymentPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.payment);
  }

  onSelectTypeDelvery(String val) {
    emit(state.copyWith(
      groupValue: val,
    ));
  }
}