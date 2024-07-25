class WunderkindCategory {
  final String categoryName;
  final String url;
  final List<String> itemIds;

  const WunderkindCategory({
    required this.categoryName,
    required this.url,
    required this.itemIds,
  });

  factory WunderkindCategory.fromJson(Map<String, dynamic> map) {
    return WunderkindCategory(
      categoryName: map['categoryName'],
      url: map['url'],
      itemIds: map['itemIds'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'url': url.toString(),
      'itemIds': itemIds,
    };
  }
}
