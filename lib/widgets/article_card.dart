import 'package:flutter/material.dart';
import 'package:news_app_c14/common/extentions/context_extentions.dart';
import 'package:news_app_c14/common/theme/app_colors.dart';
import 'package:news_app_c14/models/articles_response/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: context.getColorSceem().secondary,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              article.urlToImage ?? "",
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.image_not_supported_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              article.title ?? "",
              style: context.getTextThemes().titleMedium,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'By :${article.author ?? ""}',
                  style: context
                      .getTextThemes()
                      .labelSmall!
                      .copyWith(fontSize: 12, color: AppColors.greyColor),
                ),
              ),
              Expanded(
                child: Text(
                  timeago.format(DateTime.parse(article.publishedAt ?? '')),
                  style: context
                      .getTextThemes()
                      .labelSmall!
                      .copyWith(fontSize: 12, color: AppColors.greyColor),
                  textAlign: TextAlign.end,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
