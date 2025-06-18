import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app_c14/common/di.dart';
import 'package:news_app_c14/common/faliur/faliur_model.dart';
import 'package:news_app_c14/features/articles/model/articles_api_data_source.dart';
import 'package:news_app_c14/features/articles/model/articles_response/article.dart';
import 'package:news_app_c14/features/articles/model/repository/articles_repository.dart';

class ArticlesViewModel extends ChangeNotifier {
  final ArticlesRepository _articlesRepository = ArticlesRepository(
    articlesDataSource: Di.articlesDataSource,
  );
  List<Article> articles = [];
  bool loading = false;
  String? errorMessage;
  Future<void> getArticles(String sourceID) async {
    articles = [];
    errorMessage = null;
    loading = true;
    notifyListeners();

    try {
      articles = await _articlesRepository.getArticles(sourceID) ?? [];
    } on FaliurModel catch (error) {
      errorMessage = error.errorMessaage;
    } catch (e) {
      errorMessage = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}
