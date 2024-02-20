import 'package:flutter/material.dart';

class AnimatedAlignmentWidget extends StatefulWidget {
  const AnimatedAlignmentWidget({super.key});

  @override
  State<AnimatedAlignmentWidget> createState() =>
      _AnimatedAlignmentWidgetState();
}

class _AnimatedAlignmentWidgetState extends State<AnimatedAlignmentWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: double.infinity,
          height: 250.0,
          color: Colors.blueGrey,
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(size: 50.0),
          ),
        ),
      ),
    );
  }
}
