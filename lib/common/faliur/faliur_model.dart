import 'package:http/http.dart';

class FaliurModel implements Exception {
  final String errorMessaage;

  FaliurModel({required this.errorMessaage});

  static FaliurModel errorHandling(error) {
    if (error is Exception) {
      if (error is TypeError) {
        return FaliurModel(errorMessaage: "error Parcing an object");
      } else if (error is ClientException) {
        return NetworkFaliure(
            errorMessaage: "Error with the network or the server");
      } else {
        return FaliurModel(errorMessaage: "Some ting went wrong");
      }
    } else {
      return FaliurModel(errorMessaage: error.toString());
    }
  }
}

class NetworkFaliure extends FaliurModel {
  NetworkFaliure({required super.errorMessaage});
}

// class TimeOutFaliur extends FaliurModel {
//   TimeOutFaliur(
//       {super.errorMessaage = "Time out check your network coonnection",
//       this.image = ""});
//   String image;
// }

// class OfflineFaliur extends FaliurModel {
//   OfflineFaliur(
//       {super.errorMessaage = "Time out check your network coonnection",
//       this.image = ""});
//   String image;
// }
