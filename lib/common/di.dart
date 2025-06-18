import 'package:news_app_c14/features/articles/model/articles_api_data_source.dart';
import 'package:news_app_c14/features/articles/model/articles_data_source.dart';
import 'package:news_app_c14/features/sources/model/sources_api_data_source.dart';
import 'package:news_app_c14/features/sources/model/sources_data_source.dart';

class Di {
  static SourcesDataSource sourcesDataSource = SourcesAPIDataSource();
  static ArticlesDataSource articlesDataSource = ArticlesAPIDataSource();
}
