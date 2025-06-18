import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c14/common/di.dart';
import 'package:news_app_c14/common/faliur/faliur_model.dart';
import 'package:news_app_c14/features/articles/model/repository/articles_repository.dart';
import 'package:news_app_c14/features/articles/view_model/cubit/articles_cubit_state.dart';

class ArticlesCubit extends Cubit<ArticlesCubitState> {
  ArticlesCubit() : super(ArticlesCubitInitialState());
  final ArticlesRepository _articlesRepository = ArticlesRepository(
    articlesDataSource: Di.articlesDataSource,
  );
  Future<void> getArticles(String sourceID) async {
    emit(GetArticlesLoading());
    try {
      var articles = await _articlesRepository.getArticles(sourceID);
      emit(articles.isEmpty
          ? GetArticlesEmptyList()
          : GetArticlesSuccess(articles: articles));
    } on FaliurModel catch (error) {
      emit(GetArticlesFailure(errorMessage: error.errorMessaage));

      // errorMessage = error.errorMessaage;
    } catch (e) {
      emit(GetArticlesFailure(errorMessage: e.toString()));
      //   errorMessage = e.toString();
    }
  }
}
