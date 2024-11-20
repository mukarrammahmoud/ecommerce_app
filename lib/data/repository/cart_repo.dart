import 'dart:convert';

import 'package:first_app/data/data_source/local_data_source.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/model/cart_model.dart';
import 'package:first_app/data/model/result_api.dart';

class CartRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  CartRepo(
    this.remoteDataSource,
    this.localDataSource,
  );

  Future<ResultApi> addCart(Map data) async {
    ResultApi resultApi = await remoteDataSource.addToCart(data);
    if (resultApi.isDone) {
      Map data = jsonDecode(resultApi.resultOrError);

      return ResultApi(isDone: true, resultOrError: data);
    } else {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }

  Future<ResultApi> getMyCart() async {
    ResultApi resultApi = await remoteDataSource.getMyCart();

    if (resultApi.isDone) {
      Map<String, dynamic> dataJsonList = jsonDecode(resultApi.resultOrError);
     
      List<Product> prodectOfCart = [];

      for (var element in dataJsonList['products']) {
        prodectOfCart.add(Product.fromJson(element));
      }
      return ResultApi(isDone: true, resultOrError: prodectOfCart);
    } else {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }

  Future<ResultApi> cartFromLocal() async {
    ResultApi resultApi = await localDataSource.getCartFromLocal();
    if (resultApi.isDone) {
      Map data = jsonDecode(resultApi.resultOrError);

      return ResultApi(isDone: true, resultOrError: data);
    } else {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }
}
