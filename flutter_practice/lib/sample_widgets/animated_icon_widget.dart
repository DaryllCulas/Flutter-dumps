import 'package:flutter/material.dart';

class AnimatedIconHere extends StatefulWidget {
  const AnimatedIconHere({super.key});

  @override
  State<AnimatedIconHere> createState() => _AnimatedIconHereState();
}

class _AnimatedIconHereState extends State<AnimatedIconHere>
    with TickerProviderStateMixin {
  bool _isPlay = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_isPlay == false) {
            _controller.forward();
            _isPlay = true;
          } else {
            _controller.reverse();
            _isPlay = false;
          }
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _controller,
          size: 100,
        ),
      ),
    );
  }
}
