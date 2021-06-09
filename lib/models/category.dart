import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String category;

  Category({this.id, this.category});

  @override
  List<Object> get props => [id, category];
}

List<Category> categories = [
  Category(
    id: 1,
    category: "SEEKR",
  ),
  Category(
    id: 2,
    category: "TokoPedia",
  ),
  Category(
    id: 3,
    category: "Shopee",
  ),
  Category(
    id: 4,
    category: "Sport",
  ),
  Category(
    id: 5,
    category: "Education",
  ),
  Category(
    id: 6,
    category: "SEEKR",
  ),
  Category(
    id: 7,
    category: "Tokopedia",
  ),
];
