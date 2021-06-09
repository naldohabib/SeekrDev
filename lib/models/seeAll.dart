part of 'models.dart';

class SeeAll {
  final String id;
  final String name;
  final String image;

  SeeAll(this.id, this.image, this.name);
}

List<SeeAll> seeAll = seeAllData
    .map(
      (item) => SeeAll(item['id'], item['image'], item['name']),
    )
    .toList();

var seeAllData = [
  {"id": "1", "name": "Seekr", "image": "assets/see4.jpg"},
  {"id": "2", "name": "Seekr", "image": "assets/see4.jpg"},
  {"id": "3", "name": "Seekr", "image": "assets/see4.jpg"},
  {"id": "4", "name": "Seekr", "image": "assets/see4.jpg"},
  {"id": "5", "name": "Seekr", "image": "assets/see4.jpg"},
];
