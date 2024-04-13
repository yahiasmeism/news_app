import 'package:flutter/material.dart';
import 'package:news_app_beta/widgets/articles_sliver_list_builder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          categoryName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            ArticlesSliverListBuilder(
              categoryName: categoryName.toLowerCase(),
            )
          ],
        ),
      ),
    );
  }
}
