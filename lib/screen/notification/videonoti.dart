class VideoModel {
  late String name, thumbnail, url, date, description;
  VideoModel(
      {required this.name,
      required this.thumbnail,
      required this.url,
      required this.date,
      required this.description});

  VideoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnail = json['thumbnail'];
    url = json['url'];
    date = json['date'];
    description = json['description'];
  }

  // get price => null;

  Map<String, dynamic> toJosn() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['url'] = url;
    data['date'] = date;
    data['description'] = description;
    return data;
  }
}
