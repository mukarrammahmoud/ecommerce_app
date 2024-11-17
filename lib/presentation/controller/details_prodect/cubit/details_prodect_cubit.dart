// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/constant/functions/check_internet.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/domain/entities/prodect.dart';
import 'package:first_app/domain/usecase/add_to_cart.dart';
import 'package:first_app/domain/usecase/get_cart_from_local.dart';
import 'package:flutter/material.dart';
part 'details_prodect_state.dart';

class DetailsProdectCubit extends Cubit<DetailsProdectState> {
  DetailsProdectCubit({
    required this.addToCart,
    required this.getCartFromLocal,
  }) : super(const DetailsProdectState()) {
    // getCartFromLocalDataBase();
  }
  final AddToCart addToCart;
  final GetCartFromLocal getCartFromLocal;
  List<Color> colorsProdect = [
    Colors.black,
    Colors.yellow,
    Colors.cyan,
    Colors.brown,
  ];
  onTapReadMore() {
    emit(state.copyWith(isReadMore: !state.isReadMore));
  }

  void addToMyCart(Prodects prodect, BuildContext context) async {
    emit(state.copyWith(
      requestStatus: RequestStatus.loading,
    ));
    bool resultConnect = await chickIntrnet();

    if (resultConnect == true) {
      Map data = {
        "userId": 11,
        "date": DateTime.now().toString(),
        "products": [
          {"productId": prodect.id, "quantity": state.countItem},
        ]
      };
      emit(state.copyWith(
        isIntenetConection: resultConnect,
        requestStatus: RequestStatus.loading,
      ));
      ResultApi response = await addToCart.addToMycart(data);
      if (response.isDone == true) {
        emit(state.copyWith(
          requestStatus: RequestStatus.successful,
        ));
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Cart',
          desc: 'Added To Cart Successfuly',
          btnOkOnPress: () {},
        ).show();
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

  increaseCounter() {
    int? counter;
    counter = state.countItem;
    counter++;

    emit(state.copyWith(
      countItem: counter,
    ));
  }

  decreaseCounter() {
    int? counter;
    counter = state.countItem;
    if (counter > 1) {
      counter--;
      emit(state.copyWith(
        countItem: counter,
      ));
    }
  }

  void selcetColor(int index) {
    emit(state.copyWith(selectedColorIndex: index));
  }

  void getCartFromLocalDataBase() async {
    ResultApi response = await getCartFromLocal.getMycartLocal();
    if (response.isDone == true) {
      emit(state.copyWith(
        requestStatus: RequestStatus.successful,
      ));
    } else {
      emit(state.copyWith(
        requestStatus: RequestStatus.error,
      ));
    }
  }
}

// class CartRepository {
//   final List<Prodects> _cart = [];

//   List<Prodects> get cart => _cart;

//   void addToCart(Prodects prodect) {
//     _cart.add(prodect);
//   }
// }
