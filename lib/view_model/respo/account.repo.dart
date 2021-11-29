import 'dart:async';
import 'dart:convert';

import 'package:temp_mail/model/account_success.model.dart';
import 'package:temp_mail/network/api_response.dart';
import 'package:temp_mail/network/exception.dart';
import 'package:temp_mail/network/network_service.dart';

abstract class AccountRepository {
  Future<ApiResponse> createAccount(String domain, String pass);
}

class AccountRepo extends AccountRepository {
  final NetworkService _networkService = NetworkService();

  @override
  Future<ApiResponse> createAccount(String domain, String pass) async {
    try {
      var str = await _networkService.postData(
          {"address": domain, "password": pass}, "accounts",
          bearer: "");
      var data = AccountSuccess.fromJson(json.decode(str));
      return ApiResponse.completed(data);
    } on TimeoutException catch (_) {
      return ApiResponse.error("Request Time Out");
    } on UnprocessableException catch (_) {
      return ApiResponse.error("Name already Used");
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
