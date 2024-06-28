import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      String? contentType = "application/x-www-form-urlencoded",
      String? stripeVersion,
      Map<String, String>? headers}) async {
    Response response = await dio.post(url,
        data: body,
        options: Options(
            headers: headers ??
                {
                  "Authorization": "Bearer $token",
                },
            contentType: contentType));
    return response;
  }
}
