import 'package:flutter/material.dart';
import 'package:screen_animation_challenge/controllers/base_animation_controller.dart';

class MovementController extends BaseAnimationController {
  late final Animation<Offset> animation;

  static const Offset startPosition = Offset.zero;

  static const Offset endPosition = Offset(0.0, 1.5);

  @override
  void onInit() {
    super.onInit();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    animation = Tween<Offset>(
      begin: startPosition,
      end: endPosition,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }
}
