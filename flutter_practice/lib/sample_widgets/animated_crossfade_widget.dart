import 'package:flutter/material.dart';

class AnimatedCrossfadeWidget extends StatefulWidget {
  const AnimatedCrossfadeWidget({super.key});

  @override
  State<AnimatedCrossfadeWidget> createState() =>
      _AnimatedCrossfadeWidgetState();
}

class _AnimatedCrossfadeWidgetState extends State<AnimatedCrossfadeWidget> {
  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
          height: 100,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _bool = !_bool;
            });
          },
          child: const Text(
            'Switch',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Image.asset(
            "images/eggheadArc.jpg",
            width: double.infinity,
          ),
          secondChild: Image.asset(
            "images/wanoArc.jpg",
            width: double.infinity,
          ),
          crossFadeState:
              _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
        ),
      ],
    );
  }
}
