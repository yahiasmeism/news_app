// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:news_app_beta/models/category_model.dart';
import 'package:news_app_beta/widgets/category_tile.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
      title: 'Business',
      imagePathFromAssets: 'assets/business.jpg',
    ),
    CategoryModel(
      title: 'Entertainment',
      imagePathFromAssets: 'assets/entertaiment.avif',
    ),
    CategoryModel(
      title: 'Health',
      imagePathFromAssets: 'assets/health.avif',
    ),
    CategoryModel(
      title: 'Science',
      imagePathFromAssets: 'assets/science.avif',
    ),
    CategoryModel(
      title: 'Sports',
      imagePathFromAssets: 'assets/sports.jpg',
    ),
    CategoryModel(
      title: 'Technology',
      imagePathFromAssets: 'assets/technology.jpg',
    ),
    CategoryModel(
      title: 'General',
      imagePathFromAssets: 'assets/general.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryTile(categoryModel: categories[index]);
        },
      ),
    );
  }
}
