class ArticleModel {
  final String? imagePathFromNetwork;
  final String title;
  final String? description;
  final String url;

  const ArticleModel({
    required this.url,
    this.imagePathFromNetwork,
    required this.title,
    this.description,
  });

  factory ArticleModel.fromJson(json) {
    //parsing json to aticleModel Object
    return ArticleModel(
      title: json['title'],
      description: json['description'],
      imagePathFromNetwork: json['urlToImage'],
      url: json['url'],
    );
  }
}
