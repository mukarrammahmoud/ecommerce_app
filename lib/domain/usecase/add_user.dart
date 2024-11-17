import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/data/repository/user_repo.dart';

class AddUser {
  final UserRepo userRepo;

  AddUser(this.userRepo);
  Future<ResultApi> addUser(Map data) async {
    return userRepo.addUser(data);
  }
}
