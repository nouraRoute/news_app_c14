import 'package:flutter/material.dart';
import 'package:news_app_c14/common/text_styles/custom_text_styles.dart';
import 'package:news_app_c14/common/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    dividerTheme: const DividerThemeData(color: AppColors.darkMainColor),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: CustomTextStyles.style20w500Black,
        backgroundColor: AppColors.lightMainColor,
        iconTheme: IconThemeData(color: AppColors.darkMainColor)),
    scaffoldBackgroundColor: AppColors.lightMainColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.lightMainColor,
        primary: AppColors.lightMainColor,
        secondary: AppColors.darkMainColor,
        brightness: Brightness.light),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodySmall: CustomTextStyles.style14w400Black,
      bodyMedium: CustomTextStyles.style16w400Black,
      bodyLarge: CustomTextStyles.style18w400Black,
      labelSmall: CustomTextStyles.style14w500Black,
      labelMedium: CustomTextStyles.style16w500Black,
      labelLarge: CustomTextStyles.style18w500Black,
      titleSmall: CustomTextStyles.style14w700Black,
      titleMedium: CustomTextStyles.style16w700Black,
      titleLarge: CustomTextStyles.style18w700Black,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    dividerTheme: const DividerThemeData(color: AppColors.lightMainColor),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: CustomTextStyles.style20w500White,
        backgroundColor: AppColors.darkMainColor,
        iconTheme: IconThemeData(color: AppColors.lightMainColor)),
    scaffoldBackgroundColor: AppColors.darkMainColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.darkMainColor,
        primary: AppColors.darkMainColor,
        secondary: AppColors.lightMainColor,
        brightness: Brightness.light),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodySmall: CustomTextStyles.style14w400White,
      bodyMedium: CustomTextStyles.style16w400White,
      bodyLarge: CustomTextStyles.style18w400White,
      labelSmall: CustomTextStyles.style14w500White,
      labelMedium: CustomTextStyles.style16w500White,
      labelLarge: CustomTextStyles.style18w500White,
      titleSmall: CustomTextStyles.style14w700White,
      titleMedium: CustomTextStyles.style16w700White,
      titleLarge: CustomTextStyles.style18w700White,
    ),
  );
}
