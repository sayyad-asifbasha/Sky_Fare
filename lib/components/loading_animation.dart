import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  final double size;  // Specify the type of size
  final Color color;  // Add a color field

  const Loader({Key? key, required this.size, required this.color}) : super(key: key);  // Fix constructor

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.hexagonDots(
      color: color,
      size: size,
    );
  }
}
