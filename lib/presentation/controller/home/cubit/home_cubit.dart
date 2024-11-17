// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/constant/custom_dialog.dart';
import 'package:first_app/core/constant/functions/check_internet.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/domain/entities/prodect.dart';
import 'package:first_app/domain/usecase/get_category.dart';
import 'package:first_app/domain/usecase/get_prodect.dart';
import 'package:first_app/presentation/controller/categort-of_prodect/cubit/category_of_prodect_cubit.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getProdect,
    required this.getCategory,
    required this.context,
  }) : super(const HomeState()) {
    getAllProdects();
    getAllCategory();
  }
  final BuildContext context;
  final GetProdect getProdect;
  final GetCategory getCategory;
  onTapBottmNavgitor(int index, BuildContext context) {
    emit(state.copyWith(
      currentIndex: index,
    ));
  }

  List listTrendingProdects = [
    "All",
    "Men",
    'Women',
    'Shirts',
    'Kids',
    'Shoes',
    'Clothes',
  ];

  void onSelectedItemTrending(int index) {
    emit(state.copyWith(selectedItemIndex: index));
  }

  getAllProdects() async {
    emit(state.copyWith(
      requestStatus: RequestStatus.loading,
    ));
    if (prodect == null) {
      ResultApi response = await getProdect.fechProdect();
      if (response.isDone == true) {
        prodect = List.from(response.resultOrError);

        emit(state.copyWith(
          prodects: List.from(response.resultOrError),
          requestStatus: RequestStatus.successful,
        ));
      } else {
        emit(state.copyWith(
          requestStatus: RequestStatus.error,
        ));
      }
    } else {
      emit(state.copyWith(
        prodects: List.from(prodect!),
        requestStatus: RequestStatus.successful,
      ));
    }
  }

  filtterProdectByCategory(String categoryName) async {
    emit(state.copyWith(
      requestStatus: RequestStatus.loading,
    ));
    ResultApi response = await getProdect.filterProdect(categoryName);

    if (response.isDone == true) {
      emit(state.copyWith(
        prodects: List.from(response.resultOrError),
        requestStatus: RequestStatus.successful,
      ));
    } else {
      emit(state.copyWith(
        requestStatus: RequestStatus.error,
      ));
    }
  }

  getAllCategory() async {
    emit(state.copyWith(
      isInternetConnect: await chickIntrnet(),
    ));
    if (state.isInternetConnect == true) {
      emit(state.copyWith(
        requestStatus: RequestStatus.loading,
      ));
      if (cate == null) {
        ResultApi response = await getCategory.fechCategory();

        if (response.isDone == true) {
          cate = List.from(response.resultOrError);
          if (isClosed) return;
          emit(state.copyWith(
            category: List.from(response.resultOrError),
            requestStatus: RequestStatus.successful,
          ));
        } else {
          if (isClosed) return;
          emit(state.copyWith(
            requestStatus: RequestStatus.error,
          ));
        }
      } else {
        if (isClosed) return;
        emit(state.copyWith(
          category: List.from(cate!),
          requestStatus: RequestStatus.successful,
        ));
      }
    } else {
      customDialog(
              dialogType: DialogType.error,
              context: context,
              title: "No Conniction",
              description: "Check The Internet And Try Again",
              btnOkOnPress: () {})
          .show();
    }
  }

  onTapProdect(Prodects prodects, BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoot.prodectDetails,
      arguments: prodects,
    );
  }

  navigateToSearchPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.search);
  }

  navigateToNotificationPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.notification);
  }

  navigateToVoiceSearchPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.voiceSearch);
  }

  navigateToCategoryPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.category);
  }
}

class ProdectsRepository {
  static final ProdectsRepository _instance = ProdectsRepository._internal();

  List<Prodects> prodects = [];

  ProdectsRepository._internal();

  factory ProdectsRepository() {
    return _instance;
  }
}
