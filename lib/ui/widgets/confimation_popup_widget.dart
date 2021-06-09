part of 'widgets.dart';

class ConfirmationPopup extends StatelessWidget {
  const ConfirmationPopup({
    Key key,
    @required this.context,
    @required this.dialogContext,
  }) : super(key: key);

  final BuildContext context;
  final BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      overlayColor: Colors.black87,
      isCloseButton: true,
      isOverlayTapDismiss: true,
      titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      descStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      animationDuration: Duration(milliseconds: 400),
    );

    Alert(
        context: dialogContext,
        style: alertStyle,
        title: "Detete?",
        desc: "Are you sure you want to delete this Gatekeeper?",
        buttons: [
          DialogButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: mainColor,
          ),
          DialogButton(
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: mainColor,
          )
        ]).show();
  }
}
