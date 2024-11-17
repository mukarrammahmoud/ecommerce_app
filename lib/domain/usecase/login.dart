import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/data/repository/login.dart';

class LoginUser {
  final LoginRepo loginRepo;

  LoginUser(this.loginRepo);
  Future<ResultApi> login(Map data) async {
    return loginRepo.login(data);
  }

}
