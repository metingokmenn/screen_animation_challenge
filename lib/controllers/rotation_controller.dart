import 'package:flutter/material.dart';
import 'package:screen_animation_challenge/controllers/base_animation_controller.dart';
import 'package:get/get.dart';

class RotationController extends BaseAnimationController {
  late final Animation<double> animation;

  static const double startAngle = 0.0;

  static const double endAngle = 2 * 3.14159;

  @override
  void onInit() {
    super.onInit();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    animation = Tween<double>(
      begin: startAngle,
      end: endAngle,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void toggle() {
    try {
      isActive.value = !isActive.value;
      if (isActive.value) {
        controller.repeat();
      } else {
        controller.stop();
        controller.reverse();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to toggle rotation: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
