import 'package:flutter/material.dart';
import 'package:screen_animation_challenge/controllers/base_animation_controller.dart';

class SizeController extends BaseAnimationController {
  late final Animation<double> animation;

  static const double minScale = 1.0;

  static const double maxScale = 2.0;

  @override
  void onInit() {
    super.onInit();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    animation = Tween<double>(
      begin: minScale,
      end: maxScale,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }
}
