import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AzkarDetailViewHeader extends StatelessWidget {
  const AzkarDetailViewHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(Assets.imagesMaskgroup1),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.styleBold24(context),
          ),
        ),
        Image.asset(Assets.imagesMaskgroup2),
      ],
    );
  }
}
