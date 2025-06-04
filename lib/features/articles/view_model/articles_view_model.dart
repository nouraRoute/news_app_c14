import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app_c14/features/articles/model/articles_data_source.dart';
import 'package:news_app_c14/features/articles/model/articles_response/article.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesDataSource articlesDataSource = ArticlesDataSource();
  List<Article> articles = [];
  bool loading = false;
  String? errorMessage;
  Future<void> getArticles(String sourceID) async {
    articles = [];
    errorMessage = null;
    loading = true;
    notifyListeners();

    try {
      articles = await articlesDataSource.getSourceArticles(sourceID) ?? [];
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
    loading = false;
    notifyListeners();
  }
}
