import 'package:flutter/material.dart';
import 'package:news_app_beta/widgets/articles_sliver_list_builder.dart';
import 'package:news_app_beta/widgets/categories_List_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            ArticlesSliverListBuilder(categoryName: 'general')
          ],
        ),
      ),
    );
  }
}
