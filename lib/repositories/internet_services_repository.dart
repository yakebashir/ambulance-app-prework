import '../services/internet_services.dart';

class InternetServicesRepository {
  //Checks internet connectivity status
  static Future<bool> checkInternetStatus() async {
    //Try and Catch blocks not necessary because they are completely handled by service
    return await InternetServices.checkInternetStatus();
  }
}
