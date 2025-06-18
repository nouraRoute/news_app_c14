import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app_c14/common/di.dart';
import 'package:news_app_c14/common/faliur/faliur_model.dart';
import 'package:news_app_c14/features/sources/model/repository/sources_repository.dart';
import 'package:news_app_c14/features/sources/model/source_model.dart';
import 'package:news_app_c14/features/sources/model/sources_api_data_source.dart';
import 'package:news_app_c14/features/sources/model/sources_firebase_data_source.dart';

class SourcesViewModel extends ChangeNotifier {
  SourcesRepository sourcesRepository =
      SourcesRepository(sourcesDataSource: Di.sourcesDataSource);
  List<SourceModel> sources = [];
  bool isLoading = false;
  String? errorMessage;
  getSources(String catId) async {
    sources = [];
    errorMessage = null;
    isLoading = true;
    notifyListeners();
    try {
      sources = await sourcesRepository.getSources(catId) ?? [];
    } on FaliurModel catch (error) {
      errorMessage = error.errorMessaage;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
