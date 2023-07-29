import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../exceptions/custom_exception.dart';

class CallServices {
  static Future<void> makePhoneCall(String phoneNumber) async {
    try {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    } catch (e) {
      throw CustomException(
        errorCode: 400,
        title: errorCodesMap[400][title],
        message: e.toString(),
        errorOrigin: ErrorOrigins.notARepository,
      );
    }
  }
}
