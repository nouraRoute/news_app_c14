import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app_c14/features/sources/model/source_model.dart';
import 'package:news_app_c14/features/sources/model/sources_data_source.dart';

class SourcesViewModel extends ChangeNotifier {
  final SourcesDataSource _sourcesDataSource = SourcesDataSource();
  List<SourceModel> sources = [];
  bool isLoading = false;
  String? errorMessage;
  getSources(String catId) async {
    sources = [];
    errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      sources = await _sourcesDataSource.getSourcesByCategory(catId) ?? [];
    } on ClientException catch (error) {
      errorMessage =
          'Something wrong withe the server try again later\n${error.message}';
    } catch (e) {
      if (e is TypeError) {
        errorMessage = "Error formaing the recived data";
      } else {
        print('XX->${e.runtimeType}');
        errorMessage = e is String ? e : "Something went rong";
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
