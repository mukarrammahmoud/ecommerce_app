import 'dart:convert';

import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/model/result_api.dart';

class LoginRepo {
  final RemoteDataSource remoteDataSource;

  LoginRepo(this.remoteDataSource);

  Future<ResultApi> login(Map data) async {
    ResultApi resultApi = await remoteDataSource.login(data);
    if (resultApi.isDone) {
      Map data = jsonDecode(resultApi.resultOrError);

      return ResultApi(isDone: true, resultOrError: data);
    } else {
      return ResultApi(isDone: false, resultOrError: resultApi);
    }
  }
}
