class VideoModel {
  late String name, thumbnail, url;
  VideoModel({
    required this.name,
    required this.thumbnail,
    required this.url,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnail = json['thumbnail'];
    url = json['url'];
  }

  // get price => null;

  Map<String, dynamic> toJosn() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['url'] = url;
    return data;
  }
}
