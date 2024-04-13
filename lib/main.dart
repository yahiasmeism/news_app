import 'package:flutter/material.dart';
import 'package:news_app_beta/pages/my_home_page.dart';
void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}


class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Color.fromARGB(255, 194, 194, 194),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}