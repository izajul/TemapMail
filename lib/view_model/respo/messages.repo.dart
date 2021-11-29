import 'dart:async';
import 'dart:convert';

import 'package:temp_mail/model/failed.model.dart';
import 'package:temp_mail/model/message_details.model.dart';
import 'package:temp_mail/model/messages.model.dart';
import 'package:temp_mail/network/api_response.dart';
import 'package:temp_mail/network/exception.dart';
import 'package:temp_mail/network/network_service.dart';

abstract class MessagesRepository {
  Future<ApiResponse> getMessagesList(String page);
  Future<ApiResponse> getMessageDetails(String msgID);
  Future<ApiResponse> deleteMessage(String msgId);
  Future<ApiResponse> seenUpdate(String msgId, bool status);
}

class MessagesRepo extends MessagesRepository {
  final NetworkService _networkService = NetworkService();

  @override
  Future<ApiResponse> getMessageDetails(String msgID) async {
    try {
      var str = await _networkService.getData({}, "messages/$msgID");
      var data = MessagesDetails.fromJson(json.decode(str));
      return ApiResponse.completed(data);
    } on TimeoutException catch (_) {
      return ApiResponse.error("Request Time Out");
    } on UnauthorisedException catch (_) {
      return ApiResponse.error("Invalid JTW Token");
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse> getMessagesList(String page) async {
    try {
      var str =
          await _networkService.getData({"page": "1"}, "messages", bearer: "");
      var data = MessagesModel.fromJson(json.decode(str));
      return ApiResponse.completed(data);
    } on TimeoutException catch (_) {
      return ApiResponse.error("Request Time Out");
    } on UnauthorisedException catch (_) {
      return ApiResponse.error("Invalid JTW Token");
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse> deleteMessage(String msgId) async {
    try {
      var str = await _networkService.deleteData("messages/$msgId", bearer: "");
      var data = Failed.fromJson(json.decode(str));
      return ApiResponse.completed(data);
    } on TimeoutException catch (_) {
      return ApiResponse.error("Request Time Out");
    } on UnauthorisedException catch (_) {
      return ApiResponse.error("Message No Found");
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse> seenUpdate(String msgId, bool status) async {
    try {
      var str = await _networkService
          .patchData({"seen": "$status"}, "messages/$msgId", bearer: "");
      var data = Failed.fromJson(json.decode(str));
      return ApiResponse.completed(data);
    } on TimeoutException catch (_) {
      return ApiResponse.error("Request Time Out");
    } on UnauthorisedException catch (_) {
      return ApiResponse.error("Message No Found");
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
