import 'package:dio/dio.dart';

class InternetServices {
  //Checks internet connectivity status
  static Future<bool> checkInternetStatus() async {
    final dio = Dio();
    try {
      //Send a HEAD request to Google's homepage
      final response = await dio.head('https://www.google.com');
      // If the response code is 200, it means the request was successful, and internet is on
      return response.statusCode == 200;
    } catch (e) {
      // If there was an error, it means internet is not on
      return false;
    }
  }
}
