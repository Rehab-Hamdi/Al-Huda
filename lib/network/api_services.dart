import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
  static const String apiKey = 'c8ad00290d8247cebd1c97e819a43b04';
  static const String baseUrl = 'http://newapi.org/';
  //$apiKey

  get({required String endpoint}) async {
    var response = await dio.get(endpoint);
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endpoint}) async {
    var response = await dio.get(endpoint);
    return response.data;
  }
}
