import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/utils/app_images.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem(
      {super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.imagesVector), label: 'Azkar'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.imagesNecklaceIslamSvgrepoCom1),
              label: 'Sebha'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.imagesRadioSvgrepoCom1),
              label: 'Quran'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.imagesVectorr), label: 'Time'),
        ]);
  }
}
