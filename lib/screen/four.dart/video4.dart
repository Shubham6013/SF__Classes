class VideoModel {
  late String name, thumbnail, url, price;
  VideoModel(
      {required this.name,
      required this.thumbnail,
      required this.url,
      required this.price});

  VideoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnail = json['thumbnail'];
    url = json['url'];
    price = json['price'];
  }

  // get price => null;

  Map<String, dynamic> toJosn() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['url'] = url;
    data['price'] = price;
    return data;
  }
}
