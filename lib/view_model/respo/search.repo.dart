import 'dart:async';
import 'dart:convert';

import 'package:temp_mail/model/search.model.dart';
import 'package:temp_mail/network/api_response.dart';
import 'package:temp_mail/network/network_service.dart';

abstract class SearchRepository {
  Future<ApiResponse<List<HydraMember>>> findDomain();
}

class SearchDomainRepo extends SearchRepository {
  final NetworkService _networkService = NetworkService();

  @override
  Future<ApiResponse<List<HydraMember>>> findDomain() async {
    try {
      var str = await _networkService.getData({"page": '1'}, "domains");
      var data = SearchModel.fromJson(json.decode(str));
      return ApiResponse.completed(data.hydraMember);
    } on TimeoutException catch (_) {
      return ApiResponse.error("Request Time Out");
    } on Exception catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
