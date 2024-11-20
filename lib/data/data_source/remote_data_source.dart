import 'dart:convert';

import 'package:first_app/core/constant/url.dart';
import 'package:first_app/data/model/result_api.dart';
import 'package:http/http.dart' as http;

abstract class BaseRemoteDataSource {
  Future<ResultApi?> dataFromRemote();
}

class RemoteDataSource {
  Future<ResultApi> getAllData() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.prodects));
      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(isDone: false, resultOrError: "Some Error In Server");
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }

  Future<ResultApi> getOneprodect(int id) async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.prodects}/$id"));
      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(isDone: false, resultOrError: "Some Error In Server");
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }

  Future<ResultApi> getAllCategory() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.categoty));
      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(isDone: false, resultOrError: "Some Error In Server");
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }

  Future<ResultApi> filterCategory(String categoryName) async {
    try {
      final response =
          await http.get(Uri.parse("${AppUrl.filterCategory}/$categoryName"));

      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(isDone: false, resultOrError: "Some Error In Server");
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }

  Future<ResultApi> addUser(Map data) async {
    try {
      final response = await http.post(
          Uri.parse(
            AppUrl.addUser,
          ),
          body: data);

      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(isDone: false, resultOrError: "Some Error In Server");
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }

  Future<ResultApi> login(Map data) async {
    try {
      final response = await http.post(
          Uri.parse(
            AppUrl.login,
          ),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(isDone: false, resultOrError: "Some Error In Server");
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }

  Future<ResultApi> addToCart(Map data) async {
    try {
      final response = await http.post(
          Uri.parse(
            AppUrl.cart,
          ),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(isDone: false, resultOrError: "Some Error In Server");
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }

  Future<ResultApi> getMyCart() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.mycart));

      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(isDone: false, resultOrError: "Some Error In Server");
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }
}
