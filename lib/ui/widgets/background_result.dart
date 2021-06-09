part of 'widgets.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bg.png"),    
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        )
      ),
    );
  }
}