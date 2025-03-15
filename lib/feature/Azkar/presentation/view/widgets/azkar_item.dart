import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem({super.key, required this.onTap, required this.title});
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: Color(0xFF202020),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Color(0xFFE2BE7F)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(Assets.imagesCommentBubbleIcon1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold20(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
