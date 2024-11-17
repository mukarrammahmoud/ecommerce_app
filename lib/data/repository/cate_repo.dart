import 'dart:convert';

import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/model/result_api.dart';

class CategoryRepo {
  final RemoteDataSource remoteDataSource;

  CategoryRepo(this.remoteDataSource);

  Future<ResultApi> getAllcategory() async {
    ResultApi resultApi = await remoteDataSource.getAllCategory();
    if (resultApi.isDone) {
      List data = jsonDecode(resultApi.resultOrError);

     

      return ResultApi(isDone: true, resultOrError: data);
    } else {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }
}
