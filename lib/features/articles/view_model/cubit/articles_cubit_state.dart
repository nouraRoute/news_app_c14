import 'package:news_app_c14/features/articles/model/articles_response/article.dart';

sealed class ArticlesCubitState {}

class ArticlesCubitInitialState extends ArticlesCubitState {}

class GetArticlesSuccess extends ArticlesCubitState {
  final List<Article> articles;

  GetArticlesSuccess({required this.articles});
}

class GetArticlesLoading extends ArticlesCubitState {}

class GetArticlesEmptyList extends ArticlesCubitState {}

class GetArticlesFailure extends ArticlesCubitState {
  final String errorMessage;

  GetArticlesFailure({required this.errorMessage});
}
