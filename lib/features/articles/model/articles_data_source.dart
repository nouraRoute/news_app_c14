import 'package:news_app_c14/features/articles/model/articles_response/article.dart';

abstract class ArticlesDataSource {
  Future<List<Article>> getSourceArticles(String sourceId);
}
