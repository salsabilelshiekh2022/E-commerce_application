import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String _baseUrl = "https://student.valuxapps.com/api/";

  ApiService(this.dio);

  static void init() {
    Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json', 'lang': 'en'},
      ),
    );
  }

  Future<Response> post(
      {required Map<String, dynamic> data,
      required String url,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {'lang': lang, 'Authorization': token};
    return await dio.post(
      _baseUrl + url,
      data: data,
    );
  }

  Future<Response> get(
      {required String url, String lang = 'en', String? token}) async {
    dio.options.headers = {'lang': lang, 'Authorization': token};
    return await dio.get(
      _baseUrl + url,
    );
  }
}
