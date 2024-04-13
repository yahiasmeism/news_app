import 'package:flutter/material.dart';
import 'package:news_app_beta/models/article_model.dart';
import 'package:news_app_beta/widgets/article_tile.dart';

class ArticlesSliverList extends StatelessWidget {
  const ArticlesSliverList({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleTile(articleModel: articles[index]);
      },
    );
  }
}
