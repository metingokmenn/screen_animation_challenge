import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController controller;

  final RxBool isActive = false.obs;

  static const Duration animationDuration = Duration(seconds: 1);

  @override
  void onInit() {
    super.onInit();
    _initializeController();
  }

  void _initializeController() {
    controller = AnimationController(
      duration: animationDuration,
      vsync: this,
    );
  }

  void toggle() {
    try {
      isActive.value = !isActive.value;
      if (isActive.value) {
        forward();
      } else {
        reverse();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to toggle animation: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void forward() => controller.forward();

  void reverse() => controller.reverse();

  void reset() => controller.reset();

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
