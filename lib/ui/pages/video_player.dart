part of 'pages.dart';

class Video extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  // final bool autoplay;
  Video(
      {@required this.videoPlayerController,
      this.looping,
      // this.autoplay,
      Key key})
      : super(key: key);
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        looping: widget.looping,
        // autoPlay: widget.autoplay,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.videoPlayerController.dispose();
  //   _chewieController.dispose();
  // }
}
