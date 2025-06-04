import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app_c14/common/app_consts.dart';
import 'package:news_app_c14/common/endpoints.dart';
import 'package:news_app_c14/features/sources/model/source_model.dart';

class SourcesDataSource {
  Future<List<SourceModel>?> getSourcesByCategory(String category) async {
    Uri uri = Uri.https(AppConsts.baseUrl, Endpoints.sources,
        {'apiKey': AppConsts.apiKey, 'category': category});
    print('url requist:${uri.toString()}');

    try {
      var response = await http.get(
        uri,
      );

      var jsonResponse = jsonDecode(response.body);
      var data = SourcesResponse.fromJson(jsonResponse);

      if (data.status == 'ok' && response.statusCode == 200) {
        return data.sources;
      } else {
        throw data.message ?? 'somthing went wrong';
      }
    } catch (e) {
      log('ERROR:${e}');
    }
    return null;
  }
}
