import 'package:flutter/material.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.number, required this.ayaText});
  final int number;
  final String ayaText;
  @override
Widget build(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center, 
    text: TextSpan(
      text: ayaText, 
      style: AppStyles.styleBold20(context).copyWith(
        color: kPrimaryolor,
        height: 2),
      children: [
        TextSpan(
          text: '  $number', 
          style: AppStyles.styleBold20(context).copyWith(
            color: kPrimaryolor,
            height: 2,
          ),
        ),
      ],
    ),
  );
}

  
 /* Widget build(BuildContext context) {
    return Text(
      '$ayaText  $number',
      textAlign: TextAlign.center,
      style: AppStyles.styleBold16(context).copyWith(
        height: 1.5,
      ),
    );
  }*/
}
