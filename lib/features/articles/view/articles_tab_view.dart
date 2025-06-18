import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c14/features/articles/view/widgets/article_card.dart';
import 'package:news_app_c14/features/articles/view_model/articles_view_model.dart';
import 'package:news_app_c14/features/articles/view_model/cubit/articles_cubit.dart';
import 'package:news_app_c14/features/articles/view_model/cubit/articles_cubit_state.dart';
import 'package:news_app_c14/features/sources/model/source_model.dart';
import 'package:news_app_c14/features/sources/view_model/cubit/sources_cubit_state.dart';
import 'package:provider/provider.dart';

class ArticlesTabView extends StatelessWidget {
  const ArticlesTabView({super.key, required this.sources});
  final List<SourceModel> sources;

  @override
  Widget build(BuildContext context) {
    log('index-->${DefaultTabController.of(context).index}');
    return BlocProvider(
        create: (context) => ArticlesCubit(),
        child: Expanded(
            child: TabBarView(
                children: List.generate(
                    sources.length,
                    (tabIndex) =>
                        TabContent(sourceId: sources[tabIndex].id!)))));
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
      context.read<ArticlesCubit>().getArticles(widget.sourceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesCubitState>(
        builder: (context, state) {
      switch (state) {
        case ArticlesCubitInitialState():
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );

        case GetArticlesLoading():
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        case GetArticlesFailure():
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error),
                Text(state.errorMessage),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<ArticlesCubit>().getArticles(widget.sourceId);
                  },
                  label: const Text('Try again'),
                  icon: const Icon(Icons.replay_outlined),
                )
              ],
            ),
          );
        case GetArticlesEmptyList():
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
        case GetArticlesSuccess():
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ArticlesCubit>().getArticles(widget.sourceId);
            },
            child: ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) => ArticleCard(
                article: state.articles[index],
              ),
            ),
          );
      }
    });
  }
}
