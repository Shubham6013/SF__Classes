class VideoModel {
  late String name, url;
  VideoModel({
    required this.name,
    required this.url,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  // get price => null;

  Map<String, dynamic> toJosn() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
