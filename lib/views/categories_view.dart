import 'package:flutter/material.dart';
import 'package:news_app_c14/common/extentions/context_extentions.dart';
import 'package:news_app_c14/models/category_model.dart';
import 'package:news_app_c14/widgets/category_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.onCategorySlected});
  final void Function(CategoryType) onCategorySlected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: context.getTextThemes().labelLarge!.copyWith(fontSize: 24.0),
          ),
          ...List.generate(
            CategoryType.values.length,
            (index) => CategoryCard(
              onCategorySlected: onCategorySlected,
              categoryType: CategoryType.values[index],
              index: index,
            ),
          )
        ],
      ),
    );
  }
}
