import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoadingController extends GetxController
    with SingleGetTickerProviderMixin {
  late Animation opacity;
  late AnimationController animationController;
  late Animation heartAnimation;
  late AnimationController heartAnimationController;

  animatedlogo() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 40000),
      vsync: this,
    );
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(animationController)
      ..addListener(() {});
    animationController.forward();
    heartAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    heartAnimation = Tween(
      begin: 130.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: heartAnimationController,
      ),
    );
    heartAnimationController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          heartAnimationController.repeat();
        }
      },
    );
    heartAnimationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    heartAnimationController.dispose();
  }
}
