import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkInfo {
  static late final List<ConnectivityResult> _connectivity;

  static void init() async {
    _connectivity = await Connectivity().checkConnectivity();
  }

  Future<bool> get isConnected async {
    return _connectivity.contains(ConnectivityResult.mobile) ||
        _connectivity.contains(ConnectivityResult.wifi);
  }
}
