
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkCheck{
  Future<bool> checkInternetConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // // print('Mobile');
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // // print('Wifi');
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // print('No Connection');
      return false;
    } else {
      return false;
    }
  }
}