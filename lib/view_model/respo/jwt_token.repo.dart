import 'dart:async';
import 'dart:convert';

import 'package:temp_mail/model/token.model.dart';
import 'package:temp_mail/network/api_response.dart';
import 'package:temp_mail/network/exception.dart';
import 'package:temp_mail/network/network_service.dart';

abstract class TokenRepository {
  Future<ApiResponse> getToken(String address, String pass);
}

class TokenRepo extends TokenRepository {
  final NetworkService _networkService = NetworkService();

  ///todo need to implement offline info after login

  @override
  Future<ApiResponse> getToken(String address, String pass) async {
    try {
      var str = await _networkService.postData(
          {"address": address, "password": pass}, "token",
          bearer: "");
      var data = JWTTokenModel.fromJson(json.decode(str));
      return ApiResponse.completed(data);
    } on TimeoutException catch (_) {
      return ApiResponse.error("Request Time Out");
    } on UnauthorisedException catch (_) {
      return ApiResponse.error("Credentials No Match!");
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
