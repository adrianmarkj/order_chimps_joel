import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    var connectivityResult = await connectionChecker.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      await Future.delayed(const Duration(milliseconds: 5));
      var connectivityResult2 = await connectionChecker.checkConnectivity();
      if (connectivityResult2 == ConnectivityResult.wifi || connectivityResult2 == ConnectivityResult.mobile) {
        return true;
      }
      return false;
    } else {
      await Future.delayed(const Duration(milliseconds: 5));
      var connectivityResult2 = await connectionChecker.checkConnectivity();
      if (connectivityResult2 == ConnectivityResult.wifi || connectivityResult2 == ConnectivityResult.mobile) {
        return true;
      }
      return false;
    }
  }
}
