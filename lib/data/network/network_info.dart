import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnect;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImpl(this._internetConnectionChecker);

  /// check internet connection (NOT SUPPORT FOR WEB)
  @override
  Future<bool> get isConnect => _internetConnectionChecker.hasConnection;

  /// check internet connection for web
// @override
// Future<bool> get isConnect => checkUserConnection();

// Future<bool> checkUserConnection() async {
//   bool activeConnection = false;
//   try {
//     final result = await InternetAddress.lookup('google.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       activeConnection = true;
//     }
//   } on SocketException catch (_) {
//     activeConnection = false;
//   }
//   return activeConnection;
// }
}
