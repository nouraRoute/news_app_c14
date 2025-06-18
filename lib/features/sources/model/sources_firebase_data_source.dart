import 'package:news_app_c14/features/sources/model/source_model.dart';
import 'package:news_app_c14/features/sources/model/sources_data_source.dart';

class SourcesFirebaseDataSource extends SourcesDataSource {
  Future<List<SourceModel>> getSourcesByCategory(String category) async {
    return [];
  }
}
