import 'package:flutter/material.dart';

class SpinningLoader extends StatefulWidget {
  const SpinningLoader({
    super.key,
    required this.imagePath, // e.g. 'assets/loader.png'
    this.size = 25,
    this.secondsPerRotation = 1.2,
  });

  final String imagePath;
  final double size;
  final double secondsPerRotation;

  @override
  State<SpinningLoader> createState() => _SpinningLoaderState();
}

class _SpinningLoaderState extends State<SpinningLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: Duration(
      milliseconds: (widget.secondsPerRotation * 1000).round(),
    ),
  )..repeat();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: RotationTransition(
        turns: _ctrl,
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
