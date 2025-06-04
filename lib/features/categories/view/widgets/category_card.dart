import 'package:flutter/material.dart';
import 'package:news_app_c14/common/extentions/context_extentions.dart';
import 'package:news_app_c14/common/theme/app_colors.dart';
import 'package:news_app_c14/features/categories/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryType categoryType;
  final void Function(CategoryType) onCategorySlected;

  final int index;
  const CategoryCard(
      {super.key,
      required this.index,
      required this.categoryType,
      required this.onCategorySlected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getScreenSize().height / 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: context.getColorSceem().secondary),
      child: Row(
        textDirection: index.isOdd ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Transform.flip(
            flipX: index.isOdd,
            child: ClipRRect(
                borderRadius: const BorderRadiusDirectional.horizontal(
                    start: Radius.circular(24)),
                child: Image.asset(categoryType.getCategoryImage())),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                categoryType.getCategoryTypeName(),
                style: context.getTextThemes().titleLarge!.copyWith(
                    color: context.getColorSceem().primary, fontSize: 28),
              ),
              GestureDetector(
                onTap: () => onCategorySlected(categoryType),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(84)),
                  child: Row(
                    textDirection:
                        index.isOdd ? TextDirection.rtl : TextDirection.ltr,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'View All',
                          style: context
                              .getTextThemes()
                              .labelLarge!
                              .copyWith(fontSize: 24),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: context.getColorSceem().primary,
                        radius: 28,
                        child: Icon(
                          index.isOdd
                              ? Icons.arrow_back_ios_sharp
                              : Icons.arrow_forward_ios,
                          color: context.getColorSceem().secondary,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
