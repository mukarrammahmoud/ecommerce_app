import 'package:first_app/data/model/result_api.dart';

abstract class BaseProdectRepo {
  Future<ResultApi> getAllProdects();
}
