abstract class BaseService {
  final String BASE_URL = "https://api.mail.tm/";

  Future<dynamic> getData(query, endPoint, {String bearer = ""});
  Future<dynamic> postData(fields, endPoint, {String bearer = ""});
  Future<dynamic> patchData(data, endPoint, {String bearer = ""});
  Future<dynamic> deleteData(endPoint, {String bearer = ""});
}
