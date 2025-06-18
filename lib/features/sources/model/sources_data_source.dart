import 'package:news_app_c14/features/sources/model/source_model.dart';

abstract class SourcesDataSource {
  Future<List<SourceModel>> getSourcesByCategory(String category);
}
