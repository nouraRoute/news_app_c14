import 'package:flutter/material.dart';
import 'package:news_app_c14/features/categories/model/category_model.dart';
import 'package:news_app_c14/features/categories/view/categories_view.dart';
import 'package:news_app_c14/features/sources/view/category_details_view.dart';
import 'package:news_app_c14/features/categories/view/drawer_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeNme = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  CategoryType? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: DrawerView(
            goHome: () {
              setState(() {
                selectedCategory = null;
              });
              _key.currentState!.closeDrawer();
            },
          ),
        ),
        appBar: AppBar(
          actions: [Icon(Icons.search)],
          title: Text(selectedCategory != null
              ? selectedCategory!.getCategoryTypeName()
              : 'Home'), //TODO:localization
        ),
        body: selectedCategory != null
            ? CategoryDetailsView(
                sectedCategory: selectedCategory!.name,
              )
            : CategoriesView(
                onCategorySlected: (p0) {
                  setState(() {
                    selectedCategory = p0;
                  });
                },
              ));
  }
}
