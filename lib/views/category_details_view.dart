import 'package:flutter/material.dart';
import 'package:news_app_c14/common/extentions/context_extentions.dart';
import 'package:news_app_c14/models/articles_response/article.dart';
import 'package:news_app_c14/models/source_model.dart';
import 'package:news_app_c14/network/articles_apis.dart';
import 'package:news_app_c14/network/sources_apis.dart';
import 'package:news_app_c14/widgets/article_card.dart';

class CategoryDetailsView extends StatelessWidget {
  final String sectedCategory;
  const CategoryDetailsView({super.key, required this.sectedCategory});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SourceModel>?>(
        future: SourcesApis.getSourcesByCategory(sectedCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: context.getColorSceem().secondary,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          List<SourceModel> sources = snapshot.data ?? [];
          return DefaultTabController(
            length: sources.length,
            child: Column(
              children: [
                TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    padding: const EdgeInsets.all(8),
                    indicatorPadding: const EdgeInsets.only(bottom: 10),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: context.getColorSceem().secondary,
                    unselectedLabelColor: context.getColorSceem().secondary,
                    labelStyle: context.getTextThemes().titleMedium,
                    unselectedLabelStyle: context.getTextThemes().labelSmall,
                    tabs: List.generate(
                      sources.length,
                      (index) => Tab(
                        text: sources[index].name,
                      ),
                    )),
                Expanded(
                    child: TabBarView(
                        children: List.generate(
                  sources.length,
                  (tabIndex) => FutureBuilder(
                      future:
                          ArticlesApis.getSourceArticles(sources[tabIndex].id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: context.getColorSceem().secondary,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }

                        List<Article> articles = snapshot.data ?? [];

                        return ListView.builder(
                          itemCount: articles.length,
                          itemBuilder: (context, index) => ArticleCard(
                            article: articles[index],
                          ),
                        );
                      }),
                )))
              ],
            ),
          );
        });
  }
}
