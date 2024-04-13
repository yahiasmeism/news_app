import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_beta/models/article_model.dart';
import 'package:news_app_beta/services/service_news_api.dart';
import 'package:news_app_beta/widgets/articles_sliver_list.dart';

class ArticlesSliverListBuilder extends StatefulWidget {
  const ArticlesSliverListBuilder({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<ArticlesSliverListBuilder> createState() =>
      _ArticlesSliverListBuilderState();
}

class _ArticlesSliverListBuilderState extends State<ArticlesSliverListBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: ServiceNewsApi(dio: Dio())
          .getNews(categoryName: widget.categoryName.toLowerCase()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ArticlesSliverList(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(
              child: Text('Oops. there was an error. try again.'),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            ),
          );
        }
      },
    );
  }
}
