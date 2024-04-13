import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_beta/models/article_model.dart';
import 'package:news_app_beta/pages/news_web_view_builder.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.articleModel,
  });
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return NewsWebViewBuilder(url: articleModel.url);
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: articleModel.imagePathFromNetwork ?? '',
                  errorWidget: (context, url, error) {
                    return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(50),
                        width: double.infinity,
                        color: Colors.grey,
                        child: const Column(
                          children: [
                            Icon(
                              Icons.image_not_supported,
                              size: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Image Not Found',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ));
                  },
                  progressIndicatorBuilder: (context, url, progress) {
                    return Container(
                        color: Colors.grey,
                        height: 210,
                        child: const Center(
                            child: CircularProgressIndicator(
                          color: Colors.amber,
                          strokeWidth: 1,
                        )));
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                articleModel.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                articleModel.description ?? '',
                style: const TextStyle(color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
