import 'package:news_app_c14/features/articles/model/articles_data_source.dart';
import 'package:news_app_c14/features/articles/model/articles_response/article.dart';

class ArticleFirebaseDataSource implements ArticlesDataSource {
  @override
  Future<List<Article>> getSourceArticles(String sourceId) async {
    return [];
  }
}
