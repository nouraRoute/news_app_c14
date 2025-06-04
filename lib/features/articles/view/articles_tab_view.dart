import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_c14/features/articles/view/widgets/article_card.dart';
import 'package:news_app_c14/features/articles/view_model/articles_view_model.dart';
import 'package:news_app_c14/features/sources/model/source_model.dart';
import 'package:provider/provider.dart';

class ArticlesTabView extends StatelessWidget {
  const ArticlesTabView({super.key, required this.sources});
  final List<SourceModel> sources;

  @override
  Widget build(BuildContext context) {
    log('index-->${DefaultTabController.of(context).index}');
    return ChangeNotifierProvider(
        create: (context) => ArticlesViewModel(),
        builder: (ctx, child) {
          return Expanded(
              child: TabBarView(
                  children: List.generate(
                      sources.length,
                      (tabIndex) =>
                          TabContent(sourceId: sources[tabIndex].id!))));
        });
  }
}

class TabContent extends StatefulWidget {
  const TabContent({super.key, required this.sourceId});
  final String sourceId;
  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticlesViewModel>().getArticles(widget.sourceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesViewModel>(
      builder:
          (BuildContext context, ArticlesViewModel viewModel, Widget? child) {
        if (viewModel.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (viewModel.errorMessage != null) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error),
                Text(viewModel.errorMessage!),
                ElevatedButton.icon(
                  onPressed: () {
                    context
                        .read<ArticlesViewModel>()
                        .getArticles(widget.sourceId);
                  },
                  label: const Text('Try again'),
                  icon: const Icon(Icons.replay_outlined),
                )
              ],
            ),
          );
        } else if (viewModel.articles.isEmpty) {
          return const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.filter_list_off),
                Text('No news available')
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ArticlesViewModel>().getArticles(widget.sourceId);
          },
          child: ListView.builder(
            itemCount: viewModel.articles.length,
            itemBuilder: (context, index) => ArticleCard(
              article: viewModel.articles[index],
            ),
          ),
        );
      },
    );
  }
}
