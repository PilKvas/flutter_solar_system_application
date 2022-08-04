import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String buttontTitle;
  final void Function()? onPressed;
  final dynamic buttonBackgroundColor;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const TextButtonWidget(
      {Key? key,
      required this.buttontTitle,
      required this.onPressed,
      this.buttonBackgroundColor,
      required this.buttonStyle,
      required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        buttontTitle,
        style: textStyle,
      ),
    );
  }
}

// class ButtonRowWidget extends StatefulWidget {
//   final Color buttonBackgroundColor;
//   final List<Widget> children;
//   const ButtonRowWidget({Key? key, required this.buttonBackgroundColor, required this.children})
//       : super(key: key);

//   @override
//   _ButtonRowWidgetState createState() => _ButtonRowWidgetState();
// }

// class _ButtonRowWidgetState extends State<ButtonRowWidget> {

//   void onOverviewPressed() {
//     setState(() {
//       CurrentTabVariable.currentTab = TabState.overview;
//     });
//   }

//   void onStructurePressed() {
//     setState(() {
//       CurrentTabVariable.currentTab = TabState.structure;
//     });
//   }

//   void onSurfacePressed() {
//     setState(() {
//       CurrentTabVariable.currentTab = TabState.surface;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ButtonBar(
//       alignment: MainAxisAlignment.spaceEvenly,
//       children: widget.children,
//     );
//   }
// }
