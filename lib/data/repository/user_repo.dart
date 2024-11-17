import 'dart:convert';

import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/model/result_api.dart';

class UserRepo {
  final RemoteDataSource remoteDataSource;

  UserRepo(this.remoteDataSource);

  Future<ResultApi> addUser(Map data) async {
    ResultApi resultApi = await remoteDataSource.addUser(data);
    if (resultApi.isDone) {
      Map data = jsonDecode(resultApi.resultOrError);

      return ResultApi(isDone: true, resultOrError: data);
    } else 
    {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }
}
