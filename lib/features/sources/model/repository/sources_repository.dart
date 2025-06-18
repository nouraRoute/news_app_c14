import 'package:news_app_c14/common/faliur/faliur_model.dart';
import 'package:news_app_c14/features/sources/model/source_model.dart';
import 'package:news_app_c14/features/sources/model/sources_api_data_source.dart';
import 'package:news_app_c14/features/sources/model/sources_data_source.dart';

class SourcesRepository {
  final SourcesDataSource sourcesDataSource;

  SourcesRepository({required this.sourcesDataSource});
  Future<List<SourceModel>> getSources(String id) async {
    try {
      var response = await sourcesDataSource.getSourcesByCategory(id);
      return response;
    } catch (error) {
      throw FaliurModel.errorHandling(error);
    }
  }
}
