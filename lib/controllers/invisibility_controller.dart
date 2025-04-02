import 'package:flutter/material.dart';
import 'package:screen_animation_challenge/controllers/base_animation_controller.dart';

class InvisibilityController extends BaseAnimationController {
  late final Animation<double> animation;

  static const double minOpacity = 0.0;

  static const double maxOpacity = 1.0;

  @override
  void onInit() {
    super.onInit();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    animation = Tween<double>(
      begin: maxOpacity,
      end: minOpacity,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }
}
