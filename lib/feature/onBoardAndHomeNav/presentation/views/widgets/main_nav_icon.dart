import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainNavIcon extends StatelessWidget {
  const MainNavIcon({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.image,
  });
  final VoidCallback onTap;
  final String image;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isSelected ? ActiveIcon(image: image) : SvgPicture.asset(image),
    );
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 59,
      height: 34,
      decoration: ShapeDecoration(
        color: Color(0x99202020),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(66),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
