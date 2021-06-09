part of 'models.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contenst = [
  UnbordingContent(
      title: 'Play games, earn money!',
      image: 'assets/a.jpeg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  UnbordingContent(
      title: 'Think and do it!',
      image: 'assets/b.jpeg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  UnbordingContent(
      title: 'And get your reward!',
      image: 'assets/c.jpeg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
];
