import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c14/common/di.dart';
import 'package:news_app_c14/common/faliur/faliur_model.dart';
import 'package:news_app_c14/features/sources/model/repository/sources_repository.dart';
import 'package:news_app_c14/features/sources/view_model/cubit/sources_cubit_state.dart';

class SourcesCubit extends Cubit<SourcesCubitState> {
  SourcesCubit() : super(SourcesCubitInitialState());
  SourcesRepository sourcesRepository =
      SourcesRepository(sourcesDataSource: Di.sourcesDataSource);
  getSources(String catId) async {
    emit(GetSourcesLoading());
    try {
      var sources = await sourcesRepository.getSources(catId);

      emit(sources.isEmpty
          ? GetSourcesEmptyList()
          : GetSourcesSuccess(sources: sources));
    } on FaliurModel catch (error) {
      emit(GetSourcesFailure(errorMessage: error.errorMessaage));
      // errorMessage = error.errorMessaage;
    } catch (e) {
      emit(GetSourcesFailure(errorMessage: e.toString()));

      // errorMessage = e.toString();
    }
  }
}
