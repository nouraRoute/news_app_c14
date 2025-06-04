import 'article.dart';

class ArticlesResponse {
  String? status;
  String? message;
  int? totalResults;
  List<Article>? articles;

  ArticlesResponse(
      {this.status, this.message, this.totalResults, this.articles});

  @override
  String toString() {
    return 'ArticlesResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return ArticlesResponse(
      message: (json['message'] is String) ? json['message'] as String : null,
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
