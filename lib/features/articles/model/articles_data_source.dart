import 'dart:convert';

import 'package:news_app_c14/common/app_consts.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_c14/common/endpoints.dart';
import 'package:news_app_c14/features/articles/model/articles_response/article.dart';
import 'package:news_app_c14/features/articles/model/articles_response/articles_response.dart';

class ArticlesDataSource {
  Future<List<Article>?> getSourceArticles(String sourceId) async {
    Uri uri = Uri.https(AppConsts.baseUrl, Endpoints.everything,
        {'apiKey': AppConsts.apiKey, 'sources': sourceId});

    var response = await http.get(
      uri,
    );
    var jsonResponse = jsonDecode(response.body);
    var data = ArticlesResponse.fromJson(jsonResponse);

    if (data.status == 'ok' && response.statusCode == 200) {
      return data.articles;
    } else {
      throw data.message ?? 'somthing went wrong';
    }
  }
}


///
///