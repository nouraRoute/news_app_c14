import 'package:news_app_c14/common/faliur/faliur_model.dart';
import 'package:news_app_c14/features/articles/model/articles_data_source.dart';

class ArticlesRepository {
  final ArticlesDataSource articlesDataSource;

  ArticlesRepository({required this.articlesDataSource});

  getArticles(String id) async {
    try {
      var response = await articlesDataSource.getSourceArticles(id);
      return response;
    } catch (error) {
      throw FaliurModel.errorHandling(error);
    }
  }
}
