import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/domain/entities/prodect.dart';
import 'package:first_app/domain/usecase/get_category.dart';
import 'package:first_app/domain/usecase/get_prodect.dart';
import 'package:first_app/presentation/controller/categort-of_prodect/cubit/category_of_prodect_cubit.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.getProdect,
    required this.getCategory,
  }) : super(const SearchState()) {
    getAllProdects();
    getAllCategory();
  }
  final GetProdect getProdect;
  final GetCategory getCategory;
  getAllProdects() async {
    emit(state.copyWith(
      requestStatus: RequestStatus.loading,
    ));
    if (prodect == null) {
      ResultApi response = await getProdect.fechProdect();
      if (response.isDone == true) {
        if (isClosed) return;
        emit(state.copyWith(
          prodects: List.from(response.resultOrError),
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
        requestStatus: RequestStatus.successful,
        prodects: List.from(prodect!),
      ));
    }
  }

  getAllCategory() async {
    emit(state.copyWith(
      requestStatus: RequestStatus.loading,
    ));

    if(cate==null)
    {
    ResultApi response = await getCategory.fechCategory();

    if (response.isDone == true) {
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
    }
    else{
       if (isClosed) return;
      emit(state.copyWith(
        category: List.from(cate!),
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

  onTapProdect(Prodects prodects, BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoot.prodectDetails,
      arguments: prodects,
    );
  }

  navigateToVoiceSearchPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.voiceSearch);
  }
}
