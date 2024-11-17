import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/domain/entities/prodect.dart';
import 'package:first_app/domain/usecase/get_prodect.dart';
import 'package:first_app/presentation/controller/categort-of_prodect/cubit/category_of_prodect_cubit.dart';
import 'package:flutter/material.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({
    required this.getProdect,
  }) : super(const CategoryState()) {
    getAllProdects();
    categoryFilter();
  }
  final GetProdect getProdect;

  getAllProdects() async {
    if (cate != null) {
      if (isClosed) return;
      emit(state.copyWith(
        requestStatus: RequestStatus.loading,
      ));

      if (isClosed) return;
      emit(state.copyWith(
        requestStatus: RequestStatus.successful,
        category: List.from(cate!),
        prodects: List.from(prodect!),
      ));
    } else {
      if (isClosed) return;
      emit(state.copyWith(
        requestStatus: RequestStatus.error,
      ));
    }
  }

  clearCategory() {
    emit(state.copyWith(
      cate: [],
    ));
    listFilteringBrands.clear();
  }

  navigateToVoiceSearchPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.voiceSearch);
  }

  categoryFilter() {
    List listFiltering = [
      'Shorts',
      'Bages',
      'Jacket',
      'Jeans',
      'Shorts',
      'Shirts',
      'Pants',
      'Shorts',
    ];
    emit(state.copyWith(
      cate: listFiltering,
    ));
  }

  List listFilteringBrands = [
    'Nike',
    'Puma',
    'Aarong',
    'Prada',
    'Gucci',
    'Chanel',
  ];
  void selcetItemToFilterCategory(int index) {
    emit(state.copyWith(selectedfilter: index));
  }

  onChangeValueSlider(RangeValues rangeValues) {
    emit(state.copyWith(
      rangeValue: rangeValues,
    ));
  }

  void onSelectedColor(int index) {
    emit(state.copyWith(selectedColorIndex: index));
  }

  void selcetItemToFilterBrands(int index) {
    emit(state.copyWith(selectedfilterBrands: index));
  }

  List<Color> colorsFilter = [
    Colors.grey,
    Colors.yellow,
    Colors.cyan,
    Colors.blueGrey,
    Colors.purple,
  ];
  navigateToProdectOfCategory(
      BuildContext context, Prodects prodects, String categoyName) {
    Navigator.of(context).pushNamed(
      AppRoot.prodectOfCategory,
      arguments: categoyName,
    );
  }

 

}
