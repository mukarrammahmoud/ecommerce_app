import 'dart:convert';

import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/model/prodect_model.dart';
import 'package:first_app/data/model/result_api.dart';

class ProdectRepo {
  final RemoteDataSource remoteDataSource;

  ProdectRepo(this.remoteDataSource);

  Future<ResultApi> getAllProdects() async {
    ResultApi resultApi = await remoteDataSource.getAllData();
    if (resultApi.isDone) {
      List data = jsonDecode(resultApi.resultOrError);
      List dataJsonList = data;

      List<ProdectModel> prodect = [];

      for (var element in dataJsonList) {
        prodect.add(ProdectModel.fromJson(element));
      }
      return ResultApi(isDone: true, resultOrError: prodect);
    } else {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }

  Future<ResultApi> getProdectByid(int id) async {
    ResultApi resultApi = await remoteDataSource.getOneprodect(id);
    if (resultApi.isDone) {
      Map data = jsonDecode(resultApi.resultOrError);
      // List dataJsonList = data;

      // List<ProdectModel> prodect = [];

      // for (var element in dataJsonList) {
      //   prodect.add(ProdectModel.fromJson(element));
      // }
      return ResultApi(isDone: true, resultOrError: data);
    } else {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }


  Future<ResultApi> filtterProdect(String categoryName) async {
    ResultApi resultApi = await remoteDataSource.filterCategory(categoryName);
    if (resultApi.isDone) {
      List data = jsonDecode(resultApi.resultOrError);
      List dataJsonList = data;

      List<ProdectModel> prodect = [];

      for (var element in dataJsonList) {
        prodect.add(ProdectModel.fromJson(
          element,
        ));
      }
      return ResultApi(isDone: true, resultOrError: prodect);
    } else {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }
}
