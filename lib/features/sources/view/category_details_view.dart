import 'package:flutter/material.dart';
import 'package:news_app_c14/common/extentions/context_extentions.dart';
import 'package:news_app_c14/features/articles/view/articles_tab_view.dart';
import 'package:news_app_c14/features/sources/model/source_model.dart';
import 'package:news_app_c14/features/sources/model_view/sources_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatefulWidget {
  final String sectedCategory;
  const CategoryDetailsView({super.key, required this.sectedCategory});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  SourcesViewModel sourcesViewModel = SourcesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sourcesViewModel.getSources(widget.sectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sourcesViewModel,
        builder: (context, child) {
          return Consumer<SourcesViewModel>(
            builder: (BuildContext context, viewModel, Widget? child) {
              if (viewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (viewModel.errorMessage != null) {
                return Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.warning,
                        size: 40,
                        color: Colors.red,
                      ),
                      Text(viewModel.errorMessage!)
                    ],
                  ),
                );
              } else if (viewModel.sources.isEmpty) {
                return const Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.filter_list_off,
                        size: 40,
                        color: Colors.white,
                      ),
                      const Text('no sources available')
                    ],
                  ),
                );
              }

              List<SourceModel> sources = viewModel.sources;
              return DefaultTabController(
                length: sources.length,
                child: Column(
                  children: [
                    TabBar(
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        padding: const EdgeInsets.all(8),
                        indicatorPadding: const EdgeInsets.only(bottom: 10),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        tabAlignment: TabAlignment.start,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: context.getColorSceem().secondary,
                        unselectedLabelColor: context.getColorSceem().secondary,
                        labelStyle: context.getTextThemes().titleMedium,
                        unselectedLabelStyle:
                            context.getTextThemes().labelSmall,
                        tabs: List.generate(
                          sources.length,
                          (index) => Tab(
                            text: sources[index].name,
                          ),
                        )),
                    ArticlesTabView(sources: sources)
                  ],
                ),
              );
            },
          );
        });
  }
}
