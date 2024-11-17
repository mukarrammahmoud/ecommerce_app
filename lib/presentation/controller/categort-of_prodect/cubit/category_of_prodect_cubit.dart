import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/domain/entities/prodect.dart';
import 'package:first_app/domain/usecase/get_prodect.dart';
import 'package:flutter/material.dart';

part 'category_of_prodect_state.dart';

class CategoryOfProdectCubit extends Cubit<CategoryOfProdectState> {
  CategoryOfProdectCubit({
    required this.getProdect,
    required this.categoryName,
  }) : super(const CategoryOfProdectState()) {
    filtterProdectByCategory(categoryName);
  }
  final GetProdect getProdect;
  final String categoryName;
  filtterProdectByCategory(String categoryName) async {
    emit(state.copyWith(
      requestStatus: RequestStatus.loading,
    ));

    ResultApi response = await getProdect.filterProdect(categoryName);
    if (response.isDone == true) {
    prodect = List.from(response.resultOrError);

      if (isClosed) return;
      emit(state.copyWith(
        requestStatus: RequestStatus.successful,
        prodects: List.from(response.resultOrError),
      ));
    } else {
      emit(state.copyWith(
        requestStatus: RequestStatus.error,
      ));
    }
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
  void onSelectedItem(int index) {
    emit(state.copyWith(selectedItemIndex: index));
  }

  onTapProdect(Prodects prodects, BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoot.prodectDetails,
      arguments: prodects,
    );
  }

  navigateToFilterscreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoot.filterScreen,
    );
  }
}

List<Prodects>? prodect;
List? cate;
