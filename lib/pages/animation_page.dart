import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/base_animation_controller.dart';
import '../controllers/invisibility_controller.dart';
import '../controllers/rotation_controller.dart';
import '../controllers/movement_controller.dart';
import '../controllers/size_controller.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final invisibilityController = Get.put(InvisibilityController());
    final rotationController = Get.put(RotationController());
    final movementController = Get.put(MovementController());
    final sizeController = Get.put(SizeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Showcase'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAnimationCard(
                  title: 'Invisibility Effect',
                  child: FadeTransition(
                    opacity: invisibilityController.animation,
                    child: _buildAnimationBox(
                      color: Colors.blue,
                      text: 'Invisibility\nSpell',
                    ),
                  ),
                  controller: invisibilityController,
                  activeIcon: Icons.visibility_off,
                  inactiveIcon: Icons.visibility,
                  activeText: 'Show',
                  inactiveText: 'Hide',
                ),
                const SizedBox(height: 16),
                _buildAnimationCard(
                  title: 'Rotation Effect',
                  child: RotationTransition(
                    turns: rotationController.animation,
                    child: const Icon(Icons.sailing, size: 100),
                  ),
                  controller: rotationController,
                  activeIcon: Icons.stop,
                  inactiveIcon: Icons.rotate_right,
                  activeText: 'Stop',
                  inactiveText: 'Rotate',
                ),
                const SizedBox(height: 16),
                _buildAnimationCard(
                  title: 'Movement Effect',
                  child: SlideTransition(
                    position: movementController.animation,
                    child: const Text(
                      'Movement Spell',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  controller: movementController,
                  activeIcon: Icons.arrow_upward,
                  inactiveIcon: Icons.arrow_downward,
                  activeText: 'Up',
                  inactiveText: 'Down',
                ),
                const SizedBox(height: 16),
                _buildAnimationCard(
                  title: 'Size Effect',
                  child: ScaleTransition(
                    scale: sizeController.animation,
                    child: _buildAnimationBox(
                      color: Colors.green,
                      text: 'Size\nSpell',
                    ),
                  ),
                  controller: sizeController,
                  activeIcon: Icons.zoom_out,
                  inactiveIcon: Icons.zoom_in,
                  activeText: 'Shrink',
                  inactiveText: 'Grow',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationBox({
    required Color color,
    required String text,
  }) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationCard({
    required String title,
    required Widget child,
    required BaseAnimationController controller,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required String activeText,
    required String inactiveText,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            child,
            const SizedBox(height: 16),
            Obx(() => ElevatedButton.icon(
                  onPressed: controller.toggle,
                  icon: Icon(
                    controller.isActive.value ? activeIcon : inactiveIcon,
                  ),
                  label: Text(
                    controller.isActive.value ? activeText : inactiveText,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
