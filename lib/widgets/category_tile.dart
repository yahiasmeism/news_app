import 'package:flutter/material.dart';
import 'package:news_app_beta/models/category_model.dart';
import 'package:news_app_beta/pages/category_page.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CategoryPage(categoryName: categoryModel.title);
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        alignment: Alignment.center,
        height: 100,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage(categoryModel.imagePathFromAssets),
              fit: BoxFit.cover),
        ),
        child: Text(
          categoryModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            shadows: [
              Shadow(blurRadius: 10, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
