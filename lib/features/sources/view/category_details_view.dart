import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c14/common/extentions/context_extentions.dart';
import 'package:news_app_c14/features/articles/view/articles_tab_view.dart';
import 'package:news_app_c14/features/sources/model/source_model.dart';
import 'package:news_app_c14/features/sources/model/sources_data_source.dart';
import 'package:news_app_c14/features/sources/view_model/cubit/sources_cubit.dart';
import 'package:news_app_c14/features/sources/view_model/cubit/sources_cubit_state.dart';
import 'package:news_app_c14/features/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatefulWidget {
  final String sectedCategory;
  const CategoryDetailsView({super.key, required this.sectedCategory});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  // SourcesViewModel sourcesViewModel = SourcesViewModel();
  SourcesCubit sourcesCubit = SourcesCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sourcesCubit.getSources(widget.sectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: sourcesCubit,
        child: BlocBuilder<SourcesCubit, SourcesCubitState>(
          builder: (BuildContext context, state) {
            if (state is GetSourcesLoading ||
                state is SourcesCubitInitialState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state is GetSourcesFailure) {
              return Center(
                child: Column(
                  children: [
                    const Icon(
                      Icons.warning,
                      size: 40,
                      color: Colors.red,
                    ),
                    Text(state.errorMessage)
                  ],
                ),
              );
            } else if (state is GetSourcesEmptyList) {
              return const Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.filter_list_off,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text('no sources available')
                  ],
                ),
              );
            } else {
              if (state is! GetSourcesSuccess) {
                return SizedBox();
              }
              List<SourceModel> sources = (state).sources;
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
            }
          },
        ));
  }
}
