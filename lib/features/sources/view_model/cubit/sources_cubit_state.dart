import 'package:news_app_c14/features/sources/model/source_model.dart';

sealed class SourcesCubitState {}

class SourcesCubitInitialState extends SourcesCubitState {}

class GetSourcesSuccess extends SourcesCubitState {
  final List<SourceModel> sources;

  GetSourcesSuccess({required this.sources});
}

class GetSourcesEmptyList extends SourcesCubitState {}

class GetSourcesLoading extends SourcesCubitState {}

class GetSourcesFailure extends SourcesCubitState {
  final String errorMessage;

  GetSourcesFailure({required this.errorMessage});
}
