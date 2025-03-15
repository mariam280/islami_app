import 'package:flutter/material.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/onBoardAndHomeNav/presentation/views/widgets/main_nav_icon.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar(
      {super.key, required this.onTap, required this.currentIndex});
  final Function(int) onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 430 / 80,
      child: Container(
        color: kPrimaryolor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MainNavIcon(
                onTap: () => onTap(0),
                image: Assets.imagesVector,
                isSelected: currentIndex == 0),
            MainNavIcon(
                onTap: () => onTap(1),
                image: Assets.imagesPage1,
                isSelected: currentIndex == 1),
            MainNavIcon(
                onTap: () => onTap(2),
                image: Assets.imagesNecklaceIslamSvgrepoCom1,
                isSelected: currentIndex == 2),
            MainNavIcon(
                onTap: () => onTap(3),
                image: Assets.imagesVectorr,
                isSelected: currentIndex == 3),
          ],
        ),
      ),
    );
  }
}
