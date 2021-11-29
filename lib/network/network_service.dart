import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:temp_mail/network/base_service.dart';

import 'exception.dart';

class NetworkService extends BaseService {
  Future<dynamic> searchDomain(String userName) async {}

  final Map<String, String> _header = {
    'Content-Type': 'application/ld+json',
    'Accept': 'application/json',
  };

  /// get request status after get response from server
  /// also checking is there have an internet connection
  Future<dynamic> _getRequestStatus(res) async {
    switch (res.statusCode) {
      case 200:
      case 201:
        return await res.stream.bytesToString();
      case 204:
        throw NoContentException("Response has no content");
      case 404:
        throw BadRequestException("Request is not founded");
      case 403:
        throw UnauthorisedException(
            "Request with valid JWT Token and try again!");
      case 422:
        throw UnprocessableException("Entry is no processing");
      case 500:
        throw DataFetchingException("Internal Server Error");
    }
  }

  @override
  Future deleteData(endPoint, {bearer = ""}) async {
    if (bearer.isNotEmpty) _header["Authorization"] = "Bearer $bearer";
    var request = http.Request('DELETE', Uri.parse("$BASE_URL$endPoint"));
    request.headers.addAll(_header);
    try {
      http.StreamedResponse response =
          await request.send().timeout(const Duration(seconds: 60));
      return await _getRequestStatus(response);
    } on SocketException catch (_) {
      throw NetworkNotAvailableException("Network Not Available");
    }
  }

  @override
  Future getData(query, endPoint, {String bearer = ""}) async {
    String prams = Uri(queryParameters: query).query;
    /* var request =
        http.MultipartRequest('GET', Uri.parse("$BASE_URL$endPoint?$prams"));*/
    if (bearer.isNotEmpty) _header["Authorization"] = "Bearer $bearer";

    try {
      var request = await http
          .get(Uri.parse("$BASE_URL$endPoint?$prams"), headers: _header)
          .timeout(const Duration(seconds: 60));
      return await _getRequestStatus(request);
    } on SocketException catch (_) {
      throw NetworkNotAvailableException("Network Not Available");
    }
  }

  @override
  Future patchData(data, endPoint, {bearer = ""}) {
    // TODO: implement patchData
    throw UnimplementedError();
  }

  @override
  Future postData(fields, endPoint, {bearer = ""}) async {
    if (bearer.isNotEmpty) _header["Authorization"] = "Bearer $bearer";
    var request = http.Request('POST', Uri.parse("$BASE_URL$endPoint"));
    request.body = json.encode(fields);
    request.headers.addAll(_header);
    try {
      http.StreamedResponse response =
          await request.send().timeout(const Duration(seconds: 60));
      return await _getRequestStatus(response);
    } on SocketException catch (_) {
      throw NetworkNotAvailableException("Network Not Available");
    }
  }

  ///
}
