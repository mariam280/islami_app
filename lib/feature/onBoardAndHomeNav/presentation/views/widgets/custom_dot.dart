import 'package:flutter/material.dart';
import 'package:islami_app/constant.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 30 : 6,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive ? kPrimaryolor : const Color(0xFF707070),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
